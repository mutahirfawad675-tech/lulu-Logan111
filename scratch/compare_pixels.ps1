Add-Type -AssemblyName System.Drawing
$b1 = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\buying-hero.jpg')
$b2 = New-Object System.Drawing.Bitmap('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795210305830_16fb44a7.jpg')

Write-Output "b1 pixel (100, 100): $($b1.GetPixel(100, 100))"
Write-Output "b2 pixel (100, 100): $($b2.GetPixel(100, 100))"
Write-Output "b1 center pixel ($([int]($b1.Width/2)), $([int]($b1.Height/2))): $($b1.GetPixel([int]($b1.Width/2), [int]($b1.Height/2)))"
Write-Output "b2 center pixel ($([int]($b2.Width/2)), $([int]($b2.Height/2))): $($b2.GetPixel([int]($b2.Width/2), [int]($b2.Height/2)))"

$b1.Dispose()
$b2.Dispose()
