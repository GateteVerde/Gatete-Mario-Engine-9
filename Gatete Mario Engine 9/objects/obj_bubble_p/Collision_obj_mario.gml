/// @description Pop the bubble

//If the bubble is ready
if (ready == 1) {
	
	//If Mario is above this bubble
	if (other.bbox_bottom < bbox_top-yspeed+8) {
		
		with (other) event_user(1);
	}

	//Destroy
	alarm[1] = 1;
}