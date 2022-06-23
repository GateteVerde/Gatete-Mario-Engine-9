/// @desc Stay always in front and update timers

var level_amount = LEVEL_AMOUNT;
var exits_amount = EXITS_AMOUNT;
var pstar_amount = STARS_AMOUNT;

//Calculate percentage
got = (global.cleared_levels + ds_map_size(global.powerstars) + global.starcoins + (global.palace_y + global.palace_g + global.palace_r + global.palace_b));
total = exits_amount + pstar_amount + (level_amount * 3) + (1 + 1 + 1 + 1);
global.gameclear = floor(got/total*100);

//Update timers
timer_system_update();

//Update Window Caption
window_set_caption("Gatete Mario Engine 9")

//Keep music looper active
instance_activate_object(obj_audio_loop_sound);

//Keep light control active
instance_activate_object(obj_lightcontrol);

//Update shaders
update_shockwave();

//Stay always at the front
depth = -1000;

//Music Pitch / Pause
#region MUSIC PITCH

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
	
	#region PAUSE / RESUME

		//Pause sounds when 'Hurry' is playing
		if (audio_is_playing(snd_hurry)) 
		|| (audio_is_playing(snd_mushroom)) 
		|| (audio_is_playing(snd_hawksong)) {
		
		    //Pause 'levelmusic'
		    if (audio_is_playing(global.stream)) 
		        audio_pause_sound(global.stream);
    
		    //Pause 'Starman'
		    else if (audio_is_playing(snd_starman))
		        audio_pause_sound(snd_starman);
        
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