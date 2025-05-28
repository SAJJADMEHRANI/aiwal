Write-Host "Setting up new GitHub repository for AIWAL project..." -ForegroundColor Green

# Check if GitHub CLI is installed
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "GitHub CLI is not installed. Please install it first." -ForegroundColor Red
    Write-Host "Visit: https://cli.github.com/manual/installation" -ForegroundColor Yellow
    exit 1
}

# Ensure user is logged in to GitHub
Write-Host "Checking GitHub authentication..." -ForegroundColor Cyan
try {
    gh auth status -q
} catch {
    Write-Host "Please login to GitHub:" -ForegroundColor Yellow
    gh auth login
}

# Ask for repository name
$repoName = Read-Host "Enter repository name (default: aiwal)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "aiwal"
}

# Ask for repository visibility
$isPrivate = Read-Host "Make repository private? (y/n, default: n)"
if ([string]::IsNullOrWhiteSpace($isPrivate)) {
    $isPrivate = "n"
}

$privacyFlag = "--public"
if ($isPrivate -eq "y" -or $isPrivate -eq "Y") {
    $privacyFlag = "--private"
}

# Create the repository
Write-Host "Creating repository $repoName..." -ForegroundColor Cyan
gh repo create $repoName --source=. $privacyFlag --push

# Get the username
$username = gh api user | ConvertFrom-Json | Select-Object -ExpandProperty login

# Set the remote
git remote set-url origin "https://github.com/$username/$repoName.git"

Write-Host "Repository created and code pushed!" -ForegroundColor Green
Write-Host "Visit: https://github.com/$username/$repoName" -ForegroundColor Cyan

# Provide instructions for next steps
Write-Host "`nNext steps:" -ForegroundColor Green
Write-Host "1. Update the repository URL in the README.md" -ForegroundColor Yellow
Write-Host "2. Clone the repository on your server" -ForegroundColor Yellow
Write-Host "3. Follow the Docker setup instructions in the README.md" -ForegroundColor Yellow