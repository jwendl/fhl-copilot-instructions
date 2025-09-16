# Discoveries Before Copilot Instructions

## Fluent Blazor Issues
- Used "Accent" vs. Appearance.Accent

## EF Issues

## ASP.NET Issues

## Code Style Issues
- No magic numbers. Use readonly constants to represent values in the code. For example, instead of 1 - 13, use minValueInSeries and maxValueInSerie, or readonly uint numberOfCardsInDeck = 52 instead of 52
- Always use curly braces for block of code, even if block is only one line. For example:
if (condition)
{
    // single line of execution
}