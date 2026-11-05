.PHONY: help setup up down run test lint format clean

help:            ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

setup:           ## Create virtual env and install dev tools
	python3.12 -m venv .venv
	.venv/bin/pip install -r requirements-dev.txt
	.venv/bin/pre-commit install

up:              ## Start services with Docker
	docker compose up -d

down:            ## Stop services
	docker compose down

run:             ## Run the pipeline (customize per project)
	@echo "Define the pipeline run command for this project"

test:            ## Run unit tests
	.venv/bin/pytest -v

lint:            ## Check code style
	.venv/bin/ruff check .

format:          ## Auto-format code
	.venv/bin/ruff format .

clean:           ## Remove caches
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
	rm -rf .pytest_cache .ruff_cache
