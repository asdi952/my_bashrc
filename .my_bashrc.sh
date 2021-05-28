

#FILE_PATH=$BASH_SOURCE
#BASHRC_PATH=$HOME/.bashrc

EXCUTED_BY="$(cat /proc/$$/comm)"
if [ "$1" == "-init" ]; then
    

    return;
fi

export MY_BASHRC="0.00"

declare -A -g bash_paths

bash_paths["FILE_PATH"]="$BASH_SOURCE"
bash_paths["BASHRC_PATH"]="$HOME/.bashrc"
bash_paths["ome"]="$HOME/.bashrc"


HISTCONTROL=ignoredups
PS1="\n\[\e[07;32m\] ---> \[\e[00m\] \[\e[07;37m\]"
#PS1="\n\[\e[07;32m\] ---> \[\e[00m\] \[\e[07;37m\]" -- good one
PS0="\[\e[00m\]"
#PS1="\e\n\e[7;32m ---> \e[m "
#PS3="\n"
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\0

#export PROMPT_COMMAND=$'date +\n'

alias ch=google-chrome-stable
alias gmod="steam steam://rungameid/4000 &"
alias t=tree

THISS="coco"

#------------------------
function get_thefkout(){
    while true; do say Get the fuck out; done
}
function add_paths(){
    echo "$1   $2"
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "missing params 1 and/or 2"
        return
    fi
    bash_paths["$1"]="$2"
}
add_paths "abc" "this is something"

#--------VIMRC----------------
function setup_bashrc(){
    echo ${dic[a]}
}


function w(){
    local aux=$(hostname --all-ip-addresses)
    printf "user: $USER | pwd: $PWD \n"
    echo "hostname: $HOSTNAME | ip: ${aux%% *}"
}

function edit_bashrc(){
    vi $BASH_SOURCE
}

function edit_vimrc(){
    vi $HOME/_vimrc
}

function reload_bash(){
    source ~/.bashrc
}

function reset_bash(){

    cp ~/.bashrc $(mktemp)
    cp /etc/skels/.bashrc ~/.bashrc
}

function show_bashrc_vars(){
    for keys in ${!bash_paths[@]}; do
        echo "$keys -> ${bash_paths[$keys]}"
    done
}

function send_to_github(){
    local dir=$BASH_SOURCE

    cd $(dirname $dir)

    if [ ! -d .git ]; then
        git init 
    fi 
    echo "adding file - $(basename $dir)"
    git add $(basename $dir)
    git diff-index --quiet HEAD || git commit -m "automatic save"
    git push https://github.com/asdi952/my_bashrc master
}


function mfind(){
	if [[ $1 == "" ]] || [[ $2 == "" ]];then
		echo "lack of the 2 first  args"
		return 0
	fi
        local aux=""
        if [[ $3 != "" ]]; then
		aux="-type $3"
	fi
	echo "find $1 -name $2 $aux -print 2>/dev/null"
	find $1 -name $2 $aux -print 2>/dev/null
}

function cf(){
	if [[ $1 == "" ]];then
		cd .. && ls
		return 1
	fi
	cd $1 && ls 
}
function make_gif(){
	local name=$1
	shift

	echo convert -delay 200 -loop 0 $@ $name
	convert -delay 200 -loop 0 $@ $name
}
function rename_file_enumerate(){
	local array=$@
	if [ $# == 0 ]; then
        echo "no arguments, needs '*.png'"
		return 
	fi

	let count=0
	for e in $array;do
		local ext="${e##*.}"
		echo $ext
		echo $e to file_$count$ext
		mv "$e" file_$count.$ext
		let count=count+1
	done
}

function hacking(){
    while [ true ];do du /; done
}

function convert_img_res(){
	local res=$1
	shift
	local array=$@
	for e in $array; do
		echo convert $e -resize "$res" $e$res
		convert $e -resize "$res" $e$res
	done
}

function convert_img_res_force(){
	local res=$1
	shift
	local array=$@
	for e in $array; do
		echo convert $e -resize "$res!" $e$res
		convert $e -resize "$res!" $e$res
	done
}

function convert_file_format(){
	local ext=$1
	shift
	local array=$@
	
	for e in $array; do
		local wo_ext="${e%.*}"
		echo "convert $e ${wo_ext}.$ext"
		convert $e ${wo_ext}.$ext
	done
}
function rename(){
    mv $1 $2
}

function add_bash(){
    echo "BASH_SOURCE is $BASH_SOURCE"

    if [[ -z "${MY_BASHRC}" ]] || [ "$1" == "-f" ]; then
        echo "source $BASH_SOURCE" >> $HOME/.bashrc
        source "$BASH_SOURCE"
    else
        echo "my_bashrc already exist"
        echo "use -f, to force adding, maybe overlaps"
    fi
    #echo "$BASH_SOURCE" >> ~/.bashrc
}

function load_vimnrc(){
    if [ -f "$HOME/.vimrc" ]; then
        mv "$HOME/.vimrc" "/tmp/vimrc_$RANDOM"
    fi 

    cd $HOME
    wget https://raw.githubusercontent.com/asdi952/vimrc/master/_vimrc
}

function ssh_aws_0 (){
    cd ~/Downloads
    ssh -i "oracle_db.pem" ec2-user@ec2-18-197-149-58.eu-central-1.compute.amazonaws.com

}

function ssh_aws_1(){
    cd ~/Downloads
    ssh -i "oracle_db.pem" ec2-user@ec2-54-93-106-70.eu-central-1.compute.amazonaws.com

}

function ssh_aws_2(){
    cd ~/Downloads
    ssh -i "oracle_db.pem" ec2-user@ec2-3-121-209-188.eu-central-1.compute.amazonaws.com

}

function ssh_aws_3(){
    cd ~/Downloads
    ssh -i "oracle_db.pem" ec2-user@ec2-18-198-25-136.eu-central-1.compute.amazonaws.com
}

#sudo scp -i "oracle_db.pem" /home/you/Downloads/oracle-database-ee-19c-1.0-1.x86_64.rpm ec2-user@ec2-18-197-149-58.eu-central-1.compute.amazonaws.com:/home/ec2-user/downloads/

#------EXPORT_SECTION ----------------------

