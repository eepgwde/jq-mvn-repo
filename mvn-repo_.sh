d_clone () {
    test $# -ge 1 || return 1
    local e_cmd="$1"
    shift

    case $e_cmd in
	local)
	: ${d_dir:=/misc/build/m2/repository}
	: ${d_service:="com/mathworks/ google/ matlabcontrol/ com/pushtechnology/"}

	pushd $d_dir
	pwd
	find $d_service -type f | if [ -z "$nodo" ]
	then
	    afio -p ~-/snapshots
	else
	    cat
	fi
	popd
	;;
    esac
    
}