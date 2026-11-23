[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$html = $wc.DownloadString('https://just1realestate.com/new-construction')

$matches = [regex]::Matches($html, 'https?://[^\s"''<>]+\.(?:svg|png|jpg|webp)')
foreach ($m in $matches) {
    if ($m.Value -match 'metrolist|mls|logo') {
        Write-Output $m.Value
    }
}
