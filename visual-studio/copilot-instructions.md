# System Prompt for GitHub Copilot Agent (GPT-4.1)

You are a coding assistant for this repository. Always follow these style and architecture guidelines when generating or editing code.

## C# Style Guidelines

## NuGet Packages
- Never use preview versions of packages.
- Always use the latest stable version of packages.

### Naming
- Use `camelCase` for local variables and parameters.
- Use `PascalCase` for class, interface, enum, property, and method names.
- Prefix interfaces with `I` (e.g., `IService`).
- Use singular names for classes and interfaces unless representing a collection.
- Name variables explicitly and descriptively so their purpose is clear from the name (e.g., `var myServiceClient = new MyServiceClient();`, `var releaseAuditResults = ...;`, `var userDisplayName = ...;`). Avoid generic names like `data`, `item`, or `value` unless context is extremely clear.
- **Inheritance and Interfaces**:
  - Always place inherited classes and implemented interfaces on a new line, not on the same line as the class name.
    - Example:
      ```csharp
      public class MyService
          : IMyService, IDisposable
      {
          // ...
      }
      ```
- **Dependency Injection**:
  - Use constructor injection for all dependencies.
  - Register services with the correct lifetime (`AddSingleton`, `AddScoped`, `AddTransient`).
  - Do not use service locator patterns.
- **Unit Testability**:
  - Depend on abstractions (interfaces), not concrete types.
  - Avoid static classes for business logic.
  - Use dependency injection for all external dependencies.
  - Write unit tests in a separate test project, using xUnit and Moq for mocking.
- **Unit Tests**:
  - Use xUnit for unit testing.
  - Use Moq for mocking dependencies.
  - Follow the Arrange-Act-Assert pattern in tests.
  - Name test methods clearly to indicate what they are testing (e.g., `MethodName_StateUnderTest_ExpectedBehavior`).
  - Keep tests isolated and independent of each other.
  - Avoid using real external services in unit tests; use mocks instead.
  - Attempt to get at least 80% code coverage on business logic.
- **Code Structure**:
  - Organize code into feature-based folders (e.g., `Services`, `Providers`, `Clients`).
  - Place interfaces in the same folder as their implementations.
  - Use `async`/`await` for all I/O-bound operations.
  - Prefer expression-bodied members for simple properties and methods.
- **Other**:
  - Enable nullable reference types.
  - Use `var` for local variable declarations when the type is obvious.
  - Use explicit types when the type is not clear from the right-hand side.
  - Use `readonly` for fields that are not reassigned after construction.

## Bicep Style Guidelines

- **Naming Conventions**:
  - Use `camelCase` for variable, parameter, and output names.
  - Use `PascalCase` for resource symbolic names.
  - Use short, descriptive names for modules and resources (e.g., `appService`, `vnet`, `storageAccount`).
  - Suffix private endpoints with `PrivateEndpoint` (e.g., `storagePrivateEndpoint`).
  - Prefix module files with the resource type (e.g., `vnet-main.bicep`).
- **Private Networking**:
  - Always use private endpoints and private DNS zones for PaaS resources where possible.
  - Ensure all resources are deployed into a virtual network (VNet) when supported.
  - Avoid public IPs unless explicitly required.
- **Folder Structure**:
  - Place reusable modules in a `modules/` folder at the root of the Bicep project.
  - Organize modules by resource type (e.g., `modules/network/vnet-main.bicep`, `modules/storage/storage-account.bicep`).
  - Keep environment-specific files (e.g., `main.bicep`, `local.bicepparam`) at the root or in an `env/` folder.
- **Other**:
  - Use parameter files for environment-specific values.
  - Use `existing` keyword for referencing pre-existing resources.
  - Use outputs to expose resource IDs and connection strings as needed.
  - Add comments to describe complex logic or resource intent.
  - Use `local.bicepparam` for environment-specific values.

---

**You are a system-level agent. Always follow these guidelines for all code and infrastructure suggestions in this repository.**
