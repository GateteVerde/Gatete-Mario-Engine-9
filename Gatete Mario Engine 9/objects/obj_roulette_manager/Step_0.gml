/// @description Manage minigame

//Play 'Drumroll' if the two first frames match
if (rouend == 0) {

	//If the drumroll sound is not playing
	if (drumroll == 0)
	&& (obj_roulette_1.stop == 2)
	&& (obj_roulette_2.stop == 2)
	&& (rou2 == rou1) {
		
		drumroll = 1;
		audio_play_sound(snd_drumroll, 0, true);
	}
}

//If all frames are stopped
else if (rouend == 1) {

    //Give 2-UP
    if ((rou1 == 0) && (rou2 == 0) && (rou3 == 0)) {
            
        //Stop music
        audio_stop_sound(snd_minigame);
        
        //Play 'Card Song - No Match' fanfare
		audio_play_sound(snd_cardsong_nomatch, 0, false);
		
        //Give 2 extra lives
		with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -4, obj_score_minigame)) image_index = 1;
        
        //End the bonus
        rouend = 2;
    }
    
    //Give 3-UP
    else if ((rou1 == 1) && (rou2 == 1) && (rou3 == 1)) {
            
        //Stop music
        audio_stop_sound(snd_minigame);
        
        //Play 'Card Song - No Match' fanfare
		audio_play_sound(snd_cardsong_nomatch, 0, false);
		
        //Give 3 extra lives
		with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -4, obj_score_minigame)) image_index = 2;
        
        //End the bonus
        rouend = 2;
    }
    
    //Give 5-UP
    else if ((rou1 == 2) && (rou2 == 2) && (rou3 == 2)) {
            
        //Stop music
        audio_stop_sound(snd_minigame);
        
        //Play 'Card Song - No Match' fanfare
		audio_play_sound(snd_cardsong_nomatch, 0, false);
		
        //Give 5 extra lives
		with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -4, obj_score_minigame)) image_index = 3;
        
        //End the bonus
        rouend = 2;
    }
    
    //Otherwise, do not give a thing.
    else {
    
        //Play 'Wrong' sound
        audio_play_sound(snd_wrong, 0, false);        
        
        //End the bonus
        rouend = 3;
    }
    
    //Exit
    alarm[0] = 240;
}

//Stop both 'Drumroll' and 'P-Meter' sound
if (rouend > 0) {
	
	audio_stop_sound(snd_drumroll);
    audio_stop_sound(snd_pmeter);
}