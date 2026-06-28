#!/bin/bash
#
# clean-dupes.sh - 清理 notes 目录下文件名相同（仅时间戳不同）的重复文件
# 用法: bash .claude/scripts/clean-dupes.sh [-f]
#   -f  强制删除（跳过确认）
#

set -euo pipefail

# 切换到 notes 目录（脚本在 .claude/scripts/ 下，需要向上两级）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
NOTES_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$NOTES_DIR"

echo "=========================================="
echo "  重复文件清理工具"
echo "  工作目录: $(pwd)"
echo "=========================================="
echo ""

# 获取强制模式
FORCE=false
[[ "${1:-}" == "-f" ]] && FORCE=true

# 创建临时目录
TMPDIR=$(mktemp -d)
trap "rm -rf '$TMPDIR'" EXIT

# 第一步：找出所有 .md 文件，提取时间戳和基础名称
echo "[1/4] 扫描文件..."

# 格式: 时间戳|基础名称|完整文件名
> "$TMPDIR/files.txt"

# 使用 sed 提取时间戳和基础名称
for file in *.md; do
    # 尝试提取时间戳格式：YYYYMMDDTHHMMSS
    timestamp=$(echo "$file" | sed -E 's/^([0-9]{8}T[0-9]{6})[=-]+.*/\1/' 2>/dev/null)
    base=$(echo "$file" | sed -E 's/^[0-9]{8}T[0-9]{6}[=-]+//' 2>/dev/null)
    
    # 如果提取到了时间戳（且与原文件名不同）
    if [[ -n "$timestamp" && "$timestamp" != "$file" ]]; then
        echo "$timestamp|$base|$file" >> "$TMPDIR/files.txt"
    fi
done

# 检查是否有文件被扫描
if [[ ! -s "$TMPDIR/files.txt" ]]; then
    echo ""
    echo "❌ 没有找到任何 .md 文件！"
    echo ""
    exit 1
fi

echo "  扫描完成，找到 $(wc -l < "$TMPDIR/files.txt" | tr -d ' ') 个时间戳文件"

# 第二步：找出重复的基础名称
echo "[2/4] 分析重复项..."

# 找出重复的基础名称，并保存到文件
awk -F'|' '{print $2}' "$TMPDIR/files.txt" | sort | uniq -c | awk '$1>1 {print $2}' > "$TMPDIR/dupe_bases.txt"

# 如果没有重复，直接退出
if [[ ! -s "$TMPDIR/dupe_bases.txt" ]]; then
    echo ""
    echo "✅ 没有发现重复文件！"
    echo ""
    exit 0
fi

# 第三步：对每组重复，按时间戳排序，保留最新的
echo "[3/4] 确定要删除的文件..."

> "$TMPDIR/to_delete.txt"
> "$TMPDIR/to_keep.txt"

while IFS= read -r base; do
    [[ -z "$base" ]] && continue
    
    # 获取该基础名称的所有文件，按时间戳排序
    grep -F "|$base|" "$TMPDIR/files.txt" | sort -t'|' -k1,1 > "$TMPDIR/group.txt"
    
    # 获取行数
    lines=$(wc -l < "$TMPDIR/group.txt" | tr -d ' ')
    
    if [[ $lines -gt 1 ]]; then
        # 最后一个是要保留的（最新）
        tail -1 "$TMPDIR/group.txt" | cut -d'|' -f3 >> "$TMPDIR/to_keep.txt"
        
        # 前面的都是要删除的
        head -n $((lines - 1)) "$TMPDIR/group.txt" | cut -d'|' -f3 >> "$TMPDIR/to_delete.txt"
    fi
done < "$TMPDIR/dupe_bases.txt"

# 显示结果
DUPE_COUNT=$(wc -l < "$TMPDIR/dupe_bases.txt" | tr -d ' ')
DELETE_COUNT=$(wc -l < "$TMPDIR/to_delete.txt" | tr -d ' ')

echo ""
echo "=========================================="
echo "  发现 $DUPE_COUNT 组重复文件"
echo "=========================================="
echo ""

# 显示每组重复的详细信息
while IFS= read -r base; do
    [[ -z "$base" ]] && continue
    echo "📁 $base"
    
    # 从 group.txt 中获取该基础名称的所有文件
    grep -F "|$base|" "$TMPDIR/files.txt" | sort -t'|' -k1,1 | while IFS='|' read -r ts b fname; do
        if [[ "$fname" == "$(tail -1 "$TMPDIR/group.txt" | cut -d'|' -f3)" ]]; then
            echo "   ✅ 保留: $fname"
        else
            echo "   ❌ 删除: $fname"
        fi
    done
    echo ""
done < "$TMPDIR/dupe_bases.txt"

echo "=========================================="
echo "  总计: 将删除 $DELETE_COUNT 个文件"
echo "=========================================="
echo ""

# 确认删除
if [[ "$FORCE" != true ]]; then
    read -p "确认删除以上文件？(y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ 已取消"
        exit 1
    fi
fi

# 第四步：执行删除
echo "[4/4] 删除文件..."
DELETED=0
FAILED=0

while IFS= read -r file; do
    [[ -z "$file" ]] && continue
    if rm -v "$file" 2>/dev/null; then
        ((DELETED++))
    else
        echo "❌ 失败: $file"
        ((FAILED++))
    fi
done < "$TMPDIR/to_delete.txt"

echo ""
echo "=========================================="
echo "  清理完成"
echo "  成功: $DELETED"
echo "  失败: $FAILED"
echo "  剩余: $(ls -1 *.md 2>/dev/null | wc -l | tr -d ' ') 个文件"
echo "=========================================="
echo ""

# 验证
echo "[验证] 检查是否还有重复..."

# 重新检查
> "$TMPDIR/files2.txt"
for file in *.md; do
    base=$(echo "$file" | sed -E 's/^[0-9]{8}T[0-9]{6}[=-]+//' 2>/dev/null)
    [[ -n "$base" ]] && echo "$base" >> "$TMPDIR/files2.txt"
done

REMAINING=$(sort "$TMPDIR/files2.txt" | uniq -c | awk '$1>1' | wc -l | tr -d ' ')

if [[ $REMAINING -eq 0 ]]; then
    echo "✅ 没有剩余重复文件！"
else
    echo "⚠️  仍有 $REMAINING 组重复，可能需要手动检查"
fi
echo ""
