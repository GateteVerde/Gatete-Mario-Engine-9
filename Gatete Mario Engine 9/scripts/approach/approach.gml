/// @function approach(start, end, shift);
/// @param start
/// @param end
/// @param shift

function approach() {

	if (argument[0] < argument[1])
		return min(argument[0] + argument[2], argument[1]); 
	else
		return max(argument[0] - argument[2], argument[1]);
}