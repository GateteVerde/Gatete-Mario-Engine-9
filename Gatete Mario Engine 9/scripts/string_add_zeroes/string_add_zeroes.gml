/// @function string_add_zeroes(number,digits);
/// @param number
/// @param digits

function string_add_zeroes() {
	
	var _number, _digits;
	
	_number = argument[0];
	_digits = argument[1];

	return string_replace_all(string_format(_number, _digits, 0), " ", "0");
}