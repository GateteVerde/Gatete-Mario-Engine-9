/// @description Break blocks with a boomerang

//Break this block
event_user(15);

//Destroy the projectiles
with (other) {

	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false);
	
	//Create smoke effect
	with (instance_create_depth(x, y, depth - 2, obj_smoke)) sprite_index = spr_smoke_b;

	//Destroy
	instance_destroy();
}