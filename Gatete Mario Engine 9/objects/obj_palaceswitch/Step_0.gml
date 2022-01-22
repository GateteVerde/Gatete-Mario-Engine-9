/// @description Palace Switch logic

//If the switch has not been pressed yet
if (ready == 0) {

    //Check for Mario
    var player = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);
    
    //If Mario does exist
    if (player)
    && (player.state < playerstate.jump) {
    
        //Play 'Thwomp' sound
        audio_play_sound(snd_goalgate, 0, false);
        
        //Destroy solid mask
        with (mysolid) y += 16;
        
        //Perform level control event
        with (obj_levelcontrol) {
		
			//Stop all music and fanfares
			event_user(0);
			
			//Stop timers
			alarm[2] = -1;
			alarm[3] = -1;
			alarm[4] = -4;
		}
		
		#region MARIO
		
			with (player) {
			
				//Disable control
				enable_control = false;

				//Jump
				yspeed = -3;
			}
		#endregion
		
		//Press
		ready = 1;
        
        //Do not animate
        image_speed = 0;
        image_index = 1;
        
        //Perform switch events
        alarm[0] = ceil(audio_sound_length(snd_thud) * room_speed);
    }
}

//Exit the level when the music is not playing
else if (ready == 2)
&& (audio_is_playing(snd_goalgate_b))
	alarm[1] = 120;