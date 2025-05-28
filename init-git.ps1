# Check if Git is already initialized
if (-not (Test-Path -Path ".git" -PathType Container)) {
    Write-Host "Initializing Git repository..." -ForegroundColor Green
    git init
    
    # Initial commit
    git add .
    git commit -m "Initial commit"
    
    Write-Host "Git repository initialized!" -ForegroundColor Green
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Yellow
}

# Instructions for next steps
Write-Host "`nTo create a GitHub repository, run:" -ForegroundColor Cyan
Write-Host "    .\setup-github.ps1" -ForegroundColor White