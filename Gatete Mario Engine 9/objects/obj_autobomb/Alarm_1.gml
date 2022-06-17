/// @description Shoot fire if the rider exists

//If the rider does exist
if (instance_exists(rider)) {

    //Play 'Burn' sound
    audio_play_sound(snd_burn, 0, false);
    
    //Spit a fireball towards the player
    with (instance_create_depth(x, y-8, -2, obj_plantfire)) {
    
		sprite_index = spr_autobomb_fire;
        xscale = 1*sign(other.xscale);
        hspeed = 2*sign(other.xscale);
    }
}

//Spit a fireball
alarm[1] = 120;