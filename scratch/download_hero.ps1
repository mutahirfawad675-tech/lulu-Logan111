[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$url = "https://media-production.lp-cdn.com/media/2effad32-8f43-4093-ab77-3157bfe44fe7"
$dest = "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\images\featured-hero.jpg"
$wc.DownloadFile($url, $dest)
$item = Get-Item $dest
Write-Output "Downloaded featured-hero.jpg: $($item.Length) bytes"
