[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
$html = $wc.DownloadString('https://just1realestate.com/new-construction')
$idx = $html.IndexOf('MetroList', [System.StringComparison]::OrdinalIgnoreCase)
if ($idx -ne -1) {
    Write-Output $html.Substring([Math]::Max(0, $idx - 200), 500)
} else {
    Write-Output "MetroList not found directly in HTML"
}
