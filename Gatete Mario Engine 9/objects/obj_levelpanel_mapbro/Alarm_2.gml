/// @description Animate and set beat animation

//If the game has not been cleared fully
if (global.gameclear < 100) {

	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);

	//Set frame
	image_index = 2;

	//Create a smoke effect
	with (instance_create_depth(x + 8, y + 8, -4, obj_smoke)) {

		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	//Beaten
	beaten = 2;
}

//End clear sequence
global.clear = 0;
    
//Make Mario able to move again
with (obj_mapmario) alarm[1] = 64;