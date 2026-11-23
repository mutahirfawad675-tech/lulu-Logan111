Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\buying-hero.jpg')
$cropRect = New-Object System.Drawing.Rectangle(0, 390, $src.Width, 780)
$bmp = New-Object System.Drawing.Bitmap($cropRect.Width, $cropRect.Height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.DrawImage($src, (New-Object System.Drawing.Rectangle(0, 0, $bmp.Width, $bmp.Height)), $cropRect, [System.Drawing.GraphicsUnit]::Pixel)
$g.Dispose()

$bmp.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\scratch\cropped_preview.jpg', [System.Drawing.Imaging.ImageFormat]::Jpeg)

# Also create a thumbnail to view with read_file
$thumb = $bmp.GetThumbnailImage(320, 104, $null, [IntPtr]::Zero)
$thumb.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\scratch\thumb_cropped.jpg', [System.Drawing.Imaging.ImageFormat]::Jpeg)

$src.Dispose()
$bmp.Dispose()
$thumb.Dispose()
Write-Output "Created cropped_preview.jpg and thumb_cropped.jpg"
