/// @description Make Mario bounce

//If this object is moving down and it's above
if (other.yspeed > 0)
&& (other.ignore_platforms == false)
&& (other.bbox_bottom < yprevious+5) {
	
	//If this object is ancestor of the physics parent
	if (object_is_ancestor(other.object_index, obj_projectileparent)) {
		
		//If this is a fireball or a snow ball
		if (other.object_index == obj_fireball)
		|| (other.object_index == obj_iceball) 
		|| (other.object_index == obj_fireball_gold) {
		
			other.yspeed = -2.5;
			other.y--;
		}
		else if (other.object_index == obj_superball)
			other.yspeed = -other.yspeed;				
	}
	
	//Otherwise
	else {
		
		//Start wiggling
		ready = 1;

	    //Make Mario bounce
	    with (other) {
		
			//Play 'Trampoline' sound
			audio_play_sound(snd_trampoline, 0, false);

	        //Set the vertical speed
	        yspeed = -6;
        
	        //Boost jump
	        y--;
		}
	}
}