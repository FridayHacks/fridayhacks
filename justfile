# Show available commands (also the default when running `just`).
help:
    @just --list

# Install Ruby dependencies.
install:
    bundle install

# Serve locally at http://localhost:4000 with live reload.
run:
    bundle exec jekyll serve --host 127.0.0.1 --port 4000 --livereload
