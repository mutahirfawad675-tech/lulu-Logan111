Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded\media_1795213271744_505bc5f4.jpg')
Write-Output "Screenshot 3 size: $($img.Width) x $($img.Height)"
$img.Dispose()
