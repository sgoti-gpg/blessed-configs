
#declaration:
declare -x EDITOR="/usr/bin/vim"
declare -x SYSTEMD_LOG_COLOR="true"
declare -x SYSTEMD_LOG_TIME="true"
#declare -x GZIP=-9
declare -x HISTTIMEFORMAT="%Y-%m-%d %T %z "
declare -x HISTZISE=1000000
declare bindir=/usr/bin/

#declare 7z=${bindir}7z
declare apt=${bindir}apt
declare awk=${bindir}awk
declare bunzip2=${bindir}bunzip2
declare cat=${bindir}cat
declare chmod=${bindir}chmod
declare clear=${bindir}clear
declare cp=${bindir}cp
declare cut=${bindir}cut
declare date=${bindir}date
declare du=${bindir}du
declare echo=${bindir}echo
declare find=${bindir}find
declare grep=${bindir}grep
declare gunzip=${bindir}gunzip
declare ip=${bindir}ip
declare less=${bindir}less
declare ls=${bindir}ls
declare lsblk=${bindir}lsblk
declare mkdir=${bindir}mkdir
declare mktemp=${bindir}mktemp
declare mv=${bindir}mv
declare nice=${bindir}nice
declare pwd=${bindir}pwd
declare reset=${bindir}reset
declare rm=${bindir}rm
declare shred=${bindir}shred
declare sleep=${bindir}sleep
declare sudo=${bindir}sudo
declare tail=${bindir}tail
declare tar=${bindir}tar
declare touch=${bindir}touch
declare tree=${bindir}tree
declare uncompress=${bindir}uncompress
declare unrar=${bindir}unrar
declare unzip=${bindir}unzip
declare vim=${bindir}vim

declare etc_fstab="/etc/fstab"
declare etc_inputrc="/etc/.inputrc"
declare etc_ssh_config="/etc/ssh/ssh_config"
declare etc_sshd_config="/etc/ssh/sshd_config"
declare home_bashal="${HOME}/.bash_aliases"
declare home_bashrc="${HOME}/.bashrc"
declare home_inputrc="${HOME}/.inputrc"
declare home_profile="${HOME}/.bash_profile"
declare home_ssh_config="${HOME}/.ssh/config"
declare home_vimrc="${HOME}/.vimrc"
declare home_nano="${HOME}/.config/nano/nanorc"
declare home_archive="${HOME}/.archive"

