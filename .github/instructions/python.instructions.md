---
description: 'Python coding conventions and guidelines based on Google Python Style Guide'
applyTo: '**/*.py'
---

# Python Coding Conventions (Google Style Guide)

## Language Rules

### Type Annotations
- **Strongly encouraged** for public APIs and complex code
- Use built-in generics (e.g., `list[str]`, `dict[str, int]`) for Python 3.9+
- Use `X | None` instead of `Optional[X]` for Python 3.10+
- Annotate function parameters and return types when beneficial for clarity

### Imports
- Use `import x` for importing packages and modules
- Use `from x import y` where `x` is the package prefix and `y` is the module name
- Import each module using its full pathname location
- Group imports: future imports, standard library, third-party, local imports
- Sort imports lexicographically within each group

### Exception Handling
- Use built-in exception classes when appropriate (e.g., `ValueError`, `TypeError`)
- Do not use `assert` for validating preconditions in production code
- Never catch all exceptions with bare `except:` or `except Exception:`
- Minimize code in `try`/`except` blocks

### Default Arguments
- Do not use mutable objects as default values
- Use `None` as default and check in function body:
  ```python
  def foo(a, b: list[str] | None = None):
      if b is None:
          b = []
  ```

## Style Rules

### Line Length and Formatting
- **Maximum line length: 80 characters**
- Use implicit line joining with parentheses, brackets, and braces
- Avoid backslash line continuation
- Break lines at the highest possible syntactic level

### Indentation
- Use **4 spaces** per indentation level, never tabs
- Use hanging 4-space indent for continuation lines
- Align wrapped elements vertically when using opening delimiter alignment

### Naming Conventions
- **Modules/Packages**: `lower_with_under`
- **Classes**: `CapWords`
- **Functions/Variables**: `lower_with_under()`
- **Constants**: `CAPS_WITH_UNDER`
- **Private attributes**: `_leading_underscore`
- Avoid single-character names except for iterators (`i`, `j`, `k`)

### Docstrings (Google Style)
- Use triple double quotes `"""`
- First line: concise summary ending with period
- Sections: `Args:`, `Returns:`, `Raises:`, `Yields:` (for generators)
- Format each argument with description after colon

### Whitespace
- No trailing whitespace
- Single space around binary operators (`=`, `==`, `+`, etc.)
- No space before comma, semicolon, or colon
- No space before opening paren/bracket for function calls or indexing
- Space after comma, semicolon, colon (except at end of line)

## Function and Class Guidelines

### Function Length
- Prefer small, focused functions (aim for under 40 lines)
- Break up long functions into smaller, manageable pieces
- Each function should have a single, clear purpose

### Documentation Requirements
- **Mandatory docstrings** for:
  - Public API functions
  - Non-trivial functions
  - Functions with non-obvious logic
- Include type information not provided by annotations
- Document side effects and exceptions

## Example Implementation

```python
"""Module for geometric calculations."""

import math
from typing import Union


def calculate_circle_area(radius: float) -> float:
    """Calculate the area of a circle.

    Args:
        radius: The radius of the circle in units.

    Returns:
        The area of the circle in square units.

    Raises:
        ValueError: If radius is negative.
    """
    if radius < 0:
        raise ValueError(f'Radius must be non-negative, got {radius}')
    return math.pi * radius ** 2


class GeometryCalculator:
    """Calculator for basic geometric operations.

    Attributes:
        precision: Number of decimal places for calculations.
    """

    def __init__(self, precision: int = 2):
        """Initialize calculator with specified precision.

        Args:
            precision: Number of decimal places for results.
        """
        self.precision = precision

    def area_from_diameter(self, diameter: float) -> float:
        """Calculate circle area from diameter.

        Args:
            diameter: The diameter of the circle.

        Returns:
            The calculated area rounded to specified precision.
        """
        radius = diameter / 2
        area = calculate_circle_area(radius)
        return round(area, self.precision)
```

## Testing Guidelines
- Write unit tests for all public functions
- Test edge cases and error conditions
- Use descriptive test method names: `test_<method_under_test>_<condition>`
- Include docstrings for complex test cases

## Best Practices
- Prioritize code readability over cleverness
- Use meaningful variable and function names
- Handle errors gracefully with appropriate exception types
- Document design decisions and complex algorithms
- Follow the principle: "Code is read more often than it is written"