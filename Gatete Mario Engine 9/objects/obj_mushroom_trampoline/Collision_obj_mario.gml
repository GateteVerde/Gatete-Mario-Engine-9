/// @description Make Mario bounce

if (other.yspeed > 0)
&& (other.bbox_bottom < yprevious+5) {

	//Start wiggling
	ready = 1;

    //Make Mario bounce
    with (other) {

        //Set the vertical speed
        yspeed = -4.125;
        
        //Boost jump
        y--;
        
        //Switch to jump state
        state = playerstate.jump;
		
		//Play 'Trampoline' sound
		audio_play_sound(snd_trampoline, 0, false);
        
        //Check if the 'Jump' key is pressed.
        if (input_check(input.action_0))
            jumping = 1;
        else
            jumping = 2;
    }
}