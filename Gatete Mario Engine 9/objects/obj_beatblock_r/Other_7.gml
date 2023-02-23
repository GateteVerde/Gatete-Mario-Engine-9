/// @description End animation

//If the block does animate more
if (beep > 0) {
	
	//If this object is inside view, play 'Beep' sound
	if (outside_view() == false) {

		audio_stop_sound(snd_beep);
		audio_play_sound(snd_beep, 0, false);
	}
	
	//Decrement beeps
    beep--;
}
    
//Otherwise, if the block cannot animate more
else {
	
	//If this object is inside view, play 'Clack' sound
	if (outside_view() == false) {

		audio_stop_sound(snd_clack);
		audio_play_sound(snd_clack, 0, false);
	}
    
    //If solid
    if (sprite_index == spr_beatblock_r) {
    
        //Change into a empty block
        sprite_index = spr_beatblock_outline;
        
        //Destroy solid
        with (mysolid) {
			
			x = -1000;
			y = -1000;
		}
    }
    
    //Otherwise, if not solid
    else {
    
        //Change into a solid block
        sprite_index = spr_beatblock_r;
        
        //Create solid
		with (mysolid) {
		
			x = xstart;
			y = ystart;
		}
    }
    
    //Reset beeps
    beep = 2;
    
    //Reset timer
    alarm[0] = 240;
    
    //Do not animate
    image_speed = 0;
    image_index = 0;
}