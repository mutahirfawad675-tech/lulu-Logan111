[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$html = (New-Object System.Net.WebClient).DownloadString('https://just1realestate.com/buying/')
$matches = [regex]::Matches($html, 'https://images\.ctfassets\.net/[^"''\s\)]+')
$urls = @()
foreach ($m in $matches) {
    if (-not $urls.Contains($m.Value)) {
        $urls += $m.Value
        Write-Output $m.Value
    }
}
