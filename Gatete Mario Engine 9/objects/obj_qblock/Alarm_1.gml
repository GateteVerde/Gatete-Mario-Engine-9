/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Make an item come out, if there is one
if (sprout != cs_coin) 
&& (sprout != cs_balloon) {
	
	//If this block contains a mega shroom
	if (sprout == cs_mega) {
		
		instance_create_depth(x + 8, ystart, 10, obj_megashroom_sprout);
	}

    //If this block contains a star and the player is invulnerable
    else if (sprout == cs_coin_s) {
    
		//If Mario is invulnerable
        if (instance_exists(obj_invincibility))
            sprout = cs_starman;
        else
            sprout = cs_coin;
    }
	
	//Otherwise, if there's a powerup inside
	else if ((sprout > cs_big) && (sprout < cs_mega))
	&& ((global.powerup == cs_tiny) || (global.powerup == cs_small))
		sprout = cs_big;
        
    //Create the item
    if (sprout != cs_coin)
	&& (sprout != cs_mega) {
		
        with (instance_create_depth(x+8, y, 10, obj_powerup_sprout)) {
			
            sprite_index = macro_get_sprite(other.sprout);
			if (other.bottom == true)
			&& (other.sprout != cs_beanstalk)
				yspeed = 0.5;
		}
	}
}

//Turn into a used block
instance_change(obj_emptyblock, false);