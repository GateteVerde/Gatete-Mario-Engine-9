/// @description Shoot a bullet

//If the blastakoopa is facing left
if (xscale < 0) {
    
    //Play 'Blastakoopa / Fire' sound
    audio_play_sound(snd_blastakoopa_fire, 0, false);
    
    //Create missile bill
    mybullet = instance_create_depth(x-8, y+8, -2, obj_blastakoopa_bullet);                    
    with (mybullet) {
    
		direction = 180;
        speed = 1.5;
        with (instance_create_depth(x, y, -2, obj_smoke))
            sprite_index = spr_smoke_b;
    }
}

//Otherwise, if the blastakoopa is facing to the right
else if (xscale > 0) {
    
    //Play 'Blastakoopa / Fire' sound
    audio_play_sound(snd_blastakoopa_fire, 0, false);
    
    //Create missile bill
    mybullet = instance_create_depth(x+8, y+8, -2, obj_blastakoopa_bullet);
    with (mybullet) {

        direction = 0;
		speed = 1.5;
        with (instance_create_depth(x, y, -2, obj_smoke))
            sprite_index = spr_smoke_b;
    }    
}

//Close mouth
alarm[3] = 30;

//Set frame
image_speed = 0;
image_index = 3;
