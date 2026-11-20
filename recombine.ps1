# Recombine the 6 segmented MP4 parts into the single intact original file
# Exact stream copy (-c copy): 0 re-encoding, 100% original quality
$concatList = "concat_list.txt"
@(
    "file '2026-11-20_23-31-17_part01.mp4'",
    "file '2026-11-20_23-31-17_part02.mp4'",
    "file '2026-11-20_23-31-17_part03.mp4'",
    "file '2026-11-20_23-31-17_part04.mp4'",
    "file '2026-11-20_23-31-17_part05.mp4'",
    "file '2026-11-20_23-31-17_part06.mp4'"
) | Out-File -FilePath $concatList -Encoding ascii

Write-Host "Recombining 6 parts into 2026-11-20_23-31-17.mp4..."
ffmpeg -y -f concat -safe 0 -i $concatList -c copy "2026-11-20_23-31-17.mp4"
Remove-Item $concatList
Write-Host "Recombination complete: 2026-11-20_23-31-17.mp4"
