/// @description Pop

//Play 'Pop' sound
audio_play_sound(snd_pop, 0, false);

//If an enemy has been captured...
if (capture == 1) {

	//...create a coin
	with (instance_create_layer(other.x, other.y - 4, "Main", obj_coinnpc))
		xspeed = random_range(-1, 1);
}

//Create 'Pop' effect
with (instance_create_depth(x, y, -6, obj_smoke)) sprite_index = spr_pop;

//Destroy
instance_destroy();


