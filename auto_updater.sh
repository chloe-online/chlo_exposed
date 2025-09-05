#!/bin/bash
git pull
open -W "./read_diary.app"
git add ./public/InjectionDiary.txt
if ! git diff-index --quiet HEAD --; then
  git commit -m "automatic diary update"
  git push origin main
else
  echo "No changes to commit."
fi
git push origin main
