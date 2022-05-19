/// @description Flame Chomp stomp

//Create dead object.
imdead = instance_create_depth(x, y, -6, obj_enemy_stomped);

//Set the sprite
imdead.sprite_index = sprite_index;

//Set the facing direction
imdead.image_xscale = xscale;

//Set a waving movement
imdead.hspeed = 0.5;
imdead.alarm[1] = 4;

//If there's followers
if (followers > 1) {

	//Dead followers.
	multidead = instance_create_depth(x, y, -6, obj_enemy_dead_multi);
	with (multidead) {

	    //Set the sprite
	    sprite_index = spr_fireball;

	    //Set the enemy parts.
	    count = other.followers-1;

	    //Set the enemy speed
		spd = 0;
	
	    //Set the xscale
	    image_xscale = other.xscale;
	}
}

//Destroy
instance_destroy();
