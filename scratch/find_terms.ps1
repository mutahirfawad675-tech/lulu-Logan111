[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$html = $wc.DownloadString('https://just1realestate.com/properties/sale')
$terms = @('Frost', 'Dutch', 'Orinda', 'Ohio', 'Lakeshore')
foreach ($t in $terms) {
    $idx = $html.IndexOf($t, [System.StringComparison]::OrdinalIgnoreCase)
    Write-Output "$t index: $idx"
}
