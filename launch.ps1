# Lance Morning Brief via un serveur HTTP local (evite les erreurs CORS file://)

$envPath = "A:\Claude\Root\.env"
$appDir  = "A:\Workspace\Repository\morning-brief"
$port    = 3000

# Lire la cle API
$key = ""
foreach ($line in Get-Content $envPath) {
    if ($line -match '^ANTHROPIC_API_KEY=(.+)$') {
        $key = $Matches[1].Trim()
        break
    }
}

if (-not $key) {
    Write-Host "Cle ANTHROPIC_API_KEY manquante dans $envPath" -ForegroundColor Red
    Write-Host "Renseigne-la puis relance ce script."
    pause
    exit 1
}

# Injecter la cle dans localStorage via page de bootstrap temporaire
$initPath = "$appDir\_init.html"
$html = @"
<!DOCTYPE html>
<script>
localStorage.setItem('mb_apikey', '$key');
location.replace('http://localhost:$port/index.html');
</script>
"@
Set-Content -Path $initPath -Value $html -Encoding utf8

# Demarrer le serveur HTTP Python en arriere-plan
$server = Start-Process -FilePath "python" `
    -ArgumentList "-m", "http.server", $port, "--directory", $appDir `
    -PassThru -WindowStyle Hidden

Write-Host "Serveur demarre sur http://localhost:$port" -ForegroundColor Green

# Laisser le serveur demarrer
Start-Sleep -Seconds 1

# Ouvrir la page de bootstrap dans le navigateur
Start-Process "http://localhost:$port/_init.html"

# Attendre que le navigateur charge puis supprimer le bootstrap
Start-Sleep -Seconds 3
Remove-Item -Path $initPath -Force -ErrorAction SilentlyContinue

Write-Host "Morning Brief ouvert. Ferme cette fenetre pour arreter le serveur." -ForegroundColor Cyan
Write-Host "Appuie sur une touche pour stopper..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Arreter le serveur
Stop-Process -Id $server.Id -Force -ErrorAction SilentlyContinue
Write-Host "Serveur arrete." -ForegroundColor Gray
