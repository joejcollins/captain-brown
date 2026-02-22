# Default recipe.
_default: help

# Remove the virtual environment.
clean:
    rm -rf .venv
    rm -rf *.egg-info
    find . -name "*.pyc" -exec rm -f {} \;
    find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete

# Show help for each of the recipes.
help:
    @just --list

# Lint the code with ruff.
lint:
    .venv/bin/ruff check ./src

# Update the lock file from pyproject.toml
lock:
    uv lock

# Report Python version and pip packages.
report:
    .venv/bin/python --version
    uv pip list -v

# Create the virtual environment.
venv:
    uv venv .venv --clear
    uv sync --frozen
