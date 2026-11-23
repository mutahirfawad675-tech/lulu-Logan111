Get-ChildItem -Path "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate" -Filter "*.html" | ForEach-Object {
    $content = Get-Content -Path $_.FullName -Raw
    $hasHamburger = $content.Contains("hamburger")
    $hasSideMenu = $content.Contains("side-menu") -or $content.Contains("sidemenu")
    Write-Host "$($_.Name): hasHamburger=$hasHamburger, hasSideMenu=$hasSideMenu"
}
