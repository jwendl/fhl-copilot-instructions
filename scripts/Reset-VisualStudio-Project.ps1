param (
    [Parameter(Mandatory = $true)]
    [string]$scriptRootPath,

    [Parameter(Mandatory = $true)]
    [string]$rootPath
)

# Define the root path of your project
# $scriptRootPath = "C:\Source\GitHub\fhl-copilot-instructions"
# $rootPath = "C:\Source\GitHub\dnd-treasure-generator"
$gitHubPath = "$rootPath\.github"

# Delete all files in root path
Remove-Item -Path "$rootPath\*" -Recurse -Force

# Define your solution name and path
$solutionName = "TreasureGenerator"
$solutionPath = "$rootPath"

# Create the directories if they don't exist
if (!(Test-Path $gitHubPath)) {
    New-Item -ItemType Directory -Path $gitHubPath | Out-Null
}

if (!(Test-Path $solutionPath)) {
    New-Item -ItemType Directory -Path $solutionPath | Out-Null
}

# Navigate to the directory
Push-Location $solutionPath

# Create an empty solution file
$solutionFullPath = "$solutionPath\$solutionName.sln"
dotnet new sln --name $solutionName --output "$solutionPath" --force
Write-Host "✅ Empty solution '$solutionName.sln' created at $solutionPath"

Copy-Item -Path "$scriptRootPath\visual-studio\copilot-instructions.md" -Destination "$gitHubPath\copilot-instructions.md" -Force
Write-Host "✅ Copilot instructions copied from $scriptRootPath\visual-studio\copilot-instructions.md to $gitHubPath\copilot-instructions.md"

# Add file to solution
dotnet script "$scriptRootPath\scripts\inject-solution-item.csx"

# Open the solution in Visual Studio
Start-Process "devenv.exe" "$solutionFullPath"

# Return to the original directory
Pop-Location
