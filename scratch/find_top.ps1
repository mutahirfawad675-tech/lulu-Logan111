Add-Type -AssemblyName System.Drawing

$hero = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\buying-hero.jpg')

# Let's inspect along Y at X=1200 (center)
for ($y = 200; $y -lt 600; $y += 20) {
    $p = $hero.GetPixel(1200, $y)
    Write-Output "Y=$y : R=$($p.R) G=$($p.G) B=$($p.B)"
}

$hero.Dispose()
