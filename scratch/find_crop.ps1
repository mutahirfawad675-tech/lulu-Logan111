Add-Type -AssemblyName System.Drawing

$hero = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\buying-hero.jpg')
$user = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795210305830_16fb44a7.jpg')

Write-Output "Hero size: $($hero.Width)x$($hero.Height)"
Write-Output "User size: $($user.Width)x$($user.Height)"

# In user image:
# Top has navbar (height ~60px out of 342px).
# Bottom is lawn right above where pool starts.
# Let's crop hero from Y_start to Y_end across full width.
# In hero (2400x1500):
# Roof is at top ~0-350px.
# 2nd floor windows are ~300-500px.
# Patio/overhang is ~550-950px.
# Stepping stones & lawn is ~950-1180px.
# Pool starts around ~1180px!

# Let's find exactly where pool starts in hero:
for ($y = 1000; $y -lt 1400; $y += 20) {
    $p = $hero.GetPixel(1200, $y)
    Write-Output "Y=$y : R=$($p.R) G=$($p.G) B=$($p.B)"
}

$hero.Dispose()
$user.Dispose()
