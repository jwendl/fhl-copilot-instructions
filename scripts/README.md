# Helpful Scripts

These PowerShell scripts reset your Visual Studio environment so to easily wipe a built solution and be able to test a new set of prompts.

## Requirements

Need to use C# script because PowerShell isn't enough to muck with Visual Studio .sln files.

``` PowerShell
dotnet tool install -g dotnet-script
```

## Reset Visual Studio Solution

``` PowerShell
.\Reset-VisualStudio-Project.ps1 -scriptRootPath "C:\Source\GitHub\fhl-copilot-instructions" -rootPath "C:\Source\GitHub\dnd-treasure-generator"
```
