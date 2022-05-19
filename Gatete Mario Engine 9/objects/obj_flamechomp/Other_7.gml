/// @description Resume movement

if (sprite_index == spr_flamechomp) {
	
	//Play 'Burn' sound
    audio_play_sound(snd_burn, 0, 0);

    //Do not animate
    image_speed = 0;
    image_index = 4;
    
    //Resume movement
    alarm[1] = 16;
    
    //Spit a fireball
	with (instance_create_depth(x + 4 * sign(xscale), y+8, 50, obj_plantfire)) {
	
		//Set sprite
		sprite_index = spr_flamechomp_fire;
		
		//Set motion
		motion_set(point_direction(x, y, obj_mario.x, obj_mario.y), 1.5);
	}
}
