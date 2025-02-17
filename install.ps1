# Ensure the script is running with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Run as Administrator." -ForegroundColor Red
    exit
}

# Temporarily bypass the execution policy
Set-ExecutionPolicy Bypass -Scope Process -Force

# Function to check if a command exists
function Command-Exists {
    param ([string]$Command)
    return Get-Command $Command -ErrorAction SilentlyContinue | Out-Null
}

# Variable to track if installations are needed
$installChocolatey = -not (Command-Exists 'choco')
$installMongoDB = -not (Command-Exists 'mongod') -and (Command-Exists 'choco')
$installMongosh = -not (Command-Exists 'mongosh') -and (Command-Exists 'choco')

# Install Chocolatey if needed
if ($installChocolatey) {
    try {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
        $chocoInstallScript = (New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')
        # Redirect all output to $Null
        $Null = Invoke-Expression $chocoInstallScript *> $Null
    } catch {
        Write-Host "Installation error." -ForegroundColor Red
        exit
    }
}

# Install MongoDB if needed
if ($installMongoDB) {
    try {
        $Null = choco install mongodb -y *> $Null
    } catch {
        Write-Host "Installation error." -ForegroundColor Red
        exit
    }
}

# Install MongoDB Shell (mongosh) if needed
if ($installMongosh) {
    try {
        $Null = choco install mongosh -y *> $Null
    } catch {
        Write-Host "Installation error." -ForegroundColor Red
        exit
    }
}

# Final check
if ((-not $installChocolatey -or (Command-Exists 'choco')) -and
    (-not $installMongoDB -or (Command-Exists 'mongod')) -and
    (-not $installMongosh -or (Command-Exists 'mongosh'))) {
    Write-Host "All required software is installed." -ForegroundColor Green
} else {
    Write-Host "Some software is missing." -ForegroundColor Red
}
