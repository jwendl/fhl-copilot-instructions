# Example Project Prompt

This is intended to be a copy / pasteable prompt to feed into GitHub copilot to give it a complex enough of a business scenario. This business scenario will hopefully highlight all of the edge cases that pop up when building a solution to a complicated problem.

```
Create a Dungeons and Dragons 2024 random treasure generator.

## Data Content

- Use the art-objects.md, gemstones.md and magic-items.md markdown files located in the data folder.
    - Migrate these files from markdown to json so they are easier to serialize and deserialize by the seed.
    - These files are the data sets for the chance of getting those items in each of those categories.
    - Please migrate the entire file(s) from markdown to json.
    - For the json files please set them in the project settings to "Content" and "Copy Always" and reference them from there vs. trying to reference them directly.
- Please use the json files to deserialize and use into the database seed for the application.

## Business Requirements

- The application will have a way to allow users to select the average party level to generate treasure for that level.
    - Please make this the easiest selection possible and do not just resort to text entry.
- The application should also give coins appropriate to the encounter as well (can be divded up between platinum, electrum, gold, silver, copper, etc. per D&D rules).

## Code Requirements

- Build an end to end solution with a user interface, database access and deployment scripts.
- The solution file will be named TreasureGenerator.sln found under C:\Source\GitHub\dnd-treasure-generator.
- Use these projects for the code: TreasureGenerator.Web, TreasureGenerator.Data, TreasureGenerator.Tests.

```
