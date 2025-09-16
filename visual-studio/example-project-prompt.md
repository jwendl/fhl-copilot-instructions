# Example Project Prompt

This is intended to be a copy / pasteable prompt to feed into GitHub copilot to give it a complex enough of a business scenario. This business scenario will hopefully highlight all of the edge cases that pop up when building a solution to a complicated problem.

```
Create a Dungeons and Dragons 2024 random treasure generator.
Please use the art-objects.md, gemstones.md and magic-items.md markdown files located in the data folder here as a guideline to generate the data for the application.
Please expand the seed generation using these markdown files.
Build an end to end solution with a user interface, database access and deployment scripts.
The application will have a way to allow users to select the average party level to generate treasure for that level. Please make this the easiest selection possible and do not just resort to text entry.
The application should also give coins appropriate to the encounter as well (can be divded up between platinum, electrum, gold, silver, copper, etc. per D&D rules).
The solution file will be named TreasureGenerator.sln found under C:\Source\GitHub\dnd-treasure-generator.
The following projects will be there too: TreasureGenerator.Web, TreasureGenerator.Data, TreasureGenerator.Tests.
```
