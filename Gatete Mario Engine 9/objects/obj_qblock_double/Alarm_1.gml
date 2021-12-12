/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Iterate through variables
for (var i=0; i<2; i++) {

	//Make an item come out, if there is one
	if (sprout[i] != cs_coin) 
	&& (sprout[i] != cs_balloon) {
	
		//If this block contains a mega shroom
		if (sprout[i] == cs_mega) {
		
			instance_create_depth(x + 8 + (i * 16), ystart, 10, obj_megashroom_sprout);
		}

	    //If this block contains a star and the player is invulnerable
	    else if (sprout[i] == cs_coin_s) {
    
			//If Mario is invulnerable
	        if (instance_exists(obj_invincibility))
	            sprout[i] = cs_starman;
	        else
	            sprout[i] = cs_coin;
	    }
	
		//Otherwise, if there's a powerup inside
		else if ((sprout[i] > cs_big) && (sprout[i] < cs_mega))
		&& ((global.powerup == cs_tiny) || (global.powerup == cs_small))
			sprout[i] = cs_big;
        
	    //Create the item
	    if (sprout[i] != cs_coin)
		&& (sprout[i] != cs_mega)
	        with (instance_create_depth(x + 8 + (i * 16), y, 10, obj_powerup_sprout))       
	            sprite_index = macro_get_sprite(other.sprout[i]);
	}
}

//Turn into a used block
with (instance_create_depth(x, ystart, depth, obj_emptyblock)) {
	
	sprite_index = spr_qblock_double_empty;
}

//Destroy
instance_destroy();