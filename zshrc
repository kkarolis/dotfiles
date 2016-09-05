# Path to your oh-my-zsh installation.
setopt HIST_IGNORE_SPACE
export ZSH=/usr/share/oh-my-zsh

# . $HOME/.zsh/plugins/bd/bd.zsh
. /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
. /usr/share/fzf/key-bindings.zsh


export EDITOR=nvim
export SUDO_EDITOR=nvim
export GOPATH="$HOME/.gosrc"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib64/:/lib64"

# ZSH options
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
XDG_CONFIG_HOME=$HOME/.config

# User configuration
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:$HOME/bin:$HOME/programs/CppUTest/scripts:/usr/bin/vendor_perl/:/opt/cuda/bin"
PATH=$PATH:$JAVA_HOME
PATH=$PATH:"/usr/lib/jvm/java-8-openjdk/bin/"
PATH=$PATH:"$HOME/.npm-packages/bin"
PATH=$PATH:"$HOME/.gem/ruby/2.1.0/bin/"
PATH=$PATH:"$HOME/.gem/ruby/2.2.0/bin"
PATH=$PATH:"$HOME/.gem/ruby/2.3.0/bin"
PATH=$PATH:$GOPATH
PATH=$PATH:"$HOME/bin"
export PATH=$PATH

DEFAULT_USER="$USER"

unset GREP_OPTIONS
SSH_ENV=$HOME/.ssh/environment
# }}}
# Start the ssh-agent {{{
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo Succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
    /usr/bin/ssh-add ~/.ssh/id_odoo_enterprise
}
# }}}
#
#
# SSH agent startup {{{
ssha() {
    if [ -f "${SSH_ENV}" ]; then
	 . "${SSH_ENV}" > /dev/null
	 ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
    else
	start_agent;
    fi
}
# }}}
mktodaydir() {
    today_date=`date +%Y%m%d`
    mkdir $1_$today_date     
}
# Various ls aliases {{{
alias ll='ls -l --color=auto'
alias la='ll -A'

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ackp="ack --type=python"
alias ackx="ack --type=xml"

alias gignore="curl https://www.gitignore.io/api/vim,eclipse,sublimetext,python"
alias dockerma="docker ps -a | grep -v 'pgsql\|CONTAINER\|attach' | awk '{print \$1}' | xargs docker stop -t 0 | xargs docker rm"
alias dockermi="docker images -q | xargs docker rmi -f"
alias dockercim="docker images -q --filter 'dangling=true' | xargs docker rmi"
alias dexec="docker exec -t"
alias drun="docker-compose run -e CI=true"
alias f8='flake8'
alias pep88="pep8 --ignore=E501 --exclude=.ropeproject ./"

alias py3="source $HOME/py3/bin/activate"
alias py2="source $HOME/venv/py27/bin/activate"

alias vim="nvim"
alias mpriv="ecryptfs-mount-private"
alias umpriv="ecryptfs-umount-private"

# Correct colors in tmux and friends
alias tmux="TERM=xterm-256color tmux"
alias tmuxinator='TERM=xterm-256color tmuxinator'
alias mux='TERM=xterm-256color mux'
alias sizes='du -h -d 1 -x | sort -r -h'
source $HOME/venv/py27/bin/activate

docker-start() {
    prev_command=`docker inspect -f '{{range $index, $cmd := .Config.Cmd}}{{ if $index }} {{ end }}{{print $cmd}}{{end}}' $1 2> /dev/null`
    current_command=${@:2}
    container=$1
    if [ -z "$prev_command" ]; then
	docker-compose run --name $container --service-ports odoo $current_command
    else
	if [ "$prev_command" = "$current_command" ]; then
	    docker stop -t 0 $container 2> /dev/null
	    docker-compose start
	    docker start -ai $container
	else
	    docker stop -t 0 $container > /dev/null
	    docker rm $container > /dev/null
	    docker-compose run --name $container --service-ports odoo $current_command
	fi
    fi
}

dbuild() {
    image=$(python -c "import yaml;fp=open('docker-compose.yml', 'r');print(yaml.load(fp).get('odoo',{}).get('image'));fp.close();")
    docker build -t $image .
}

dockershow() {
    docker ps -a -f name=$1
}

dockerindx() {
    pgsql_container=`docker ps -a | grep $1 | grep pgsql | awk '{print $1}'`
    docker start $pgsql_container
    docker exec $pgsql_container psql -d $2 -c 'REINDEX INDEX ir_translation_src_hash_idx'
}

dip() {
    docker inspect -f '{{ .NetworkSettings.IPAddress }}' $1
}

linefix() {
    in2csv --quoting 1 $1 | csvformat -U 1 -M \# | sed ':a;N;$!ba;s/\n/\\n/g' | sed 's/\#/\n/g' > data.csv
    mv data.csv $1
}

pollen-dir-build() {
  HOST=pollen.hbee.eu
  cd $1
  TAG=`git rev-parse --abbrev-ref HEAD`
  if [[ "$TAG" != "master" ]]; then
      docker build -t ${HOST}/$1:${TAG} .
  else
      docker build -t ${HOST}/$1 .
  fi
  cd -
}

pollen-build() {
    for dir in "$@"
    do
	pollen-dir-build $dir
    done
}

regen-template() {
    tmpdir=tmpdir
    mrbob -q -O $tmpdir -n -c $1/.mrbob.ini odoo:project
    project_dir_name=`cd $tmpdir && ls`
    rsync -a tmpdir/$project_dir_name/. $1/
    rm -r tmpdir
}

docker-reset-db() {
    docker-compose run --rm --service-ports -e CI=true odoo dropdb $1
    docker-compose run --rm --service-ports -e CI=true odoo createdb -O odoo -T $2 $1
}

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
