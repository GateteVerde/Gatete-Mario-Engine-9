/// @description Start walking to the goal castle

//Physics state
ready = 2;

//Play 'Flagsong' music
audio_play_sound(snd_flagsong, 0, false);

//Turn into 'Fire' Mario if you have the 'Gold' powerup
if (global.powerup == cs_gold) {

	//Set 'Fire' powerup
	global.powerup = cs_fire;
	
	//Repeat 6 times
	repeat (32) {

		with (instance_create_depth(x, y, -2, obj_sparkle)) {
	
			sprite_index = (global.player == 0) ? spr_sparkle_b : spr_sparkle_f;
			shrink_rate = 0.0324;
			motion_set(random(360), random_range(1, 3));			
		}
	}

	//Create ring
	with (instance_create_depth(x + 8, y + 8, -2, obj_blend_ring)) {
		
		//Create ring effect
		var col = (global.player == 0) ? make_colour_rgb(252, 224, 25) : make_colour_rgb(128, 128, 128);
		image_blend = col;
	}
}

//Jump off the flagpole
yspeed = -3;
y--;

//Move right 8 pixels
x += 8;

//Face right
image_xscale = 1;