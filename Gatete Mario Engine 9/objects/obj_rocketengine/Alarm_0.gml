/// @description Start engine

//If Mario does not exist or it does exist and it's not transforming
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform))) {

	alarm[0] = 1;
	exit;
}

//Create spotlight
if (instance_exists(obj_lightcontrol)) {
	
	//Create a light
	light = instance_create_layer(0, 0, "Main", obj_light_static);
	
	//With the light
	with (light) {
		
		sprite_index = spr_blend_rengine;
		image_angle = other.image_angle;
	}
}

//Set the sprite.
sprite_index = spr_rocketengine_st;

//Animate
image_speed = 1;

//Make it visible.
visible = 1;

//Play a sound.
if (outside_view() == false)
    audio_play_sound(snd_flames, 0, false);
