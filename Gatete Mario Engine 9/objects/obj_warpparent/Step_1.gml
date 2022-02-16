/// @description Decide to which room should the pipe take to.

//Set up which value will be used
switch (mode) {

    //Coins
    case (0): {
		
		if (variable_instance_exists(id, "coins")) {
			
			check = coins;
		}
	} break;
    
    //Time
    case (1): 
        check = global.timer; 
        break;
    
    //A-Coins
    case (2): 
        check = ds_map_size(global.acecoins); 
        break;
}

//If the value to check is in range A-B
if (check < target_b)
&& (check < target_c) {

	destination_real	= destination[0];
	exit_id_real		= exit_id[0];
	exit_dir_real		= exit_dir[0];
}

//Otherwise, if the value to check is in range B-C
else if (check < target_c) {

	destination_real	= destination[1];
	exit_id_real		= exit_id[1];
	exit_dir_real		= exit_dir[1];
}

//Otherwise, if the value to check is in range C
else {

	destination_real	= destination[2];
	exit_id_real		= exit_id[2];
	exit_dir_real		= exit_dir[2];
}