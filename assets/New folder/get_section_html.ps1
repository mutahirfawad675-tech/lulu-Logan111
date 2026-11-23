$c = Get-Content -Raw "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\testimonials_live.html"
$idx1 = $c.IndexOf('class="testimonials-list"')
if ($idx1 -lt 0) {
    $idx1 = $c.IndexOf('testimonials__item')
}
Write-Output "Index: $idx1"
if ($idx1 -ge 0) {
    $start = [Math]::Max(0, $idx1 - 200)
    $len = [Math]::Min($c.Length - $start, 4000)
    Write-Output $c.Substring($start, $len)
}
