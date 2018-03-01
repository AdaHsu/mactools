#!/bin/bash

#######################################################
#
# check_cask.sh Check software installed via brew-cask.
# Copyright (C) 2018 Ada Hsu, Taiwan.
#
#  This file is free software: you may copy, redistribute and/or modify it   
#  under the terms of the Apache License, Version 2.0.
#  You may obtain a copy of the License at  
#
#  https://www.apache.org/licenses/LICENSE-2.0  
#
#######################################################

# softwares without checking it's version.
EXCLUDE_SOFTWARE="filezilla firefox google-chrome intellij-idea istat-menus iterm2 sourcetree visual-studio-code "

COLOR_RESET='\033[0m'
COLOR_HIGHLIGHT='\033[1;37m'

# check shell, only zsh and bash
SH=$(ps -o comm= -p $$)

if [ "${SH}" = "zsh" ]
then
    OFFSET0=1
    OFFSET1=2
else
    OFFSET0=0
    OFFSET1=1
fi

IFS='
'
for SOFTWARE in $(brew cask list)
do
    BOTTLE=$(brew cask info ${SOFTWARE} | grep -A 1 '==> Name' | tail -n 1)
    VERSION_INFO=($(brew cask info ${SOFTWARE} | sed -n -e 1p -e 3p))
    CURRENT_VERSION=$(echo ${VERSION_INFO[${OFFSET0}]} | cut -d\  -f 2)
    INSTALLED_VERSION=$(echo ${VERSION_INFO[${OFFSET1}]} | cut -d\  -f 1 | awk -F/ '{ print $NF }')
    NAME=$(echo ${VERSION_INFO[${OFFSET0}]} | cut -d: -f 1)

    echo -n ${BOTTLE} \[${NAME}\]
    if [ "${EXCLUDE_SOFTWARE/${SOFTWARE}/}" = "${EXCLUDE_SOFTWARE}" ]
    then
        if [ "${CURRENT_VERSION}" != "${INSTALLED_VERSION}" ]
        then
            echo -n ": ${INSTALLED_VERSION} installed, but new update ${COLOR_HIGHLIGHT}${CURRENT_VERSION}${COLOR_RESET} exists."
        fi    
    fi
    echo
done