# [rendercv](https://docs.rendercv.com) Branching Utility Scripts

The scripts and configuration in this repository were designed to streamline resume design and rendering using [rendercv](https://docs.rendercv.com). Since resumes are often iterative and slight variations on one another, it makes sense to use git version control to switch between and modify resumes.

## Table of Contents

1. [Table of Contents](#table-of-contents)
2. [Requirements](#requirements)
3. [Scripts](#scripts)
    1. [render](#render)
    2. [watch](#watch)
    3. [initconda](#initconda)
    4. [colortest](#colortest)
4. [Setup](#setup)
    1. [configuration](#configuration)
    2. [conda](#conda)
5. [Visual Studio Code](#visual-studio-code)

## Requirements

The following are **required** to use the tool.

- Python (v3.10+)
- rendercv (v2.2)

The following are **optional**, but recommended.

- git
- conda

## Scripts

### [render](./render.sh)

Renders your cv to a directory that depends on the current git branch. By default, the rendered output directories are saved at `./history/`. If your current branch is "main", the rendered output files will be contained within `./history/branch-main/`.

If you *do not* have git, the rendered output files will be contained within `./history/standard/`.

```bash
./render.sh
```

### [watch](./watch.sh)

Renders your cv with live updates as you modify the input YAML file. By default, the rendered output files will be contained within `./watch/`.

```bash
./watch.sh
```

### [initconda](./initconda.sh)

Automatically initializes a conda environment with rendercv.

```bash
./initconda.sh
```

### [colortest](./colortest.sh)

Simply displays the colors defined in the configuration file to the terminal.

```bash
./colortest.sh
```

## Setup

Assuming you have Python, follow the [rendercv user guide](https://docs.rendercv.com/user_guide/) to install rendercv. That's about it, really.

### Configuration

You can modify the configuration (see [config.cfg](./config.cfg)) to output your rendered cv to a different directory, modify the expected YAML source, modify the terminal colors, and more. See the [rendercv docs](https://docs.rendercv.com/) to learn how to modify themes, create new themes, and more.

### Conda

If you use the conda environment manager, it is easy to setup an environment using the [`environment.yaml`](./environment.yaml).

```bash
conda env create -f environment.yaml
```

Alternatively, you can execute the [`initconda.sh`](./initconda.sh) script to do the same thing.

```bash
./initconda.sh
```

## Visual Studio Code

The [`.vscode/tasks.json`](.vscode/tasks.json) defines some tasks for quick execution from the Visual Studio Code command palette. To access, perform the following keyboard shortcut and then write "Tasks: Run Task".

- Windows/Linux: `Ctrl` + `Shift` + `P`
- macOS: `Cmd` + `Shift` + `P`
