
#!/bin/bash
# MIME タイプ別

mime_types=(
  # テキスト
  "text/plain"          # .txt
  "text/html"           # .html, .htm
  "text/css"            # .css
  "text/javascript"     # .js
  "text/csv"            # .csv
  "text/xml"            # .xml
  "text/markdown"       # .md
  "application/json"    # .json

  # 文書
  "application/pdf"     # .pdf
  "application/msword"  # .doc
  "application/vnd.openxmlformats-officedocument.wordprocessingml.document" # .docx
  "application/vnd.ms-excel" # .xls
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" # .xlsx
  "application/vnd.ms-powerpoint" # .ppt
  "application/vnd.openxmlformats-officedocument.presentationml.presentation" # .pptx

  # 画像
  "image/jpg"			# .jpg
  "image/jpeg"          # .jpeg
  "image/png"           # .png
  "image/gif"           # .gif
  "image/bmp"           # .bmp
  "image/webp"          # .web
  "image/svg+xml"       # .svg

  # 音楽
  "audio/mp3"			# .mp3
  "audio/mpeg"          # .mpeg
  "audio/wav"           # .wav
  "audio/ogg"           # .ogg
  "audio/flac"          # .flac
  "audio/aac"           # .aac

  # 動画
  "video/mp4"           # .mp4
  "video/mpeg"          # .mpeg, .mpg - MPEG 비디오
  "video/webm"          # .webm - WebM 비디오
  "video/ogg"           # .ogv - OGG 비디오
  "video/x-msvideo"     # .avi - AVI 비디오
  "video/quicktime"     # .mov - QuickTime 비디오

  # 圧縮
  "application/zip"     # .zip
  "application/x-rar-compressed" # .rar
  "application/x-tar"   # .tar
  "application/gzip"    # .gz
  "application/x-7z-compressed" # .7z
)

# 분류별로 출력
echo "=== テキスト ==="
for mime in "${mime_types[@]:0:7}"; do
  echo -n "$mime: "
  app=$(xdg-mime query default "$mime")
  if [ -n "$app" ]; then
    echo "$app"
  else
    echo "なし"
  fi
done

echo -e "\n=== 文書 ==="
for mime in "${mime_types[@]:7:7}"; do
  echo -n "$mime: "
  app=$(xdg-mime query default "$mime")
  if [ -n "$app" ]; then
    echo "$app"
  else
    echo "なし"
  fi
done

echo -e "\n=== 画像 ==="
for mime in "${mime_types[@]:14:7}"; do
  echo -n "$mime: "
  app=$(xdg-mime query default "$mime")
  if [ -n "$app" ]; then
    echo "$app"
  else
    echo "なし"
  fi
done

echo -e "\n=== 音楽 ==="
for mime in "${mime_types[@]:20:6}"; do
  echo -n "$mime: "
  app=$(xdg-mime query default "$mime")
  if [ -n "$app" ]; then
    echo "$app"
  else
    echo "なし"
  fi
done

echo -e "\n=== 動画 ==="
for mime in "${mime_types[@]:26:6}"; do
  echo -n "$mime: "
  app=$(xdg-mime query default "$mime")
  if [ -n "$app" ]; then
    echo "$app"
  else
    echo "なし"
  fi
done

echo -e "\n=== 圧縮 ==="
for mime in "${mime_types[@]:32:5}"; do
  echo -n "$mime: "
  app=$(xdg-mime query default "$mime")
  if [ -n "$app" ]; then
    echo "$app"
  else
    echo "なし"
  fi
done

echo -e "\n"

