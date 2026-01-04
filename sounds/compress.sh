for file in *.opus; do
  ffmpeg -i "$file" -c:a libopus -b:a 24k -application voip "low/${file%.opus}.opus"
done
