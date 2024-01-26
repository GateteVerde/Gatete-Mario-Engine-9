/// @desc Stay always in front and update timers

//Set percentage variables
var level_amount = LEVEL_AMOUNT;
var exits_amount = EXITS_AMOUNT;
var pstar_amount = STARS_AMOUNT;

//Calculate percentage
got = (global.cleared_levels + ds_map_size(global.powerstars) + global.starcoins + (global.palace_y + global.palace_g + global.palace_r + global.palace_b));
total = exits_amount + pstar_amount + (level_amount * 3) + (1 + 1 + 1 + 1);
global.gameclear = floor(got/total*100);

//Update shaders
update_shockwave();

//Update timers
timer_system_update();

//Update Window Caption
window_set_caption("Gatete Mario Engine 9")

//Keep music looper active
instance_activate_object(obj_audio_loop_sound);

//Keep light control active
instance_activate_object(obj_lightcontrol);

//Stay always at the front
depth = -1000;

//Resets combos if enabled
#region

	with (all) {
	
		//If the combo is higher
		if (variable_instance_exists(id, "hitcombo"))
		&& (hitcombo > 7)
		&& (global.combo_reset == true)
			hitcombo = 0;
	}
#endregion

//Music Pitch / Pause / Volume
#region

	#region VOLUME
	
		//Manage Music volume
		audio_group_set_gain(audiogroup_music, obj_coordinator.music_vol, 1);
		
		//Manage Sound volume
		audio_group_set_gain(audiogroup_default, obj_coordinator.sound_vol, 1);
	#endregion

	#region PITCH
	
		//If the level controller exists, set pitch to default.
		if (instance_exists(obj_mapcontrol))
			pitch = 1;
		
		else {
		
			//If Mario has died or the level has been cleared, set to default.
			if ((instance_exists(obj_mario_dead)) || (global.clear > 0))
				pitch = 1;
			
			//Otherwise
			else {
		
				//If the timer is greater than 0 and lower than 100
				if (global.timer > 0)
				&& (global.timer < 101) {
				
					if (!instance_exists(obj_mario_balloon))
						pitch = 1.33;
					else
						pitch = 1.13;
				}
				
				//Otherwise
				else {
				
					if (!instance_exists(obj_mario_balloon))
						pitch = 1;
					else
						pitch = 0.8;
				}
			}
		}
	
	#endregion
	
	#region PAUSE / RESUME

		//Pause sounds when the game is paused or 'Hurry', 'Mushroom' or 'Hawk Song' is playing
		if (instance_number(obj_pause) > 0)
		|| (audio_is_playing(snd_hurry)) 
		|| (audio_is_playing(snd_mushroom)) 
		|| (audio_is_playing(snd_hawksong)) {
		
		    //Pause 'levelmusic'
		    if (audio_is_playing(global.stream)) 
		        audio_pause_sound(global.stream);
    
		    //Pause 'Starman'
		    else if (audio_is_playing(snd_starman))
		        audio_pause_sound(snd_starman);
				
			//Pause 'P-Switch'
		    else if (audio_is_playing(snd_pswitch))
		        audio_pause_sound(snd_pswitch);
        
		    //Pause 'Mega Mushroom'
		    else if (audio_is_playing(snd_megashroom))
		        audio_pause_sound(snd_megashroom);
		}
	
		//Otherwise
		else {
		
		    //Pause 'levelmusic'
		    if (audio_is_paused(global.stream)) 
		        audio_resume_sound(global.stream);
    
		    //Pause 'Starman'
		    else if (audio_is_paused(snd_starman))
		        audio_resume_sound(snd_starman);
			
			//Pause 'P-Switch'
			else if (audio_is_paused(snd_pswitch))
				audio_resume_sound(snd_pswitch);
        
		    //Pause 'Mega Mushroom'
		    else if (audio_is_paused(snd_megashroom))
		        audio_resume_sound(snd_megashroom);
		}
	#endregion
	
	//Set stream pitch based on global.pitch value
	if (audio_is_playing(global.stream))
		audio_sound_pitch(global.stream, pitch);
		
	//Set starman pitch based on global.pitch value
	if (audio_is_playing(snd_starman))
		audio_sound_pitch(snd_starman, pitch);
		
	//Set p-switch pitch based on global.pitch value
	if (audio_is_playing(snd_pswitch))
		audio_sound_pitch(snd_pswitch, pitch);
		
	//Set megashroom pitch based on global.pitch value
	if (audio_is_playing(snd_megashroom))
		audio_sound_pitch(snd_megashroom, pitch);
#endregion

//Award extra lives every 100 coins
if (global.coins > 99) {

	//Restart coin counter
	global.coins -= 100;
	
	//If the game is still giving extra lives
	if (addlives == 0) {
			
		//Play '1-UP' sound
		audio_play_sound(snd_1up, 0, false);
		
		//Add extra lives
		lives++;
	}
	else
		addlives++;
}

//Prevent lives from going over 99
if (lives > 99) 
	lives = 99;
	
//Prevent score from going over 99999990
if (score > 99999990) 
	score = 99999990;