/// @description Set offset

//If not kicked
if (ready == 0) && (ret != -2) {
	
	//Repeat the process
	alarm[0] = 1;

	//Set up offset
	if (offset != 1)
		offset = 1;
	else if (offset == 1)
		offset = -1;
}