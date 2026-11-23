[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")

$images = [ordered]@{
    'trivalley-hero.jpg' = 'https://media-production.lp-cdn.com/media/olo3oydpt6sezqnguzrg'
    'area-pleasanton.jpg' = 'https://media-production.lp-cdn.com/media/f65de3ef-c65c-4002-bee5-55563a594875'
    'area-livermore.jpg' = 'https://media-production.lp-cdn.com/media/b50ffa62-bd56-4897-b10e-dff055b25e3b'
    'area-dublin.jpg' = 'https://media-production.lp-cdn.com/media/eb84cfd0-c4c8-4a28-86a0-6f0171ec2820'
}

$dir = 'C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images'

foreach ($k in $images.Keys) {
    $dest = Join-Path $dir $k
    $url = $images[$k]
    try {
        $wc.DownloadFile($url, $dest)
        $item = Get-Item $dest
        Write-Output "Downloaded $k - $($item.Length) bytes"
    } catch {
        Write-Output "Failed $k"
    }
}
