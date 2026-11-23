Add-Type -AssemblyName System.Drawing

$shots = @(
    'media_1795213271744_505bc5f4.jpg', # 1-3
    'media_1795213297814_7c8d86a5.jpg', # 4-6
    'media_1795213311907_aafedea0.jpg', # 7-9
    'media_1795213332501_f8e16d38.jpg', # 10-12
    'media_1795213379091_57434a76.jpg', # 13-15
    'media_1795213399412_9025a951.jpg', # 16-18
    'media_1795213416055_cffb55f5.jpg', # 19-21
    'media_1795213435515_65046458.jpg', # 22-24
    'media_1795213449125_2f99b513.jpg', # 25-27
    'media_1795213465694_50104737.jpg', # 28-30
    'media_1795213479323_7fc528c7.jpg', # 31-33
    'media_1795213493770_868b4b02.jpg'  # 34-36
)

$baseDir = 'C:\Users\SHEIKH FAWAD\.gemini\antigravity\brain\662227d6-7bab-44aa-b0ce-eb05564e80cb\.user_uploaded'
$outDir = 'C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images'

$pIndex = 1

foreach ($shot in $shots) {
    $filePath = Join-Path $baseDir $shot
    $src = [System.Drawing.Image]::FromFile($filePath)
    
    # In some screenshots with titles (like 13-15 and 25-27), the Y position might be shifted down.
    # Let's detect the top of the cards in each screenshot:
    $topY = 8
    for ($y = 0; $y -lt 120; $y++) {
        $p = (New-Object System.Drawing.Bitmap($src)).GetPixel(100, $y)
        # If it's a non-white pixel with cyan or photo color
        if ($p.R -lt 240 -or $p.G -lt 240 -or $p.B -lt 240) {
            $topY = $y
            break
        }
    }
    
    # Find bottom Y (where white starts below the photo)
    $botY = $topY + 194
    for ($y = $topY + 150; $y -lt [Math]::Min($src.Height, $topY + 250); $y++) {
        $p = (New-Object System.Drawing.Bitmap($src)).GetPixel(100, $y)
        if ($p.R -gt 250 -and $p.G -gt 250 -and $p.B -gt 250) {
            $botY = $y
            break
        }
    }
    $h = $botY - $topY

    $colX = @(28, 355, 682)
    $colW = @(317, 318, 317)

    for ($c = 0; $c -lt 3; $c++) {
        $x = $colX[$c]
        $w = $colW[$c]
        
        $rect = New-Object System.Drawing.Rectangle($x, $topY, $w, $h)
        $bmp = New-Object System.Drawing.Bitmap($w, $h)
        $g = [System.Drawing.Graphics]::FromImage($bmp)
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $g.DrawImage($src, (New-Object System.Drawing.Rectangle(0, 0, $w, $h)), $rect, [System.Drawing.GraphicsUnit]::Pixel)
        $g.Dispose()

        $outPath = Join-Path $outDir "nc-p$pIndex.jpg"
        $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        $bmp.Dispose()
        Write-Output "Saved nc-p$pIndex.jpg ($w x $h)"
        $pIndex++
    }

    $src.Dispose()
}

Write-Output "Completed cropping all 36 property images!"
