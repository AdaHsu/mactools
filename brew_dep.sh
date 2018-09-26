#!/bin/bash

# reference from https://www.thingy-ma-jig.co.uk/blog/22-09-2014/homebrew-list-packages-and-what-uses-them

# https://zanshin.net/2014/02/03/how-to-list-brew-dependencies/

# https://blog.jpalardy.com/posts/untangling-your-homebrew-dependencies/

if [ $(echo $0) = "-zsh" ] 
then
    brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
else
    brew list | while read cask; do echo -e -n "\e[1;34m$cask ->\e[0m"; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done
fi
