Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\insights-room.jpg')
Write-Output "insights-room: $($img.Width)x$($img.Height)"
$thumb = $img.GetThumbnailImage(200, 80, $null, [IntPtr]::Zero)
$thumb.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\scratch\thumb_insights_room.jpg')
$img.Dispose()
$thumb.Dispose()
