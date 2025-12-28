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
	if (sprout == cs_mega) 		
		instance_create_depth(x + 16, ystart, 10, obj_megashroom_sprout);

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
	&& (sprout != cs_starman)
	&& (sprout != cs_tiny)
	&& (global.hp_mode == 0)
	&& ((global.powerup == cs_tiny) || (global.powerup == cs_small))
		sprout = cs_big;
        
    //Create the item
    if (sprout != cs_coin)
	&& (sprout != cs_mega) {
		
        with (instance_create_depth(x + 16, round(bbox_top + bbox_bottom) / 2 - 8, 10, obj_powerup_sprout)) {
			
			big = 1;
            sprite_index = macro_get_sprite(other.sprout);
		}
	}
}

//Turn into a used block
with (instance_create_depth(x, ystart, depth, obj_emptyblock)) {
	
	sprite_index = spr_qblock_big_empty;
	if (other.sprout == cs_1up)
		alarm[0] = 60;
}

//Destroy
instance_destroy();