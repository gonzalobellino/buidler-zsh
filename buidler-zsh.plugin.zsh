# zsh completion for buidler (https://buidler.dev/)
#
# version:  0.1.0
# github:   https://github.com/gonzalobellino/buidler-zsh
#
# license:
#
#MIT License
#
#Copyright (c) 2020 gonzalobellino
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
##copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#
#autoload

#zstyle ':completion:*:*:buidler:*' option-stacking yes
 
__bdldr_complete() {
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
    '(--config)--config[A Buidler config file.]:file:_files -g \*.\(js\|ts\)' \
    '(--emoji)--emoji[Use emoji in messages.]' \
    '(--help)--help[Shows this message, or a tasks help if its name is provided]' \
    '(--max-memory)--max-memory[The maximum amount of memory that Buidler can use.]:int:' \
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
          _values 'node'  '--hostname' &&  ret=0;
          ;;
        (run|test)
          _values 'run' "--no-compile[Don't compile before running this task]"
          _arguments '*:file:_files -g \*.\(js\|ts\)' &&  ret=0;
          ;;
      esac
      ;;
    (subsubcmds)
      case "$line[1]" in
        (node)
          _values 'node' '--port'  &&  ret=0;         
          ;;
        (run|test)
          _arguments '*:file:_files -g \*.\(js\|ts\)' &&  ret=0;
          ;;
        (compile|console)
        ;;
      esac
      ;; 
  esac
  return
}

compdef __bdldr_complete buidler

#alias buidler="npx buidler"
alias buid="npx buidler"
alias buidc="npx buidler compile"
alias buidt="npx buidler test"
alias buidr="npx buidler run"
alias buidn="npx buidler node"
alias buidh="npx buidler help"
