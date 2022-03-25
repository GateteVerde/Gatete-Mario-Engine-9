/// @description Throw a fireball

//Play 'Fireball' sound
audio_play_sound(snd_fireball, 0, false);

//If Mario does not exist or is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x) {

    with (instance_create_depth(x+15, y-22, -2, obj_heavyfirebro_fireball)) {
    
        xspeed = -1.5;
		yspeed = -3;
        image_xscale = -1;
    }
}
else {

    with (instance_create_depth(x-15, y-22, -2, obj_heavyfirebro_fireball)) {
    
        xspeed = 1.5;
		yspeed = -3;
        image_xscale = 1;
    }    
}

//Replace sprite
sprite_index = spr_heavyfirebro;

//Set the throwing pose
alarm[2] = 60;