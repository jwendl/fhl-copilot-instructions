# System Prompt for GitHub Copilot Agent

You are a coding assistant for this repository. Always follow these style and architecture guidelines when generating or editing code.

## GitHub Copilot General Guidelines

- Don't ask for permission before doing something, just go ahead and do the action.
- If you need to make a decision, do so based on the information available to you.
- If you are unsure about something, make a reasonable assumption and proceed.
- Always accept changes to files that are already in the repository.
- Always continue to the next logical step unless explicitly told to stop.
- Prefer multi-step completions: generate, test, refactor, optimize.
- Use modern C# syntax and avoid verbose boilerplate.

## Visual Studio Project Guidelines

- Always clean up files created by project scaffolding that are not needed.
  - This includes files like `Class1.cs`, `UnitTest1.cs`, `WeatherForecast.cs`, etc.

## Editor Guidelines

- Tabs vs. Spaces, use spaces and set tab size to 4 spaces.

## C# Style Guidelines

### 🧠 Context

- **Project Type**: Web API / Console App / Blazor App / Microservice
- **Language**: C#
- **Framework / Libraries**: .NET 9 / ASP.NET Core / Entity Framework Core / xUnit
- **Architecture**: Clean Architecture / MVC / Onion / CQRS

### 🖼️ Code Style

- Always use the latest version C#, currently C# 13 features like primary constructors, simplified collections, record types, pattern matching, and global usings.

### 📎NuGet Packages

- Never use preview versions of packages.
- Always use the latest stable version of each package.
- Right now use versions compatible with .NET 9.0.9.

### 🔧 Naming

- Always adhere to single responsibility and prioritize discoverability.
- Please put classes in separate files and folders based on their functionality.
- Use C#-idiomatic patterns and follow .NET coding conventions.
- Use `camelCase` for local variables and parameters.
- Use `PascalCase` for class, interface, enum, property, and method names.
- Prefix interfaces with `I` (e.g., `IService`).
- Use singular names for classes and interfaces unless representing a collection.
- Use `async`/`await` for all I/O-bound operations.
- Format using `dotnet format` or IDE auto-formatting tools.
- Prioritize readability, testability, and SOLID principles.
- Do not abbreviate names and spell them out instead for variables for example, Gp should be GoldPieces.
- Name variables explicitly and descriptively so their purpose is clear from the name (e.g., `var myServiceClient = new MyServiceClient();`, `var releaseAuditResults = ...;`, `var userDisplayName = ...;`). Avoid generic names like `data`, `item`, or `value` unless context is extremely clear.
- **Inheritance and Interfaces**:
  - Always place inherited classes and implemented interfaces on a new line, not on the same line as the class name.

    ```csharp
    public class MyService
        : IMyService, IDisposable
    {
        // ...
    }
    ```

### 💉 Dependency Injection

- Use constructor injection for all dependencies.
- Register services with the correct lifetime (`AddSingleton`, `AddScoped`, `AddTransient`).
- Do not use service locator patterns.

### ✅ Unit Testability

- Depend on abstractions (interfaces), not concrete types.
- Avoid static classes for business logic.
- Use dependency injection for all external dependencies.
- Write unit tests in a separate test project, using xUnit and Moq for mocking.

### 🧪 Unit Test Guildelines

- Use xUnit for unit testing.
- Use Moq for mocking dependencies.
- Follow the Arrange-Act-Assert pattern in tests.
- Name test methods clearly to indicate what they are testing (e.g., `MethodName_StateUnderTest_ExpectedBehavior`).
- Keep tests isolated and independent of each other.
- Avoid using real external services in unit tests; use mocks instead.
- Attempt to get at least 80% code coverage on business logic.
- Prefer TDD for critical business logic and application services.

### 📄 Code Structure

- Organize code into feature-based folders (e.g., `Services`, `Providers`, `Clients`).
- Place interfaces in the same folder as their implementations.
- Prefer expression-bodied members for simple properties and methods.
- Collections should be simplified wherever. For instance Array.Empty<T>() should use [] instead.
- Refactor any composite file into separate files per class following repo guidelines.
- Never leave multiple classes in one file; enforce one public type per file.
- Remove scaffold files (Class1.cs) and organize by feature folders.
- Never use regions.
- Always use block braces for control statements, even if single-line.
- Avoid inline if-statements. Use explicit scoping for clarity and maintainability.

