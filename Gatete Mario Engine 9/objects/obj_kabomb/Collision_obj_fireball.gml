/// @description Lit Kab-omb

//Play 'Bump' sound
audio_play_sound(snd_bump, 0, false);

//If this enemy is not lit up
if (charge == 0) {
	
	//Loop 'Fuse' sound
	audio_play_sound(fuse, 0, true);
	
	//Double horizontal speed
	xspeed = xspeed * 2;
	
	//Set vertical speed
	yspeed = -2;
	y--;

	//Lit up
	charge = 1
	
	//Jump
	alarm[0] = 180;
	
	//Move towards Mario
	alarm[11] = 30;
	
	//Multiply animation speed
	image_speed = image_speed * 1.5;
}

//Destroy projectile
with (other) event_user(0);