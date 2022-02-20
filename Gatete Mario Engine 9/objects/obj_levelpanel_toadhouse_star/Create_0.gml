/// @description Star Toad House Panel

//Ignore if this is not unlocked
if (global.star_house[myworld] == 0) {

	instance_destroy();
	exit;
}

//Create a node
with (instance_create_layer(x, y, "Main", obj_node)) visible = false;

//Do not animate
image_speed = 0;

//Checkpoint
checkpoint = noone;
alarm[0] = 1;

//Ready
ready = 0;

//Was the level beaten
beaten = 0;

//Panel type
paneltype = 2;

//Alpha
image_alpha = 0;

//Make it appear if certain conditions meet
if (global.star_house[myworld] == 1) {
	
	//Play 'Open Path' sound
	audio_play_sound(snd_pathreveal_end, 0, false);
	
	//Create a smoke effect
	with (instance_create_depth(x + 8, y + 8, -4, obj_smoke)) {

		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	//Keep it open
	global.star_house[myworld] = 2;
}
else if (global.star_house[myworld] == 2)
	image_alpha = 1;