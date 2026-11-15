---
layout: post
title: "uv, Poetry, or pip and venv? Choosing a Python Workflow"
description: "Compare uv, Poetry, and pip with venv through practical examples, dependency locking, and advice on choosing a Python workflow."
tags: [python, uv, poetry, dependencies, tools]
---

A Python experiment often starts with a script and a few dependencies. Then you need to share it, run it in CI, or return to it six months later. The interesting question becomes: how do you recreate the environment that made it work?

My default recommendation for new applications and automation projects is uv. It brings several useful workflows together. Poetry remains a good choice for an established project, and pip with venv is enough for many small tasks. The right choice depends on what you need to manage.

### What Each Tool Does

Python's `venv` module creates an isolated environment. `pip` installs packages into an environment. Together, they provide the foundation for working without mixing project dependencies into your global Python installation.

uv and Poetry add project management: tracking declared dependencies, resolving compatible versions, recording them in a lockfile, and installing a project environment from that information. They still use virtual environments.

[uv](https://docs.astral.sh/uv/) also manages Python installations, standalone scripts, and isolated command-line tools. [Poetry](https://python-poetry.org/docs/) focuses on dependency management and packaging, with a plugin system for extending its behavior. Both can build and publish Python packages.

### Start With pip and venv

For a small HTTP client project on macOS or Linux:

```bash
mkdir http-demo
cd http-demo
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install httpx
python3 -m pip freeze > requirements.txt
```

On Windows PowerShell, activate with `.venv\Scripts\Activate.ps1` instead.

Create `main.py`:

```python
import httpx

response = httpx.get("https://example.com", timeout=10)
response.raise_for_status()
print(response.status_code)
```

Run it with `python3 main.py`. Another developer can create an environment and install the recorded dependencies:

```bash
python3 -m pip install -r requirements.txt
```

This is a workable approach. The limitation is that `pip freeze` captures installed packages, including transitive dependencies and anything else you installed. It does not distinguish the packages your application directly needs from the packages those dependencies need.

As the project grows, you need conventions or additional tooling for dependency intent, updates, and locking. A requirements-based workflow can be rigorous, but you have to assemble that workflow yourself.

### The uv Project Workflow

With uv installed, start the same example in a separate directory:

```bash
uv init http-demo-uv
cd http-demo-uv
uv add httpx
```

Replace the generated `main.py` with the HTTP example above, then run:

```bash
uv run python3 main.py
```

The important project files serve different purposes:

| File | Purpose |
| --- | --- |
| `pyproject.toml` | Project metadata and declared dependency constraints |
| `uv.lock` | Resolved dependency versions |
| `.python-version` | Selected Python version for the project |
| `.venv/` | Local environment created from the project configuration |

Commit the project metadata, Python version selection, and lockfile. Keep `.venv/` out of Git. These conventions are explained in the [uv project guide](https://docs.astral.sh/uv/guides/projects/).

When someone checks out the project, they can run:

```bash
uv sync --locked
uv run --locked python3 main.py
```

`--locked` makes an outdated lockfile an error instead of allowing uv to update it. Without that flag, `uv run` normally checks and updates the lockfile and environment before executing the command. For CI, explicitly checking the committed lockfile helps catch metadata changes that were not locked.

An existing lockfile also does not mean every sync fetches the newest compatible releases. Upgrading is an explicit operation, such as `uv lock --upgrade`, followed by syncing the environment. See [locking and syncing](https://docs.astral.sh/uv/concepts/projects/sync/).

### Faster pip or Project Manager?

uv has two interfaces that are easy to confuse. You can keep a requirements-based workflow:

```bash
uv venv
uv pip install -r requirements.txt
```

Or adopt the project workflow with `uv add`, `uv sync`, and `uv run`.

Running `uv pip install` alone does not maintain project dependencies in `pyproject.toml` or create the project's `uv.lock`. That distinction matters when deciding what benefit you are getting. Also, uv's pip interface has documented behavior differences; check [pip compatibility](https://docs.astral.sh/uv/pip/compatibility/) when migrating an established installation process.

### How Poetry Compares

For the same example using Poetry, create another directory, run `poetry init`, and add the dependency:

```bash
mkdir http-demo-poetry
cd http-demo-poetry
poetry init --no-interaction
poetry add httpx
```

For a script project that you do not intend to install as a package, configure this in `pyproject.toml`:

```toml
[tool.poetry]
package-mode = false
```

Create `main.py` with the HTTP example, then run:

```bash
poetry run python3 main.py
```

Poetry supports this application-oriented setup through [non-package mode](https://python-poetry.org/docs/basic-usage/#operating-modes).

| Operation | uv | Poetry |
| --- | --- | --- |
| Add a dependency | `uv add httpx` | `poetry add httpx` |
| Record resolved dependencies | `uv.lock` | `poetry.lock` |
| Synchronize the environment | `uv sync` | `poetry sync` |
| Run a script | `uv run python3 main.py` | `poetry run python3 main.py` |
| Build a distribution | `uv build` | `poetry build` |
| Publish a distribution | `uv publish` | `poetry publish` |

Both tools provide dependency locking. The fair comparison for exact environment synchronization is `uv sync` versus `poetry sync`: Poetry's sync command removes packages outside the selected locked environment, while `poetry install` does not perform the same cleanup.

Poetry also supports installing Python versions through `poetry python install`, although its documentation currently labels Python management experimental. Saying Poetry cannot install Python would be outdated. See the [Poetry command reference](https://python-poetry.org/docs/cli/).

Modern Poetry supports standard `[project]` metadata and dependencies in `pyproject.toml`, too. It is inaccurate to frame the choice as standard metadata versus proprietary metadata. Both tools still have their own configuration and lockfile formats. See [Poetry dependency specification](https://python-poetry.org/docs/dependency-specification/).

### Where uv Adds Convenience

For small automation scripts, uv can read dependencies directly from the script:

```python
# /// script
# requires-python = ">=3.12"
# dependencies = ["httpx"]
# ///

import httpx

response = httpx.get("https://example.com", timeout=10)
response.raise_for_status()
print(response.status_code)
```

Save it as `check.py` and run `uv run check.py`. The script carries its dependency declaration, and uv handles its environment. Those declarations are not a lockfile; use `uv lock --script check.py` when you also want to record resolved versions. The [script guide](https://docs.astral.sh/uv/guides/scripts/) explains the workflow.

For a command-line tool, `uvx ruff check .` runs Ruff in an isolated tool environment. `uv tool install ruff` makes it persistently available. For consistent versions across a team, declaring Ruff as a project development dependency is often preferable. See [using tools](https://docs.astral.sh/uv/guides/tools/).

### What About Speed and Reproducibility?

Astral advertises uv as 10 to 100 times faster than pip in its benchmark scenarios. That is a vendor performance claim, not a measurement from this article, and it is not a universal comparison against Poetry. Package installation speed also does not make your Python application execute faster. The [uv overview](https://docs.astral.sh/uv/) links to its benchmarks.

To compare tools for your project, measure dependency resolution and installation separately, using both empty and populated caches. Record tool versions and use equivalent dependencies. A project dominated by downloading large wheels or compiling native extensions may behave differently from a small cached application.

A lockfile improves repeatability, but it does not freeze the operating system, system libraries, or every build input. uv's [universal resolution](https://docs.astral.sh/uv/concepts/resolution/) can represent dependencies for multiple platforms; it does not guarantee that every dependency has a compatible wheel or can build everywhere.

### Which Would I Choose?

For a new application, API, or automation project, I would start with uv. Its combined project, Python, script, and tool workflows reduce the number of separate setup steps to maintain.

For an existing Poetry project, I would keep Poetry when dependency management, CI, and publishing already work well. Migration should earn its cost. Check private indexes, plugins, dependency groups, and deployment integrations before changing tools. Both uv and Poetry can support libraries, so the choice is not simply applications versus packages.

For a small task with a few dependencies, pip and venv remain reasonable. Learning isolation and installation with these tools is useful even if you later adopt a project manager.

The strongest reason to choose uv is the workflow you gain: declared dependencies, a committed lockfile, and a convenient way to run the project. Poetry already delivers much of that value. Choose based on the work you need to repeat, and measure before making speed your deciding argument.
