/// @description Throw the spell

//If not inside view
if (outside_view() == false) {
    
    //Play 'Transform' sound
    audio_play_sound(snd_transform, 0, false);
    
    //Create spell
    with (instance_create_depth(x+16*sign(xscale), y, -2, obj_magikoopa_magic))
		motion_set(point_direction(x, y, obj_mario.x, obj_mario.y), 2);
}

//Animate
image_speed = 1;
image_index = 2;

//Dissappear
alarm[1] = 60;
