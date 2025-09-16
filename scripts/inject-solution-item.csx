#r "nuget: Microsoft.VisualStudio.SolutionPersistence, 1.0.52"

using System;
using System.Threading;
using Microsoft.VisualStudio.SolutionPersistence.Serializer;

var solutionPath = @"C:\Source\GitHub\dnd-treasure-generator\TreasureGenerator.sln";
var fileToAdd = @".github\copilot-instructions.md";

var serializer = SolutionSerializers.GetSerializerByMoniker(".sln");
if (serializer != null)
{
	var solution = await serializer.OpenAsync(solutionPath, CancellationToken.None);
	if (!solution.SolutionFolders.Any())
	{
		solution.AddFolder("/Solution Items/");
		var folder = solution.SolutionFolders[0];
		folder.AddFile(fileToAdd);
	}

	await serializer.SaveAsync(solutionPath, solution, CancellationToken.None);
}
