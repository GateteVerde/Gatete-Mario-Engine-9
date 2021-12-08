/// @description Check if the message is too long



//Temporary variables
var i = 0;
var new_line = 0;

//Iterate through all the text
for (i=1; i<=string_length(text); i++) {
	
	//If there's a hash in position
    if (string_char_at(text, i) = "#") {
		
		//Swap to next line
        new_line += 1;
        if (new_line == 7) {
			
            new_text = string_hash_to_newline(string_copy(text, i+1, string_length(text)-i));
            text = string_hash_to_newline(string_copy(text, 1, i));
            break;
        }
    }
}

//Set the number of characters being displayed
a = 0;

//Set the alarm for playing sound effects
alarm[2] = 1;