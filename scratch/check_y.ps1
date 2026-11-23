Add-Type -AssemblyName System.Drawing
$img = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795213271744_505bc5f4.jpg')
for ($y = 0; $y -lt 250; $y += 5) {
    $p = $img.GetPixel(100, $y)
    Write-Output "Y=$y : R=$($p.R) G=$($p.G) B=$($p.B)"
}
$img.Dispose()
