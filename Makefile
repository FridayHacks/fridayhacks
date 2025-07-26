# Makefile for Friday Hacks Jekyll Site

.PHONY: build run clean install serve help

# Default target
help:
	@echo "Available targets:"
	@echo "  build    - Build the Jekyll site for production"
	@echo "  run      - Serve the site locally for development"
	@echo "  serve    - Alias for run"
	@echo "  clean    - Clean the built site"
	@echo "  install  - Install dependencies"
	@echo "  help     - Show this help message"

# Install dependencies
install:
	bundle install

# Build the site for production
build:
	bundle exec jekyll build

# Run the site locally for development
run:
	bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload

# Alias for run
serve: run

# Clean the built site
clean:
	bundle exec jekyll clean

# Build and serve in one command
dev: install run
