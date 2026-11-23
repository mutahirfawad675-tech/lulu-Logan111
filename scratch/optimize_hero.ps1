Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\featured-hero.jpg')
$targetWidth = 2400
$targetHeight = [int]($src.Height * ($targetWidth / $src.Width)) # 1800

$bmp = New-Object System.Drawing.Bitmap($targetWidth, $targetHeight)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.DrawImage($src, 0, 0, $targetWidth, $targetHeight)
$g.Dispose()
$src.Dispose()

# Save with 85% quality JPEG
$codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]85)

$bmp.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\featured-hero.jpg', $codec, $encoderParams)
$bmp.Dispose()

$item = Get-Item 'C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\featured-hero.jpg'
Write-Output "Optimized featured-hero.jpg: $($item.Length) bytes ($targetWidth x $targetHeight)"
