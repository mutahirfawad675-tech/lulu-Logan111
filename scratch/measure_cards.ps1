Add-Type -AssemblyName System.Drawing
$img = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795213271744_505bc5f4.jpg')

# Check white background vs image along row Y=100
Write-Output "Image width: $($img.Width), height: $($img.Height)"
$inImg = $false
$start = 0
for ($x = 0; $x -lt $img.Width; $x++) {
    $p = $img.GetPixel($x, 100)
    $isWhite = ($p.R -gt 245 -and $p.G -gt 245 -and $p.B -gt 245)
    if (-not $isWhite -and -not $inImg) {
        $inImg = $true
        $start = $x
    } elseif ($isWhite -and $inImg) {
        $inImg = $false
        Write-Output "Image from X=$start to X=$x (width = $($x - $start))"
    }
}
if ($inImg) {
    Write-Output "Image from X=$start to X=$($img.Width) (width = $($img.Width - $start))"
}

# Check vertical extent of image in first column (around X=100)
$top = 0
$bottom = 0
$inV = $false
for ($y = 0; $y -lt $img.Height; $y++) {
    $p = $img.GetPixel(100, $y)
    $isWhite = ($p.R -gt 245 -and $p.G -gt 245 -and $p.B -gt 245)
    if (-not $isWhite -and -not $inV) {
        $inV = $true
        $top = $y
    } elseif ($isWhite -and $inV) {
        $inV = $false
        $bottom = $y
        break
    }
}
Write-Output "Image vertical from Y=$top to Y=$bottom (height = $($bottom - $top))"

$img.Dispose()
