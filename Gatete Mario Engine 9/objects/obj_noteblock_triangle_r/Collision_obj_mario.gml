/// @description Make Mario jump in the opposite direction

///Make the player bounce in the opposite direction

//If the block has not been bumped and the player is not jumping
if (ready == 0)
&& (other.state != playerstate.jump) {
    
    //This block is hit
    ready = 1;

    //Move down
    motion_set(315, 2);
    alarm[0] = 4;

    //Make the player bounce
    with (obj_mario) {
    
        //Play 'Trampoline' sound
        audio_play_sound(snd_trampoline, 0, false);
		
		//Make Mario jump
		event_user(1);

		//Set the horizontal speed
        xspeed = -3;
        
        //Facing direction
        xscale = -1;
        
        //Switch to jump state
        state = playerstate.jump;
    }
}