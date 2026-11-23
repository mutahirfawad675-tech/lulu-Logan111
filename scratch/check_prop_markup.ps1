[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$html = $wc.DownloadString('https://just1realestate.com/properties/sale')

# Look for property addresses in html
$addresses = @('FROST', 'DUTCH CREEK', 'ORINDA', 'OHIO', 'LAKESHORE')
foreach ($a in $addresses) {
    $idx = $html.IndexOf($a)
    if ($idx -ne -1) {
        $start = [Math]::Max(0, $idx - 300)
        $len = [Math]::Min(800, $html.Length - $start)
        Write-Output "=== Found $a ==="
        Write-Output $html.Substring($start, $len)
    }
}
