/// @description Collision with Mario

//If Mario is invulnerable or is on the mega form, exit
if (instance_exists(obj_invincibility))
|| (global.powerup == cs_mega)
exit;

//If stunned, defeat instantly
if (ready < 2) {
	
	//If Mario is sliding
	if (other.sliding == 1)
		event_inherited();
		
	//Otherwise
	else {
		
		//Play 'Kick' sound
		audio_play_sound(snd_kick, 0, false);
		
		//Get 200 points
		with (instance_create_depth(x, y, -4, obj_score)) value = 200;

        //Create dead object
        with (instance_create_depth(x, y, -6, obj_enemy_dead)) {
        
            sprite_index = other.sprite_index;
            image_xscale = other.xscale;
            vspeed = -4;
        }  		
	}
	
	//Create spin thump
    with (instance_create_depth(round(bbox_left + bbox_right)/2, round(bbox_top + bbox_bottom)/2, -4, obj_smoke)) sprite_index = spr_spinthump;
	
	//Destroy
	instance_destroy();
}
else
	event_inherited();