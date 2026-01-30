#!/usr/bin/env bash
set -e

# Get untracked files
untracked_files=$(git ls-files --others --exclude-standard)

# Get modified files (unstaged + staged)
modified_unstaged=$(git diff --name-only)
modified_staged=$(git diff --cached --name-only)

# Combine all files and remove duplicates
all_files=$(printf "%s\n%s\n%s\n" \
  "$untracked_files" \
  "$modified_unstaged" \
  "$modified_staged" | sort -u | sed '/^$/d')

# Comprehensive commit message for AUSD ERC-20 on Base
commit_message="Added tests and production-ready implementation for AUSD ERC-20 token on Base Network. Fully compliant ERC-20 stable token designed for Base L2 ecosystem, featuring capped supply, owner-controlled minting, secure burn functionality, and Foundry-based test suite. Optimized for Base’s low transaction costs and fast finality. Includes deployment scripts, extensive unit tests, and OpenZeppelin-based security patterns using Solidity ^0.8.20."

# Commit each file individually
for file in $all_files; do
  echo "Committing: $file"
  git add "$file"
  git commit --only "$file" -m "$commit_message - $file"
done

# Push commits
git push --set-upstream origin main
