



#compdef buidler
#autoload

#zstyle ':completion:*:*:buidler:*' option-stacking yes
 
__buidler_tool_complete() {
  local -a _1st_arguments
  local context state line curcontext="$curcontext"

  _1st_arguments=(
      'accounts:Prints the list of accounts'
      'clean:Clears the cache and deletes all artifacts'
      'compile:Compiles the entire project, building all artifacts'
      'console:Opens a buidler console'
      'flatten:Flattens and prints all contracts and their dependencies'
      'help:Prints this message'
      'node:Starts a JSON-RPC server on top of Buidler EVM'
      'run:Runs a user-defined script after compiling the project'
      'test:Runs mocha tests:'
  )


  _arguments -C \
    '(--config)--config[A Buidler config file.]' \
    '(--emoji)--emoji[Use emoji in messages.]' \
    '(--help)--help[Shows this message, or a tasks help if its name is provided]' \
    '(--max-memory)--max-memory[The maximum amount of memory that Buidler can use.]' \
    '--network[The network to connect to.]:The network to connect to.:(localhost robsten kovan)' \
    '(--show-stack-traces)--show-stack-traces[Show stack traces.]' \
    '(--verbose)--verbose[Enables Buidler verbose logging]' \
    '(--version)--version[Shows buidler version.]:' \
    '1:: :->cmds' \
    '2:: :->subcmds' \
    '3:: :->subsubcmds' \
  && return 0


  case "$state" in
    (cmds)
      _describe -t commands "buidler commands" _1st_arguments
      return 0
      ;;
    (subcmds)
      case "$line[1]" in
        (accounts|clean|flatten)
        ;;
        (compile)
          _values 'compile' '--force'  &&  ret=0;
          ;;
        (console)
          _values 'console' '*--no-compile'  &&  ret=0;
          ;;
        (node)
          _values 'node' '--hostname'  &&  ret=0;
          ;;
        (run)
          _values 'run' "--no-compile[Don't compile before running this task]"
          _arguments '*:file:_files -g \*.\(js\|ts\)' &&  ret=0;
          ;;
        (show)
          _values 'show' \
            'raw' 'builtins' 'before-rules' 'user-rules' 'after-rules' 'logging-rules' 'listening' 'added' \
          && ret=0
          ;;
      esac
      ;;
    (subsubcmds)
      case "$line[1]" in
        (node)
          _values 'node' '--port'  &&  ret=0;
          ;;
        (run)
          _arguments '*:file:_files -g \*.\(js\|ts\)'
          ;;
      esac
  esac

  return
}

compdef __buidler_tool_complete buidler

alias buidlc="buidler compile"
alias buidlcon="buidler console"
alias buidlt="buidler test"
alias buidlr="buidler run"
alias buidln="buidler node"
alias buidlh="buidler help"
