snapshot_fs() {
    randval=$RANDOM
    before_name="/tmp/fs-$randval.before"
    after_name="/tmp/fs-$randval.after"

    sudo find / -xdev | sort > $before_name

    echo Starting: "$@"
    eval $(printf "%q " "$@")

    sudo find / -xdev | sort > $after_name
    echo $randval
    echo "Snapshots in " $before_name $after_name
}

diff_snapshots() {
    diff -daU 0 /tmp/fs-$1.before /tmp/fs-$1.after | grep -vE '^(@@|\+\+\+|---)' | grep -v /tmp/fs-
}

diff_fs() {
    randval=$RANDOM
    before_name="/tmp/fs-$randval.before"
    after_name="/tmp/fs-$randval.after"

    sudo find / -xdev | sort > $before_name

    echo Starting: "$@"
    eval $(printf "%q " "$@")

    sudo find / -xdev | sort > $after_name
    echo $randval
    echo "Snapshots in " $before_name $after_name

    diff -daU 0 $before_name $after_name | grep -vE '^(@@|\+\+\+|---)' | grep -v /tmp/fs-
}
