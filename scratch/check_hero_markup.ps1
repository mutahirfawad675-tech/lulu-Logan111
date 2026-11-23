[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$html = (New-Object System.Net.WebClient).DownloadString('https://just1realestate.com/buying')
$idx = $html.IndexOf('33ef52ea-052e-4db8-8491-ebad466600db')
if ($idx -ne -1) {
    $start = [Math]::Max(0, $idx - 300)
    $len = [Math]::Min(1000, $html.Length - $start)
    Write-Output $html.Substring($start, $len)
}
