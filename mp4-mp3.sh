#!/bin/bash

for f in *.mp4; do
  [ -e "$f" ] || continue

  out="${f%.mp4}.mp3"

  echo "変換中: $f -> $out"
  ffmpeg -i "$f" -vn -acodec libmp3lame -q:a 2 "$out"
done

echo "完了"
