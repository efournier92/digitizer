source $(dirname $0)/utilities/fs.bash

### 
test_get_output_file_should_return_a_properly_formatted_path() {
  output_file_name="test_output"
  output_file_extension="mp4"
  expected_result="./${output_file_name}.${output_file_extension}"

  result=$(get_output_file ${output_file_name} ${output_file_extension})

  assertEquals "${result}" "${expected_result}"
}

suite_addTest test_get_output_file_should_return_a_properly_formatted_path
