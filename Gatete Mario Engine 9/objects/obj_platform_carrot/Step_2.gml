/// @description Carrot Lift logic

//Inherit the parent event
event_inherited();

//Make the platform fall if Mario steps on it
if (ready == 0) {

	//Check for the player
	var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

	//If the player exists
	if (mario)
	&& (mario.state != playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5) {
		
		//Play 'Trampoline' sound
		audio_play_sound(snd_trampoline, 0, false);
	
		//Make the platform fall
		ready = 1;
		
		//Set vertical speed
		vspeed = -1.5;
	}
}

//Otherwise, if the platform is ascending
if ((ready == 1) && (y < ystart-64)) {

    //Make it descend
    ready = 2;
    
    //Set the vertical speed
    vspeed = 0.5;
}

//Otherwise, if the lift is descending and below the start position, keep it in place
else if ((ready == 2) && (y > ystart)) {

    //Make it able to ascend after a while
    alarm[0] = 60;
    
    //Do not move
    ready = 3;
        
    //Stop vertical movement
    vspeed = 0;
    y = ystart;
}