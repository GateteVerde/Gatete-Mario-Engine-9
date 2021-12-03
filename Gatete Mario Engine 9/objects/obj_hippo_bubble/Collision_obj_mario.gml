/// @description If Mario is not riding this bubble

if (ison == 0) 
&& (delay == 0) {
	
	//If Mario does have the mega powerup, pop the bubble
	if (global.powerup == cs_mega) {
	
		event_user(0);
		exit;
	}

	//Make Mario ride this bubble
	ison = 1;
	
	//Begin destroy alarms
	alarm[0] = 1620;
	alarm[1] = 1800;
	
	//Stop path
	path_end();
}