Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\workwithus-bg.jpg')
Write-Output "workwithus-bg: $($img.Width)x$($img.Height)"
$thumb = $img.GetThumbnailImage(200, 80, $null, [IntPtr]::Zero)
$thumb.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\scratch\thumb_workwithus.jpg')
$img.Dispose()
$thumb.Dispose()
