Add-Type -AssemblyName System.Drawing

$img1 = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\buying-hero.jpg')
$img2 = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795210305830_16fb44a7.jpg')

Write-Output "Image 1 (buying-hero.jpg): $($img1.Width)x$($img1.Height)"
Write-Output "Image 2 (uploaded): $($img2.Width)x$($img2.Height)"

# Let's save a thumbnail or inspect what Image 1 is
$thumb1 = $img1.GetThumbnailImage(200, 125, $null, [IntPtr]::Zero)
$thumb1.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\scratch\thumb_hero.jpg')

$img1.Dispose()
$img2.Dispose()
$thumb1.Dispose()
Write-Output "Saved thumb_hero.jpg"
