param (
    [Parameter(Mandatory = $true)]
    [string]$scriptRootPath,

    [Parameter(Mandatory = $true)]
    [string]$rootPath,

    [Parameter(Mandatory = $true)]
    [string]$oneDrivePath
)

# Define the root path of your project
# $scriptRootPath = "C:\Source\GitHub\fhl-copilot-instructions"
# $rootPath = "C:\Source\GitHub\dnd-treasure-generator"
# $oneDrivePath = "C:\Users\jwendl\OneDrive - jwendl.net\Documents\RolePlaying\Dungeons and Dragons\Markdown"
$gitHubPath = "$rootPath\.github"
$dataPath = "$rootPath\data"

# Delete all files in root path
Remove-Item -Path "$rootPath\*" -Recurse -Force

# Define your solution name and path
$solutionName = "TreasureGenerator"
$solutionPath = "$rootPath"
$dotnetVersion = "net9.0"

# Create the directories if they don't exist
if (!(Test-Path $gitHubPath)) {
    New-Item -ItemType Directory -Path $gitHubPath | Out-Null
}

if (!(Test-Path $dataPath)) {
    New-Item -ItemType Directory -Path $dataPath | Out-Null
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

# Create new projects
dotnet new blazor --name "$solutionName.Web" --framework $dotnetVersion
dotnet new classlib --name "$solutionName.Data" --framework $dotnetVersion
dotnet new xunit --name "$solutionName.Tests" --framework $dotnetVersion
Write-Host "✅ Created new projects: $solutionName.Web, $solutionName.Data, $solutionName.Tests"

# Add projects to the solution
dotnet sln "$solutionFullPath" add "$solutionName.Web/$solutionName.Web.csproj"
dotnet sln "$solutionFullPath" add "$solutionName.Data/$solutionName.Data.csproj"
dotnet sln "$solutionFullPath" add "$solutionName.Tests/$solutionName.Tests.csproj"
Write-Host "✅ Added projects to solution"

# Copy data files
Copy-Item -Path "$oneDrivePath\*.md" -Destination "$dataPath" -Force

# Open the solution in Visual Studio
Start-Process "devenv.exe" "$solutionFullPath"

# Return to the original directory
Pop-Location
