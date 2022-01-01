/// @function string_make_width(text, width);
/// @param text
/// @param width

function string_make_width() {
	
	//Temporary variables
	var str, length, word, ret, ret2;
	
	//String variables
	str = argument[0] + " ";
	length = string_count(" ", str)
	ret = ""
	
	//Iterate through all text
	for(var i = 0; i < length; i++) {
		
	    word = string_copy(str, 1, string_pos(" ", str) - 1);
	    str = string_copy(str, string_pos(" ",str) + 1, string_length(str));
	    ret2 = ret + word + " ";
		
		//If the width of the text is greater than the value given on argument[1]
	    if (string_width(string_hash_to_newline(ret2)) > argument[1]) {
			
	        ret2 = ret + "#" + word + " ";
		}
	    ret = ret2;
	}
	
	//Return ret
	return ret;
}