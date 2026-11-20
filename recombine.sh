#!/usr/bin/env bash
set -e
cat << 'EOF' > concat_list.txt
file '2026-11-20_23-31-17_part01.mp4'
file '2026-11-20_23-31-17_part02.mp4'
file '2026-11-20_23-31-17_part03.mp4'
file '2026-11-20_23-31-17_part04.mp4'
file '2026-11-20_23-31-17_part05.mp4'
file '2026-11-20_23-31-17_part06.mp4'
EOF

echo "Recombining 6 parts into 2026-11-20_23-31-17.mp4..."
ffmpeg -y -f concat -safe 0 -i concat_list.txt -c copy "2026-11-20_23-31-17.mp4"
rm concat_list.txt
echo "Recombination complete: 2026-11-20_23-31-17.mp4"
