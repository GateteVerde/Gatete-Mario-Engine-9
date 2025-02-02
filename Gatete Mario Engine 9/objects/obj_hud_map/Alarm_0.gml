/// @description Display Mario + Lives / Star Coins

//Repeat this process
alarm[0] = 180;

//Show next stat
prompt++;

//Toggle between stats
if (prompt > 1) {
	
	//If the stars are being shown
	if (prompt > 3)
		prompt = 0;
		
	//Otherwise
	else {
	
		//If Mario did collect a power star
		if (ds_map_size(global.powerstars) > 0)
			prompt = 3;
		else
			prompt = 0;
	}
}