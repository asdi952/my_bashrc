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
		return false
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
