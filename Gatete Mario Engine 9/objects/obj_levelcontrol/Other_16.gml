/// @description Turn on G-Switch event

//If the switch event is not yet active
if (gswitch_on == false) {

	//Activate event
	gswitch_on = true;
	
	//Reset silver coins
	global.coins_silver = 0;
	
    //Start the switch song if it's not playing.
    alarm[1] = 1;
    if (!audio_is_playing(snd_pswitch)) {
    
        audio_play_sound(snd_pswitch, 1, true);
    }
    
    //Prevent the starman theme from overlapping
    audio_stop_sound(snd_starman);
	
	//Prevent the megashroom theme from overlapping
	audio_stop_sound(snd_megashroom);
}