${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all

#More ls aliases
alias cla='${clear} && ${nice} -n 19 ${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all'
alias cll='${clear} && ${nice} -n 19 ${ls} --color=auto --group-directories-first --classify --almost-all'
alias clar='${clear} && ${nice} -n 19 ${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all --recursive'
alias ctree='${clear} && ${nice} -n 19 ${tree} -a -A -C -f'
alias du='${nice} -n 19 ${du} --human-readable --total 2> /dev/null | ${nice} -n 19 ${tail} --lines="1"'
alias la='${nice} -n 19 ${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all --size'
alias ll='${nice} -n 19 ${ls} --color=auto --group-directories-first --classify --almost-all --human-readable --size'
alias lar='${nice} -n 19 ${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all --recursive'
alias tree='${nice} -n 19 ${tree} -a -A -C -f'

function lessls () {
    ${nice} -n 19 ${ls} --group-directories-first --human-readable --size \
    --classify --almost-all "${1}" | ${less} -N;
return;
}

function lessla () {
    ${nice} -n 19 ${ls} -l --human-readable --size --group-directories-first \
    --classify --almost-all "${1}" | ${less} -N;
return;
}

function lesslar () {
    ${nice} -n 19 ${less} -N -f <(${du} --human-readable --all --total ${1} \
    2> /dev/null | ${tail} --lines="1" \
    && ${ls} -l --human-readable --size --group-directories-first --classify \
    --almost-all --recursive "${1}" 2> /dev/null);
return;
}

#INSPECT THE DISK! :D
alias ulsblk='${lsblk} --paths --fs'

#Safety first ;)
alias rmi='${rm} --interactive --verbose'
alias mvi='${mv} --interactive --verbose'
alias cpi='${cp} --interactive --verbose'

#Kill it with fire! :|
alias shred='${shred} -v -u -z ${1}'

#Beef up the cd command.
#function cd () {
#    builtin cd "$@" \
#    && ${du} --human-readable --total 2> /dev/null | ${tail} --lines="1" \
#    && ${ls} --color=auto -l --human-readable --size --group-directories-first \
#    --classify --almost-all && history -w;
#    return;
#}

#cd multi-layer directories
alias ..='cd ..;'
alias .2='cd ../..;'
alias .3='cd ../../..;'

#Populate the pushd stack.
function stackup (){
builtin pushd -n ${HOME}/.local > /dev/null \
&& builtin pushd -n ${HOME}/.config > /dev/null \
&& builtin pushd -n ${HOME}/.ssh > /dev/null \
&& builtin pushd -n ${HOME}/Downloads > /dev/null \
&& builtin pushd -n /etc > /dev/null \
&& builtin pushd -n /etc/ssh > /dev/null \
&& builtin pushd -n /media > /dev/null \
&& builtin pushd -n /mnt > /dev/null \
&& builtin pushd -n /opt > /dev/null \
&& builtin pushd -n /var/log > /dev/null \
&& builtin pushd -n /tmp > /dev/null \
&& dirs -v \
|| ${echo} "A directory in your stack does NOT exist.";
return;
}

#Jobspec stuff
alias jobs='jobs -l'
alias dirs='dirs -v'

#File Mods
alias c700='${chmod} --changes =700'
alias c600='${chmod} --changes =600'
alias c400='${chmod} --changes =400'

function c600r () {
[[ -d ${1} ]] \
&& ${nice} -n 15 ${find} "${1}" -type d -exec ${chmod} --changes --recursive =700 {} + \
&& ${nice} -n 15 ${find} "${1}" -type f -exec ${chmod} --changes --recursive =600 {} + \
&& ${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all \
    || ${echo} "Good heavens! That directory does NOT exist.";
return;
}

function c400r () {
[[ -d ${1} ]] \
&& ${nice} -n 15 ${find} "${1}" -type d -exec "${chmod}" --changes --recursive =700 {} + \
&& ${nice} -n 15 ${find} "${1}" -type f -exec "${chmod}" --changes --recursive =400 {} + \
&& ${ls} --color=auto -l --human-readable --group-directories-first --classify --almost-all \
    || ${echo} "Good heavens! That directory does NOT exist.";
return;
}

#Edit the blessed configs.
alias sbrc='source ${home_bashrc} && source ${home_bashal}'
alias sbal='source ${home_bashrc} && source ${home_bashal}'
alias sinp='bind -f ${home_inputrc}'
alias vbrc='${vim} ${home_bashrc};'
alias vbal='${vim} ${home_bashal};'
alias vpro='${vim} ${home_profile};'
alias vrc='${vim} ${home_vimrc};'
alias vinp='${vim} ${home_inputrc};'
alias vssh='${vim} ${home_ssh_config};'
alias vetcssh='${vim} ${etc_ssh_config};'
alias vetcsshd='${vim} ${etc_sshd_config};'
alias vtab='${vim} ${etc_fstab};'
alias vcb='${vim} ${HOME}/cb;'

### Functions ###
function hurl_tarball_of_justice () {
local ymd="$(${date} +%Y%m%d)"
[[ ! -d ${home_archive} ]] && ${nice} -n 19 ${mkdir} -v ${home_archive};

[[ -f ${1} || -d ${1} ]] \
    && ${nice} -n 19 ${tar} --verbose --create --file ${ymd}${2}.tar ${1} \
    || ${nice} -n 19 ${echo} "Good heavens! Where is the ${2} file?";
c400 ${ymd}${2}.tar && ${nice} -n 19 ${mv} --verbose --target-directory="${home_archive}" ${ymd}${2}.tar;
return;
}

function save_the_blessed_configs () {
hurl_tarball_of_justice "${home_profile}" "profile";
hurl_tarball_of_justice "${home_bashrc}" "bashrc";
hurl_tarball_of_justice "${home_bashal}" "bash-aliases";
hurl_tarball_of_justice "${home_inputrc}" "inputrc";
hurl_tarball_of_justice "${home_vimrc}" "vimrc";
hurl_tarball_of_justice "${home_nano}" "nanorc"
hurl_tarball_of_justice "${etc_fstab}" "etc-fstab";
hurl_tarball_of_justice "${etc_ssh_config}" "etc-ssh-config";
hurl_tarball_of_justice "${etc_sshd_config}" "etc-sshd-config";
return;
}

function extract () {
if [[ -f "${1}" ]]; then
    case "${1}" in
    *.tar) ${nice} -n 19 ${tar} --verbose --extract --file "${1}" --strip-components="${2}" ;;
    *.tar.gz) ${tar} --verbose --gzip --extract --file "${1}" ;;
    *.tgz) ${tar} --verbose --gzip --extract --file "${1}" ;;
    *.tar.bz2) ${tar} --verbose --bzip2 --extract --file "${1}" ;;
    *.tbz2) ${tar} --verbose --bzip2 --extract --file "${1}" ;;
    *.tar.xz) ${tar} --verbose --extract --file "${1}" --strip-components="${2}" ;;
    *.bz2) ${bunzip2} "${1}" ;;
    *.rar) ${unrar} -x "${1}" ;;
    *.gz) ${gunzip} "${1}" ;;
    *.zip) ${unzip} "${1}" ;;
    *.Z) ${uncompress} "${1}" ;;
    *.7z) ${7z} -x "${1}" ;;
    *) ${echo} "Good Heavens, '"${1}"' will NOT extract..." ;;
    esac
