FAILURE=0

end_test()
{
    local failed=$?
    echo -n "        "
    if [ $failed -eq 0 ] ; then
        echo "OK"
    else
        echo "FAILED"
        FAILURE=1
    fi
    teardown
}


start_test()
{
    echo "    $1"
    setup
}

assert_equals()
{
    if [ "$1" != "$2" ] ; then
        echo "        Expected "$1" but was $2"
        return 1
    fi
}
