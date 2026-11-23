[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$html = (New-Object System.Net.WebClient).DownloadString('https://just1realestate.com/buying')
Write-Output "HTML length: $($html.Length)"
$matches = [regex]::Matches($html, 'https?://[^\s"''<>\)]+')
foreach ($m in $matches) {
    if ($m.Value -match 'image|media|assets|photo|cdn') {
        Write-Output $m.Value
    }
}
