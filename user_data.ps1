# Install Chocolatey (Package Manager for Windows)
Write-Host "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Refresh environment to use choco immediately
$env:PATH += ";$($env:ALLUSERSPROFILE)\chocolatey\bin"

# Install Terraform via Chocolatey
Write-Host "Installing Terraform..."
choco install terraform -y

Write-Host "Terraform installation finished."

# Add Git aliases by updating the PowerShell profile
Write-Host "Configuring Git aliases..."

$profilePath = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

# Check if the profile file exists, and create it if not
if (-not (Test-Path -Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

# Append the custom aliases to the PowerShell profile
Add-Content -Path $profilePath -Value "`n# Custom Git Aliases"
Add-Content -Path $profilePath -Value "Set-Alias cb 'git checkout -b'"
Add-Content -Path $profilePath -Value "Set-Alias stat 'git status'"
Add-Content -Path $profilePath -Value "Set-Alias b 'git branch'"
Add-Content -Path $profilePath -Value "Set-Alias push 'git push'"
Add-Content -Path $profilePath -Value "Set-Alias add 'git add'"

# Reload the PowerShell profile to make the aliases available immediately
. $profilePath

Write-Host "Git aliases configured successfully."