else
    ${echo} "Good Heavens, '"${1}"' is NOT a valid file."
fi
return;
}

function myip () {
${ip} -c -br -4 addr;
return;
}

function mkd (){
local ymd="$(${date} +%Y%m%d)"
${mkdir} -v ${ymd} && pushd -n ${ymd} > /dev/null && c700 ${ymd};
return;
}

function mkt (){
local ymd="$(${date} +%Y%m%d)"
local playground=/run/shm/${ymd}.*
[ ! -d ${playground} ] \
    && local playground="$(${mktemp} -d /run/shm/${ymd}.XXXX)" \
    && ${touch} ${playground}/${ymd}tmp.md \
    && c600r ${playground} \
    && builtin pushd -n ${playground} > /dev/null \
    || builtin pushd -n ${playground} > /dev/null;
return;
}

function mkscript () {
local newscript=${1}.sh

${cat} > ${newscript} << EOS
#!/bin/bash
#License: GPL v3
#see <https://www.gnu.org/licenses/>.

#Name: ${newscript}
#Purpose:
#Version: beta 0.01
#Author: SGOTI (Some Guy On The Internet)
#Date: $(${date} +%F)

#declaration:
declare bindir=/usr/bin/

#start:

exit
EOS

[[ -f ${newscript} ]] && c700 ${newscript} \
    || ${echo} "Good Heavens! There isn't a \"${newscript}\"";
return;
}

function mksedscript () {
local sedscript=${1}.sed

${cat} > ${sedscript} << EOS
#!/bin/sed -f
#License: GPL v3
#see <https://www.gnu.org/licenses/>.

#Name: ${sedscript}
#Purpose:
#Version: beta 0.01
#Author: SGOTI (Some Guy On The Internet)
#Date: $(${date} +%F)

#declaration:

#start:

EOS

[[ -f "${sedscript}" ]] && c700 ${sedscript} \
    || ${echo} "Good Heavens! There isn't a \"${sedscript}\"";
return;
}

