d_deploy () {
    test $# -ge 1 || return 1

    local e_cmd=$1
    shift

    case $e_cmd in
	all)
	    find . -type f -name 'pom.xml' | m_ ls undot | xargs -n1 dirname | while read i
	    
	    do
		export d_dir=$PWD/$i
		$FUNCNAME local
	    done
	    
	    # $FUNCNAME local
	    ;;

	local)
	    : ${d_dir:=/misc/build/jquant/jquantlib}

	    test -d "$d_dir" || return 1

	    cd $d_dir
	    : ${d_service:=$PWD/../../jq-mvn-repo/snapshots}
	    test -d "$d_service" || return 1

	    if [ "$VERBOSE" = "yes" ]
	    then
		echo $PWD
	    fi

	    $nodo mvn -DaltDeploymentRepository=snapshot-repo::default::file:$d_service clean deploy
	    cd - > /dev/null 2>&1 
	    ;;

	parent)
	    : ${d_dir:=/misc/build/jquant/jquantlib-parent}
	    
	    $FUNCNAME local
	    ;;

    esac
}