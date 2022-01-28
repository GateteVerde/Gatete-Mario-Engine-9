/// @description Give lives

//If not ready
if (ready == 0) {

	//If the object reaches y point
	if (y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 + 32) {
		
		//Snap in position
		y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 + 32;
		
		//Stop vertical speed
		vspeed = 0;
		ready = 1;
		
		//Play '1-UP' sound
		audio_play_sound(snd_1up, 0, false)
		
		//Get a life
		lives++;
		
		//If the game is still giving extra lives
		if (obj_coordinator.addlives == 0) {
			
			//With the coordinator
			with (obj_coordinator) {
			
				//Give spare lives
				alarm[2] = 30;
			
				//Switch based on image index
				switch (other.image_index) {
			
					case (1): obj_coordinator.addlives += 1; break;
					case (2): obj_coordinator.addlives += 2; break;
					case (3): obj_coordinator.addlives += 4; break;
				}
			}
		}		
	}
}