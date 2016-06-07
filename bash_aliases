alias rm='rm -i'

alias grin='grep -rin'

alias enscript='enscript -DDuplex:true -G2r --font=Courier10 --mark-wrapped-lines=arrow'

alias acs='apt-cache search'
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update; sudo apt-get upgrade'

alias seba='source ENV/bin/activate'

alias yo='terminal-notifier -title "Yo!" -message '

alias box='cd ~/Documents/Box\ Sync/'
alias db='cd ~/Documents/Dropbox/'

# common tyop
alias jbos=jobs

# added by Anaconda3 2.4.1 installer
alias condafy='export PATH="/Users/dchud/anaconda3/bin:$PATH"; echo "conda!"'

alias pyspark-notebook="condafy; export PYSPARK_PYTHON=python3; export PYSPARK_DRIVER_PYTHON=jupyter; export PYSPARK_DRIVER_PYTHON_OPTS='notebook' pyspark; pyspark"

alias squidlog='webalizer -c /usr/local/etc/webalizer.conf'
alias squidtail='tail -f /usr/local/var/log/squid/access.log'

alias http='open http://localhost:8123/ && http-server -p 8123 &'

alias dockerlaunch='bash -c "clear && DOCKER_HOST=tcp://192.168.99.100:2376
DOCKER_CERT_PATH=/Users/dchud/.docker/machine/machines/default
DOCKER_TLS_VERIFY=1 /bin/bash"'
