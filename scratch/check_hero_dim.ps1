Add-Type -AssemblyName System.Drawing
$h = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\featured-hero.jpg')
$u = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795211548038_f4e699c9.jpg')
Write-Output "Downloaded Hero: $($h.Width) x $($h.Height)"
Write-Output "Uploaded Screenshot: $($u.Width) x $($u.Height)"
$h.Dispose()
$u.Dispose()
