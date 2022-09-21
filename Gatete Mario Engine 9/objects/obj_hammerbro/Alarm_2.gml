/// @description Throw a hammer

//Play 'Hammer' sound
audio_play_sound(snd_hammer, 0, false);

//If the player does not exist or the player is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x) {

    with (instance_create_depth(x+9, y-5, -2, obj_hammerbro_hammer)) {
    
        xspeed = -1;
        image_xscale = -1;
    }
}
else {

    with (instance_create_depth(x-9, y-5, -2, obj_hammerbro_hammer)) {
    
        xspeed = 1;
        image_xscale = 1;
    }    
}

//Set throw pose
sprite_index = spr_hammerbro;

//Throw another hammer.
alarm[1] = 7+random(round(28));