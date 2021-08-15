export PATH="./:$PATH"

wakeuptime()
{
    /bin/date -d "$1" "+%s"
}

expect_wakeup_time()
{
    local alarm
    alarm=`cat ./alarm`
    assert_equals "$(/bin/date -d "$1" +%s)" "$alarm"
    return $?
}

expect_wakeup_file()
{
    local time
    time=`cat ./wakeup`
    assert_equals "$1" "$time"
    return $?
}
