[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
try {
    $sitemap = $wc.DownloadString('https://just1realestate.com/sitemap.xml')
    $matches = [regex]::Matches($sitemap, '<loc>([^<]+)</loc>')
    foreach ($m in $matches) {
        Write-Output $m.Groups[1].Value
    }
} catch {
    Write-Output "Sitemap error: $_"
}
