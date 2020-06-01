# Buidler Plugin

This plugin for Oh-My-Zsh ([zsh](https://ohmyz.sh/)) adds completion and useful aliases for NomicLabs Buidler tool [buidler.dev](buidler.dev)

[![asciicast](https://asciinema.org/a/99xuMgZY0blJtrElyUHqVSa72.svg)](https://asciinema.org/a/99xuMgZY0blJtrElyUHqVSa72)

## installation

### Git mode

Clone this repository [https://github.com/gonzalobellino/buidler-zsh.git](https://github.com/gonzalobellino/buidler-zsh.git) in **$ZSH_CUSTOM/plugins** (default: ~/.oh-my-zsh/custom/plugins)

### Manual mode

Download this file [buidler-zsh.plugin.zsh](https://raw.githubusercontent.com/gonzalobellino/buidler-zsh/master/buidler-zsh.plugin.zsh) and move it to a new directory **$ZSH_CUSTOM/plugins/buidler-zsh**


```
$ZSH_CUSTOM (default:~/.oh-my-zsh/custom)
├── plugins
     └── buidler-zsh
         └── buidler-zsh.plugin.zsh
```

To activate it, add **buidler-zsh** to the plugins array of your **.zshrc** file:

```
plugins=(... buidler-zsh)
```

**You need to reload ZSH (source .zshrc) or logout from the active terminal.**


## Aliases

| Alias   | Command                            |
| ------- | ---------------------------------- |
| buid     | `npx --no-install buidler`        |
| buidc    | `npx --no-install buidler compile`|
| buidt    | `npx --no-install buidler test`   |
| buidr    | `npx --no-install buidler run`    |
| buidn    | `npx --no-install buidler node`   |
| buidh    | `npx --no-install buidler help`   |
