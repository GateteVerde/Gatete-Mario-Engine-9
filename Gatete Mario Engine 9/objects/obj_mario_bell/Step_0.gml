/// @description Bell Mario logic

//Inherit the parent event
event_inherited();

//Animate cape if it is visible
cape_anim += 0.065+abs(xspeed)/7.5;

//Animate Yoshi if riding one
anim += 0.065+abs(xspeed)/7.5;
if (anim > 2.99) {
	
	anim = 0;
}

//If the player did not entered the house
if (ready == 0)
&& (x > obj_bell_house.x + 24)
&& (audio_is_playing(snd_bellsong) == false) {
	
	//Play 'Bell Song' fanfare
	audio_play_sound(snd_bellsong, 0, false);
	
	//Stay inside the house
	x = obj_bell_house.x + 24;
	
	//Stop animation
	anim = 0;

    //The player entered the house
    ready = 1;
    
    //Stop him
    xspeed = 0;
}

//Make it move when landed
if (yadd == 0)
&& (ready == 0)
    xspeed = 1;
	
//Take points off time when the fanfare is not playing
if (ready == 1)
&& (ready2 == 0)
&& (!audio_is_playing(snd_bellsong)) {

	ready2 = 1;
    event_user(15);
}