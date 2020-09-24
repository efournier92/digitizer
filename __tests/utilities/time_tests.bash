
test_time_right_now_return_value() {
  local message="It should return the current time formatted as an integer"
  local result=`get_time_right_now`
  local expected_result=`date '+%y%m%d%H%M%S'`

  assertEquals "${expected_result}" "${result}"
}
