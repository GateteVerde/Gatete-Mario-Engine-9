/// @description Split into 2 Hefty Goombas

//Play 'Split' sound
audio_play_sound(snd_split, 0, false);
	
//Create big smoke
with (instance_create_depth(x, y - 8, -6, obj_smoke)) {
	
	image_xscale = 3;
	image_yscale = 3;
}

//Create 2 Hefty Goombas
with (instance_create_depth(x+24, y, -2, obj_goomba_hefty)) { yspeed = -3; xspeed = 0.5; }
with (instance_create_depth(x-24, y, -2, obj_goomba_hefty)) { yspeed = -3; xspeed = -0.5; }
	
//Destroy
instance_destroy();