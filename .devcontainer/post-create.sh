#!/bin/sh

# This script is run after the container is created.
make clean
make venv

# Install pre-commit hooks
.venv/bin/pre-commit install
