# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.2] - 2024-08-03

### Added

- Initial release of `cubit_generator` package.
- Command-line tool for creating Cubit and state files.
- Basic boilerplate for Cubit and state management, including `part` and `part of` directives.
- Automatic creation of `cubits` directory and subdirectories for each Cubit.
- Templates for Cubit and state files with initial state class.

## [0.0.2] - 2024-08-10

### Added

- Option to specify initial state properties through the CLI.
- New documentation section for advanced usage.

### Fixed

- Bug where `part of` directive was incorrectly referencing the Cubit file.
- Fixed issue with generating state classes with special characters in the name.

## [0.0.2] - 2024-08-15

### Changed

- Refactored code generation to support customizable templates.
- Improved error messages for invalid input cases.

### Deprecated

- Deprecated the `--basic` flag in favor of the new template system.

## [0.2.1] - 2024-08-20

### Security

- Updated dependencies to address security vulnerabilities.
