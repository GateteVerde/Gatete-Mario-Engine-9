/// @function superlerp(val1, val2, amount);
/// @param val1
/// @param val2
/// @param amount

function superlerp(val1, val2, amount) {

	if (abs(val1 - val2) <= amount) {
		
	    return val2;
	}
	
	return val1 + sign(val2 - val1) * amount;
}