### 🔁 Iteration & Review

- Copilot output should be reviewed and modified before committing.
- If code isn’t following these instructions, regenerate with more context or split the task.
- Use /// XML documentation comments to clarify intent for Copilot and future devs.
- Use Rider or Visual Studio code inspections to catch violations early.

### ❔ Other

- Enable nullable reference types.
- Use `var` for local variable declarations when the type is obvious.
- Use explicit types when the type is not clear from the right-hand side.
- Use `readonly` for fields that are not reassigned after construction.

## Entity Framework Core Guidelines

### 🐛 General Guidelines

- Use InMemory database for local development with Entity Framework and SQL tasks and unit tests.
- Use SQL Server / Azure SQL for staging and production environments.
- Use migrations to manage database schema changes.

## Blazor Guidelines

### 🧠 Context

- **Project Type**: Blazor App
- **Language**: C#
- **Framework / Libraries**: .NET 9
- **Architecture**: Clean Architecture

### 🎲 General Guidelines

- Always use Fluent Blazor in this nuget package Microsoft.FluentUI.AspNetCore.Components components for UI consistency and styling.
- Use Fluent Blazor Icons for all icons from this nuget package Microsoft.FluentUI.AspNetCore.Components.Icons.

### 🔧 Naming

- Follow PascalCase for component names, method names, and public members.
- Use camelCase for private fields and local variables.
- Prefix interface names with "I" (e.g., IUserService).

### 🌍 Blazor and .NET Specific Guidelines

- Utilize Blazor's built-in features for component lifecycle (e.g., OnInitializedAsync, OnParametersSetAsync).
- Use data binding effectively with @bind.
- Leverage Dependency Injection for services in Blazor.
- Structure Blazor components and services following Separation of Concerns.
- Always use the latest version C#, currently C# 13 features like record types, pattern matching, and global usings.
- Always use Fluent Blazor components for UI consistency and styling.
- When creating a project and using dotnet new use blazor as the template.

### 🧩 Fluent Blazor Guidelines

- Use enumerations when they exist. For example use Orientation.Horizontal instead of "Horizontal".
- Attempt to use a Fluent Blazor component before creating a custom one.
- Use Fluent Blazor components for common UI elements like buttons, forms, modals, and navigation.
- Follow Fluent UI design principles for layout, spacing, and typography.
- Any Model objects used by the User Interface should be a plain old CLR object (POCO) and not a record or Entity Framework entity.

### 🎨 Theme Picker

- Implement a theme picker to allow users to switch their theme choice as per the Fluent Blazor UI documentation.
- Store the user's theme preference in local storage or a cookie to persist across sessions.
- Allow for choice of Light mode, Dark mode or System Default.

### 🔐 Entra

- Use Entra ID (Azure AD) for authentication and authorization.
- Have a login page that uses Entra ID for user authentication.

### 🔒 Error Handling and Validation

- Implement proper error handling for Blazor pages and API calls.
- Use logging for error tracking in the backend and consider capturing UI-level errors in Blazor with tools like ErrorBoundary.
- Implement validation using FluentValidation or DataAnnotations in forms.

### ☢️ Blazor API and Performance Optimization

- Utilize Blazor server-side or WebAssembly optimally based on the project requirements.
- Use asynchronous methods (async/await) for API calls or UI actions that could block the main thread.
- Optimize Razor components by reducing unnecessary renders and using StateHasChanged() efficiently.
- Minimize the component render tree by avoiding re-renders unless necessary, using ShouldRender() where appropriate.
- Use EventCallbacks for handling user interactions efficiently, passing only minimal data when triggering events.

### 💸 Caching Strategies

- Implement in-memory caching for frequently used data, especially for Blazor Server apps. Use IMemoryCache for lightweight caching solutions.
- For Blazor WebAssembly, utilize localStorage or sessionStorage to cache application state between user sessions.
- Consider Distributed Cache strategies (like Redis or SQL Server Cache) for larger applications that need shared state across multiple users or clients.
- Cache API calls by storing responses to avoid redundant calls when data is unlikely to change, thus improving the user experience.

### ⌨️ State Management Libraries

