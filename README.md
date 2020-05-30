# Buidler Plugin

This plugin adds completion for managing NomicLabs Buidler tool [buidler.dev](buidler.dev)

## Instalation

### Git mode

Clone this repository [https://github.com/gonzalobellino/buidler-zsh.git](https://github.com/gonzalobellino/buidler-zsh.git) in **$ZSH_CUSTOM/plugins** (default: ~/.oh-my-zsh/custom/plugins)

### Manual mode

Download this file [buidler-zsh.plugin.zsh](buidler-zsh.plugin.zsh) and move it to a new directory **$ZSH_CUSTOM/plugins/buidler-zsh**


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