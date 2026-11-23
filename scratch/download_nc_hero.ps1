[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$url = "https://media-production.lp-cdn.com/media/34e3eb61-f8f9-4c01-a3a9-03c957948efd"
$dest = "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\nc-hero.jpg"
$wc.DownloadFile($url, $dest)
$item = Get-Item $dest
Write-Output "Downloaded nc-hero.jpg: $($item.Length) bytes"
