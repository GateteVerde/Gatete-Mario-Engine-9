/// @description Special player collision event

//If the player is invulnerable, exit
if (instance_exists(obj_invincibility))
exit;

//If flopping, defeat instantly
if (swimming == 0) {
    
    //If the player is sliding down a slope
    if (other.sliding == 1)
		event_inherited();
        
    //Otherwise
    else {
    
        //Play 'Kick' sound
        audio_play_sound(snd_kick, 0, false);
    
        //Create dead object
        with (instance_create_depth(x, y, -6, obj_enemy_dead)) {
        
            sprite_index = other.sprite_index;
            image_xscale = other.xscale;
            vspeed = -3;
        }        
    }
    
    //Get 200 points
    with (instance_create_depth(x, y, -4, obj_score)) value = 200;
    
    //Create spin thump
    with (instance_create_depth(x, y + 8, -6, obj_smoke)) sprite_index = spr_spinthump;
    
    //Make the player visually kick the enemy
    with (other) {
	
		kicking = 2;
		timer(kicking_end, 10, false);
	}
    
    //Destroy
    instance_destroy();
}

//Otherwise
else
    event_inherited();
