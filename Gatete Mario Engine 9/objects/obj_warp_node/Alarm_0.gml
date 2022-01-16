/// @description Shoot Mario like a cannon ball

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Create smoke particles based on cannon direcion
switch (cannon) {
	
	//Diagonal Left
	case ("Diagonal Left"): {

		repeat (16)
			with (instance_create_depth(x, y, 150, obj_smoke))
				motion_set(random_range(120, 150), random(6));
	} break;
	
	//Diagonal Right
	case ("Diagonal Right"): {
		
		repeat (16)
			with (instance_create_depth(x, y, 150, obj_smoke))
				motion_set(random_range(30, 60), random(6));
	} break;
}

//Set up the player state
mario.state = playerstate.jump;
mario.jumping = 1;

//Enable player gravity
mario.alarm[10] = 16;

//Make the player run
mario.pmeter = global.pmeter_limit;
mario.run = 1;

//Set player vertical speed
mario.yspeed = -3.5;

//Set player horizontal speed
if (cannon == "Diagonal Right")
	mario.xspeed = 3.5;
else if (cannon == "Diagonal Left")
	mario.xspeed = -3.5;