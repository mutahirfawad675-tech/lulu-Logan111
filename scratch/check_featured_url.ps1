[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$urls = @('https://just1realestate.com/featured-listings', 'https://just1realestate.com/featured-properties', 'https://just1realestate.com/properties')
foreach ($u in $urls) {
    try {
        $html = (New-Object System.Net.WebClient).DownloadString($u)
        Write-Output "URL: $u -> Length: $($html.Length)"
    } catch {
        Write-Output "URL: $u -> Error: $_"
    }
}
