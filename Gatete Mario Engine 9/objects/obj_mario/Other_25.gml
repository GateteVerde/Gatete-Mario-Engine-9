/// @description Reset variables after landing

//If Mario's state was 2
if (inair == 1) {
	
	//Change inair
	inair = 0;

	//Create puff of smoke if Mario has the mega mushroom
	if (swimming == 0)
	&& (inairtime >= 15)
	&& (global.powerup == cs_mega) {

		//Play 'Thud' sound
		audio_play_sound(snd_thud, 0, false);
		
		//Reset timer
		inairtime = 0;

		//Shake the screen
		shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);
	
		//Create smoke effect
		with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_supersmash;
		with (instance_create_depth(x, y, -6, obj_smoke)) {
	
			sprite_index = spr_supersmash;
			image_xscale = -1;
		}
	}
}

//Enable gravity
disablegrav = 0;

//Reset angle
angle = 0;
somersault = 0;

//Reset bee flight
beefly = 0;

//Allow the player to jump again
jumping = 0;

//Reset spin jump variable
jumpstyle = 0;

//Reset the wall kick
wallkick = 0;
wallready = 0;

//Reset the cat climb time
catclimbing = 0;

//Reset the squirrel variables
squirreltime = 0;
squirrelpropel = 0;

//Reset combo variable if not sliding
if (!sliding) 
	hitcombo = 0;