# Mulhamna Homebrew Tap

Homebrew formulae and casks for Mulhamna's tools.

## Packages

| Package | Type | Description | Install |
|---|---|---|---|
| [addx](https://github.com/mulhamna/addx) | Formula | Universal AI tooling manager with a mouse-clickable TUI | `brew install mulhamna/tap/addx` |
| [broask](https://github.com/mulhamna/broask) | Formula | Plays a sound when CLI tools ask for confirmation | `brew install mulhamna/tap/broask` |
| [clickupc](https://github.com/mulhamna/clickup-commands) | Formula | Unofficial ClickUp CLI and MCP server | `brew install mulhamna/tap/clickupc` |
| [jira-commands](https://github.com/mulhamna/jira-commands) | Formula | Cross-platform Jira CLI; installs the `jirac` command | `brew install mulhamna/tap/jira-commands` |
| [jira-mcp](https://github.com/mulhamna/jira-commands) | Formula | Typed Jira MCP server; installs the `jirac-mcp` command | `brew install mulhamna/tap/jira-mcp` |
| [pkgmap](https://github.com/mulhamna/pkgmap) | Formula | Lists installed packages across package managers | `brew install mulhamna/tap/pkgmap` |
| [portbar](https://github.com/mulhamna/portbar) | Cask | macOS menu bar app that shows active listening ports | `brew install --cask mulhamna/tap/portbar` |

## Install

Add the tap once:

```bash
brew tap mulhamna/tap
```

Install formulae by name:

```bash
brew install addx
brew install broask
brew install clickupc
brew install jira-commands
brew install jira-mcp
brew install pkgmap
```

Install the PortBar app:

```bash
brew install --cask portbar
```

Update Homebrew and upgrade installed packages:

```bash
brew update
brew upgrade
```

## Platform support

Formulae provide Apple Silicon and Intel builds for macOS and Linux. PortBar is
a macOS app.
