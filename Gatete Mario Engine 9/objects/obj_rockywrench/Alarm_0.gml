/// @description Start moving

//If the rocky wrench is not outside
if (ready == 0) {
	
	//If Mario does not exists, ignore this event
	if (!instance_exists(obj_mario)) {

		alarm[0] = 1;
		exit;
	}

	//Come out
	ready = 1;
}
	
//Otherwise, come in
else if (ready == 2)
	ready = 3;