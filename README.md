# Cubit Generator

[![Pub Version](https://img.shields.io/pub/v/cubit_generator)](https://pub.dev/packages/cubit_generator)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**Cubit Generator** is a Flutter package designed to automate the creation of Cubit and state files, streamlining the development process for state management in Flutter applications. This tool provides a command-line interface (CLI) for generating Cubit classes and their associated states, ensuring consistency and reducing boilerplate code.

## Features

- **Automated File Generation:** Quickly generate Cubit and state files with a single command.
- **Structured Directory Management:** Organizes generated files into a `cubits` directory with subdirectories for each Cubit.
- **Seamless Integration:** Includes `part` and `part of` directives for easier file management.
- **Customizable:** Easily extend and modify generated code to fit your specific needs.

## Installation

```bash
dart pub global activate cubit_generator
```

## Usage

Navigate to your Flutter project's root directory and run:

```bash
cubit_generator --name YourCubitName
```

This will create a new Cubit in your project:

```
lib/
  cubits/
    your_cubit_name/
      your_cubit_name_cubit.dart
      your_cubit_name_state.dart
```
