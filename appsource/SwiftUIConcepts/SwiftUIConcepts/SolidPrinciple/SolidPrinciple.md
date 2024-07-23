# Single Responsibility Principle (SRP)

Definition: A class should have only one reason to change, meaning that a class should have only one job or responsibility.
Explanation: By ensuring that a class has only one responsibility, it becomes easier to understand, maintain, and test. If a class has multiple responsibilities, changes to one responsibility can affect the others, leading to a more fragile and complex codebase.

# Open/Closed Principle (OCP)
Definition: Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.
Explanation: This principle encourages developers to write code that can be extended without changing existing code. This can be achieved through mechanisms such as inheritance, interfaces, and polymorphism, allowing new functionality to be added with minimal changes to existing code.

#Liskov Substitution Principle (LSP)
Definition: Objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program.
Explanation: Subtypes must be substitutable for their base types. This means that the derived classes must extend the base class without changing its behavior. This principle ensures that a subclass can stand in for its superclass without any issues.

#Interface Segregation Principle (ISP)

Definition: A client should not be forced to depend on interfaces it does not use.
Explanation: This principle advocates for creating smaller, more specific interfaces rather than a large, general-purpose one. By doing so, clients only need to know about the methods that are of interest to them, reducing the impact of changes and increasing flexibility.

#Dependency Inversion Principle (DIP)

Definition: High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions.
Explanation: This principle promotes the decoupling of software modules. By depending on abstractions rather than concrete implementations, you reduce the dependency on specific details, making the code more modular and easier to maintain.
