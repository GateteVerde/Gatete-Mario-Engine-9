/// @description Throw a boomerang

//Play 'Hammer' sound
audio_play_sound(snd_hammer, 0, false);

//If the player does not exist or the player is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x) {

    with (instance_create_depth(x+10, y-4, -4, obj_boomerangbro_boomerang)) {
    
        hspeed = -2;
        image_xscale = -1;
		parent = other.id;
		if (other.id.blue)
			sprite_index = spr_boomerangbro_boomerang_blue;
    }
}
else {

    with (instance_create_depth(x-10, y-4, -4, obj_boomerangbro_boomerang)) {
    
        hspeed = 2;
        image_xscale = 1;
		parent = other.id;
		if (other.id.blue)
			sprite_index = spr_boomerangbro_boomerang_blue;
    }    
}

//Set throw pose
sprite_index = spr_boomerangbro;

//Throw another boomerang
if (throws == 0) {

	throws = 1;
	alarm[1] = 90;
}
else if (throws == 1) {

	throws = 0;
	alarm[1] = 180;
}