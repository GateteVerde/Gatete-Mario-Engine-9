/// @description Pop the bubble

//If the bubble is ready
if (ready == 1) {
	
	//If Mario is above this bubble
	if (other.bbox_bottom < bbox_top-yspeed+8)
		with (other) event_user(1);
		
	//Otherwise
	else {

		//Stop movement of the player if not sliding
		with (other) {

		    if (sliding == 0) {
				
				xspeed = 0;			
				yspeed = 0;
		    }
		}
	}

	//Destroy
	alarm[1] = 1;
}