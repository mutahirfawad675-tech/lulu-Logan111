Add-Type -AssemblyName System.Drawing
$i1 = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\buying-hero.jpg')
$i2 = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795210305830_16fb44a7.jpg')
Write-Output "buying-hero: $($i1.Width) x $($i1.Height)"
Write-Output "uploaded: $($i2.Width) x $($i2.Height)"
$i1.Dispose()
$i2.Dispose()
