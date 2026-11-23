[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$html = $wc.DownloadString('https://just1realestate.com/properties/sale')
Write-Output "Length: $($html.Length)"

# Find images
$matches = [regex]::Matches($html, 'https://media-production\.lp-cdn\.com/[^"''\s\)]+')
$seen = @{}
foreach ($m in $matches) {
    if (-not $seen.ContainsKey($m.Value)) {
        $seen[$m.Value] = $true
        Write-Output $m.Value
    }
}
