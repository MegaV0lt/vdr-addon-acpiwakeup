export PATH="./:$PATH"

wakeuptime()
{
    /bin/date -d "$1" "+%s"
}

expect_wakeup_time()
{
    local alarm
    alarm=`cat ./alarm`
    expected_ts=$(/bin/date -d "$1" +%s)
    fake_ts=$(./date +%s)
    offset=$(( expected_ts - fake_ts ))
    assert_equals "+${offset}" "$alarm"
    return $?
}

expect_wakeup_file()
{
    local time
    time=`cat ./wakeup`
    assert_equals "$(/bin/date -d "$1" +%s)" "$time"
    return $?
}
