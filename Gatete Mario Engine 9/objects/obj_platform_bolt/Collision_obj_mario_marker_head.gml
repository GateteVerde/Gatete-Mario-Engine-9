/// @description This collision happens if the player hits the platform from below.

if (obj_mario.yspeed < 0) {

	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false); 
    
    //Make Mario not jump
    obj_mario.yspeed = 1;
    obj_mario.jumping = 2;
	
	//If there's not a solid to the left
	if (!position_meeting(x - 1, y, obj_solid)) {
    
	    //Animate
	    image_speed = -0.5;
    
	    //Set horizontal speed
	    hspeed = -0.25;
    
	    //Stop it
	    alarm[0] = 30;
	}
}