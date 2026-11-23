Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Image]::FromFile('C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\a8989532-6be4-4e6c-b6e2-4a6f65109590\browser_sandbox\screenshots\step_2.png')

$crop = New-Object System.Drawing.Bitmap(1024, 600)
$g = [System.Drawing.Graphics]::FromImage($crop)
$g.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, 1024, 600)), (New-Object System.Drawing.Rectangle(0, 0, [Math]::Min(1024, $img.Width), [Math]::Min(600, $img.Height))), [System.Drawing.GraphicsUnit]::Pixel)
$g.Dispose()
$crop.Save('C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\scratch\browser_hero.jpg')
$crop.Dispose()
$img.Dispose()
Write-Output "Saved browser_hero.jpg"
