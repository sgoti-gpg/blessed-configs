#!/bin/bash
#License: GPL v3
#see <https://www.gnu.org/licenses/>.

#Name: button-git-settup.sh
#Purpose: Create a directory and global git config.
#Version: 1.0
#Author: SGOTI (Some Guy On The Internet)
#Date: 2025-02-02

#declaration:
declare bindir=/usr/bin/
declare git=${bindir}git
declare gitLocalConfigDirectory="${HOME}/.config/git"
declare mkdir=${bindir}mkdir
declare touch=${bindir}touch

#start:
if [ ! -d ${gitLocalConfigDirectory} ]; then
    ${mkdir} --verbose --parents ${gitLocalConfigDirectory};
    if [ ! -f ${gitLocalConfigDirectory}/config ]; then
        ${touch} ${gitLocalConfigDirectory}/config;
        git config --global user.name "Sgoti" \
        && git config --global user.email "user@domain.tld" \
        && git config --global core.editor "vim" \
        && git config --global init.defaultBranch "main" \
        && git config --global color.ui "auto" \
        && git config --global color.status "auto" \
        && git config --global color.branch "auto" \
        && git config --global color.interactive "auto" \
        && git config --global color.diff "auto";
        && git config --global alias.co checkout \
        && git config --global alias.br branch \
        && git config --global alias.ci commit \
        && git config --global alias.st status;
    fi
fi

unset bindir
unset git
unset gitLocalConfigDirectory
unset mkdir
unset touch
exit 0
