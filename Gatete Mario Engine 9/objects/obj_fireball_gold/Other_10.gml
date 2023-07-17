/// @description Destroy object

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Repeat 32 times
repeat (32) {
	
	with (instance_create_depth(x, y+8, -2, obj_sparkle)) {
	
		sprite_index = (global.player == 0) ? spr_sparkle_b : spr_sparkle_f;
		motion_set(random(360), random(2));
	}
}

//Create ring effect
var col = (global.player == 0) ? make_colour_rgb(252, 224, 25) : make_colour_rgb(128, 128, 128);
effect_create_above(ef_ring, x, y+8, 0, col);

//Create shockwave
instance_create_layer(x, y+8, "Main", obj_explosion_gold);

//Destroy
instance_destroy();