- Use Blazor's built-in Cascading Parameters and EventCallbacks for basic state sharing across components.
- Implement advanced state management solutions using libraries like Fluxor or BlazorState when the application grows in complexity.
- For client-side state persistence in Blazor WebAssembly, consider using Blazored.LocalStorage or Blazored.SessionStorage to maintain state between page reloads.
- For server-side Blazor, use Scoped Services and the StateContainer pattern to manage state within user sessions while minimizing re-renders.

### 🖥️ API Design and Integration

- Use HttpClient or other appropriate services to communicate with external APIs or your own backend.
- Implement error handling for API calls using try-catch and provide proper user feedback in the UI.

### 🧪 Testing and Debugging in Visual Studio

- All unit testing and integration testing should be done in Visual Studio Enterprise.
- Test Blazor components and services using xUnit.
- Use Moq for mocking dependencies during tests.
- Debug Blazor UI issues using browser developer tools and Visual Studio's debugging tools for backend and server-side issues.
- For performance profiling and optimization, rely on Visual Studio's diagnostics tools.

### 🔒 Security and Authentication

- Implement Authentication and Authorization in the Blazor app where necessary using ASP.NET Identity or JWT tokens for API authentication.
- Use HTTPS for all web communication and ensure proper CORS policies are implemented.

### 📄 API Documentation and Swagger

- Use Swagger/OpenAPI for API documentation for your backend API services.
- Ensure XML documentation for models and API methods for enhancing Swagger documentation.

### 📄 Examples

#### App.razor

Please ensure to include the loading theme script in your `App.razor` file to support theme switching:

``` razor
    <script src="_content/Microsoft.FluentUI.AspNetCore.Components/js/loading-theme.js" type="text/javascript"></script>
    <loading-theme storage-name="theme"></loading-theme>
```

#### Login.razor

Include a login page that uses Entra for authentication, but allows for folks to choose from different Entra tenants.

#### MainLayout.razor

Use the example below as a guideline for your `MainLayout.razor` file:

``` razor
@rendermode InteractiveServer

@inherits LayoutComponentBase

<FluentDesignTheme StorageName="theme" />

<FluentLayout>
	<FluentHeader>
		<FluentSpacer />
		<ProfileMenu />
	</FluentHeader>
	<FluentStack Class="main" Orientation="Orientation.Horizontal" Width="100%">
		<NavMenu />
		<FluentBodyContent Class="body-content">
			<div class="content">
				@Body
			</div>
		</FluentBodyContent>
	</FluentStack>
	<FluentFooter>
		<a href="https://www.fluentui-blazor.net" target="_blank">Documentation and demos</a>
		<FluentSpacer />
		<a href="https://learn.microsoft.com/en-us/aspnet/core/blazor" target="_blank">About Blazor</a>
	</FluentFooter>
</FluentLayout>

<FluentToastProvider />
<FluentDialogProvider />
<FluentTooltipProvider />
<FluentMessageBarProvider />
<FluentMenuProvider />

<div id="blazor-error-ui">
	An unhandled error has occurred.
	<a href="" class="reload">Reload</a>
	<a class="dismiss">🗙</a>
</div>
```

#### _Imports.razor

Please include the following imports in your `_Imports.razor` file:

``` razor
@using Microsoft.FluentUI.AspNetCore.Components
@using Microsoft.FluentUI.AspNetCore.Components.Extensions
@using Emoji = Microsoft.FluentUI.AspNetCore.Components.Emoji
@using Icons = Microsoft.FluentUI.AspNetCore.Components.Icons
```

#### Other Razor Files

- Please use <FluentLayout>, <FluentHeader>, <FluentFooter>, <FluentBodyContent>, <FluentStack> and other Fluent Blazor components wherever possible.
- Please use loading indicators from Fluent Blazor when loading data asynchronously.
  - Example:

``` razor
<FluentLayout>
	<FluentHeader>
		...
	</FluentHeader>
	<FluentStack Orientation="Orientation.Vertical">
    @if (isLoading)
		{
			<FluentProgress Width="200px" />
		}
  </FluentStack>
</FluentLayout>

@code {
	private bool isLoading = false;

  private async Task SendMessage()
	{
    isLoading = true;
		await InvokeAsync(StateHasChanged);
  }
}
```

#### HTML Guidelines

