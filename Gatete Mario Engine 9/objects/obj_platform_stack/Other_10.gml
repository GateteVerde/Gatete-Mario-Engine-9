/// @description Deploy blocks

if (h < (h_max * 16)) {

	//If the block is not deployed,deploy it and begin emplace timer.
	if (deploy == 0) {
	
		//Deploy the blocks
		deploy = 1;
		h += 16;
	}
	
	//Otherwise, if the block is deployed and it's not emplacing, reset timer.
	else if (deploy == 1)
		h += 16;
}

//Begin timer
if (deploy != 2)
&& (alarm[2] < 300)
	alarm[2] = 300;