/// @description Collision with the player

//If the player is climbing and is smacking the fence
if ((other.state == playerstate.climb) && (other.netsmack > 0)) {

    //If the koopa is behind the fence
    if (depth == 150) {

        //Play 'Kick' sound
        audio_play_sound(snd_kick, 0, false);
        
        //Get 400 points
        with (instance_create_depth(x+8, y, -6, obj_score)) value = 400;
        
        //Create spin thump
        with (instance_create_depth(x+8, y, -4, obj_smoke)) sprite_index = spr_spinthump;

        //Perform death event
		with (instance_create_depth(x, y, depth, obj_enemy_dead)) {
		
			//Set the sprite
			sprite_index = other.sprite_index;
			
			//Set vertical speed
			vspeed = -6;
			
			//Set scale
			image_xscale = 1;
			
			//Set horizontal speed
	        if ((obj_mario.bbox_left+obj_mario.bbox_right/2) < bbox_left+bbox_right/2)
	            hspeed = 0.5;
	        else
	            hspeed = -0.5;
		}
		
		//Destroy
		instance_destroy();
    }
}

//Inherit event
event_inherited();