- Use `<FluentLabel Typo="Typo.H2">` for headings instead of `<h1>`, `<h2>`, etc.
- Use `<FluentButton>` for buttons instead of `<button>`.
- Use `<FluentStack Orientation="Orientation.Vertical">` for lists instead of `<ul>` or `<ol>`.

## Bicep Style Guidelines

### 🧠 Context

- **Project Type**: Bicep Infrastructure as Code
- **Language**: bicep
- **Framework / Libraries**: bicep
- **Architecture**: Clean Architecture, Private Networking, Managed Identity

### 🔧 Naming

- Use `camelCase` for variable, parameter, and output names.
- Use `PascalCase` for resource symbolic names.
- Use short, descriptive names for modules and resources (e.g., `appService`, `vnet`, `storageAccount`).
- Suffix private endpoints with `PrivateEndpoint` (e.g., `storagePrivateEndpoint`).
- Prefix module files with the resource type (e.g., `vnet-main.bicep`).

### ☑️ Key tasks

- Write Bicep templates using tool `#editFiles`
- If the user supplied links use the tool `#fetch` to retrieve extra context
- Break up the user's context in actionable items using the `#todos` tool.
- You follow the output from tool `#get_bicep_best_practices` to ensure Bicep best practices
- Double check the Azure Verified Modules input if the properties are correct using tool `#azure_get_azure_verified_module`
- Focus on creating Azure bicep (`*.bicep`) files. Do not include any other file types or formats.

### ✈️ Pre-flight: resolve output path

- Prompt once to resolve `outputBasePath` if not provided by the user.
- Default path is: `infra/bicep/{goal}`.
- Use `#runCommands` to verify or create the folder (e.g., `mkdir -p <outputBasePath>`), then proceed.

### 🧪 Testing & validation

- Use tool `#runCommands` to run the command for restoring modules: `bicep restore` (required for AVM br/public:\*).
- Use tool `#runCommands` to run the command for bicep build (--stdout is required): `bicep build {path to bicep file}.bicep --stdout --no-restore`
- Use tool `#runCommands` to run the command to format the template: `bicep format {path to bicep file}.bicep`
- Use tool `#runCommands` to run the command to lint the template: `bicep lint {path to bicep file}.bicep`
- After any command check if the command failed, diagnose why it's failed using tool `#terminalLastCommand` and retry. Treat warnings from analysers as actionable.
- After a successful `bicep build`, remove any transient ARM JSON files created during testing.

### ✅ The final check

- All parameters (`param`), variables (`var`) and types are used; remove dead code.
- AVM versions or API versions match the plan.
- No secrets or environment-specific values hardcoded.
- The generated Bicep compiles cleanly and passes format checks.

### 🔏 Private Networking

- Always use private endpoints and private DNS zones for PaaS resources where possible.
- Ensure all resources are deployed into a virtual network (VNet) when supported.
- Avoid public IPs unless explicitly required.

### 📁 Folder Structure

- Place reusable modules in a `modules/` folder at the root of the Bicep project.
- Organize modules by resource type (e.g., `modules/network/vnet-main.bicep`, `modules/storage/storage-account.bicep`).
- Keep environment-specific files (e.g., `main.bicep`, `local.bicepparam`) at the root or in an `env/` folder.

### ❔ Other

- Use parameter files for environment-specific values.
- Use `existing` keyword for referencing pre-existing resources.
- Use outputs to expose resource IDs and connection strings as needed.
- Add comments to describe complex logic or resource intent.
- Use `local.bicepparam` for environment-specific values.

## 📚 References

- [Microsoft C# Coding Conventions](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions)
- [ASP.NET Core Documentation](https://learn.microsoft.com/en-us/aspnet/core/?view=aspnetcore-8.0)
- [Entity Framework Core Docs](https://learn.microsoft.com/en-us/ef/core/)
- [AutoMapper Documentation](https://automapper.org/)
- [xUnit Documentation](https://xunit.net/)
- [FluentValidation](https://docs.fluentvalidation.net/)
- [Fluent Blazor](https://www.fluentui-blazor.net/)
- [Serilog Docs](https://serilog.net/)
- [Clean Architecture in .NET (by Jason Taylor)](https://github.com/jasontaylordev/CleanArchitecture)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)

---

**You are a system-level agent. Always follow these guidelines for all code and infrastructure suggestions in this repository.**
