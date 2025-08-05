---
layout: post
title: "Building Modular Applications with Semablocks"
description: "Building Modular Applications."
tags: [semablocks, modularity, optimization]
---


# Semablocks

**Semablocks** is an internal approach to building **modular, reusable code blocks**—inspired by Lego Blocks—that you can compose into larger applications.  
Instead of writing monolithic scripts, you build **small, versioned blocks** in Bash, Python, Go, and other languages. These blocks can then be combined into **composite workflows**, orchestrated by a runner, and imported into your applications (like Flask).


### Why Semablocks?

- **Reusability:** Write once, reuse in multiple projects.
- **Versioning:** Update or patch individual blocks without breaking larger workflows.
- **Cross-Language:** Use Bash for automation, Python for data handling, and Go for high-performance binaries—all in one ecosystem.
- **Simplicity:** Each block has a single responsibility, making debugging and scaling easier.


### Example Project Structure

```bash
semablocks/
  blocks/
    bash/
      fetch_data/
        v1.0/
          fetch_data.sh
    python/
      parse_json/
        v1.1/
          parse_json/           # Python package
            __init__.py
            core.py
          pyproject.toml
          tests/
    go/
      generate_report/
        v1.0/
          cmd/
            main.go
          go.mod
  composites/
    daily_report/
      workflow.yaml
  orchestration/
    runner/
      run_block.py
      runner.go
  docs/
    index.md
  registry/
    index.json   # optional metadata index for all blocks
```

- **Blocks**: Small, atomic units (e.g., parse_json for JSON parsing).
- **Composites**: Combine multiple blocks into larger workflows (e.g., daily_report).
- **Orchestration**: Scripts or binaries that run blocks in sequence.

### Using Semablocks in a Flask Application

**Step 1: Package a Python Block**  

A simple Python block (`parse_json`) could look like this in a `core.py` file:

```python
import json

def parse_json_string(json_string):
    """Parse JSON and return a Python object."""
    return json.loads(json_string)

```

THe `__init__.py` would look like this: 

```python
from .core import parse_json_string
```

The `pyproject.toml` would look like:


```toml
[project]
name = "semablocks-parse-json"
version = "1.1.0"
description = "Semablock for parsing JSON"
dependencies = []

[build-system]
requires = ["setuptools", "wheel"]
build-backend = "setuptools.build_meta"
```
Build the block:

```bash
python3 -m build
```

This generates a `.whl` file under `dist/`.  

**Step 2: Install the Block in Your Flask App**

You can install the package from a local build:

```bash
pip install dist/semablocks_parse_json-1.1.0-py3-none-any.whl
```

Or from your internal PyPI (see next section).

**Step 3: Import and Use the Block in Flask** 

From your `app.py`:

```python
from flask import Flask, request, jsonify
from semablocks_parse_json import parse_json_string

app = Flask(__name__)

@app.route("/parse", methods=["POST"])
def parse():
    data = request.get_data(as_text=True)
    try:
        result = parse_json_string(data)
        return jsonify(result)
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == "__main__":
    app.run()
```

### Using an Internal PyPI with Semablocks

For distributing Python Semablocks across multiple projects and teams, set up an internal PyPI-like registry.

**Option 1: Devpi (Lightweight Internal PyPI)**

Install Devpi

```bash
pip install devpi-server devpi-client
```

Initialize and Run

```bash
devpi-server --start --host 0.0.0.0 --port 3141
devpi use http://localhost:3141
devpi login root --password=''
devpi user -c myuser password=secret
devpi index -c semablocks
devpi use semablocks
```
Upload a Block

From your block directory:

```bash
python3 -m build
devpi upload
```

Install from Internal PyPI

```bash
pip install --index-url http://myuser:secret@your-internal-pypi:3141/semablocks semablocks-parse-json==1.1.0
```

**Option 2: Private GitHub Repo**  

For quick adoption, you can also host your block in a private GitHub repo and install directly:

```bash
pip install git+ssh://git@github.com:YourOrg/semablocks.git@main#subdirectory=blocks/python/parse_json/v1_1
```

### Summary
Semablocks lets you build modular, reusable code blocks that integrate seamlessly into larger applications like Flask.

Use an internal PyPI (e.g., Devpi) to easily distribute Python Semablocks across projects.

With proper packaging, your blocks are versioned, reusable, and maintainable.
