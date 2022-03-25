/// @description Throw a hammer

//Play 'Hammer' sound
audio_play_sound(snd_hammer, 0, false);

//If Mario does not exist or is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x) {

    with (instance_create_depth(x+15, y-22, -2, obj_hammerbro_hammer)) {
    
		sprite_index = spr_sledgebro_hammer;
        hspeed = -1;
        image_xscale = -1;
    }
}
else {

    with (instance_create_depth(x-15, y-22, -2, obj_hammerbro_hammer)) {
    
		sprite_index = spr_sledgebro_hammer;
        hspeed = 1;
        image_xscale = 1;
    }    
}

//Replace sprite
sprite_index = spr_sledgebro;

//Set the throwing pose
alarm[2] = 60;