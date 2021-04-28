function mfind(){
	if [[ $1 == "" ]] || [[ $2 == "" ]];then
		echo "lack of the 2 first  args"
		return 0
	fi
        local aux=""
        if [[ $1 != "" ]]; then
		aux="-type $3"
	fi
	echo "find $1 -name $2 $aux -print 2>/dev/null"
	find $1 -name $2 $aux -print 2>/dev/null
}

function cf(){
	if [[ $1 == "" ]];then
		ls
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
		echo convert $e -resize "$res" $e
		convert $e -resize "$res" $e
	done
}

function convert_img_res_force(){
	local res=$1
	shift
	local array=$@
	for e in $array; do
		echo convert $e -resize "$res!" $e
		convert $e -resize "$res!" $e
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
