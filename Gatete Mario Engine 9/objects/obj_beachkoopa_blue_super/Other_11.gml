/// @description Default stomp script

//If this enemy does drop a feather
if (feather == 1) {

	//Create feather
	instance_create_depth(x, y, 10, obj_feather_sprout);

	//Create a cape-less blue beach koopa
	with (instance_create_depth(x, y, -2, obj_beachkoopa_blue)) {
	
		//Set the horizontal speed
        xspeed = 0.8*sign(other.xscale);
		
		//Set walking sprite
		sprite_index = spr_beachkoopa_blue_walk;
		
		//Make it able to kick shells
		ready = 2;
        
        //Ignore alarm
        alarm[10] = -1;
	}
	
	//Destroy
	instance_destroy();

	//Exit this event
	exit;
}

//Create dead object
imdead = instance_create_depth(x, y, -6, obj_enemy_stomped);

//Hereby sprite
imdead.sprite_index = spr_beachkoopa_blue_super_dead;

//Hereby frame
imdead.image_index = image_index;

//Hereby facing direction
imdead.image_xscale = xscale;

//Hereby horizontal speed
imdead.hspeed = xspeed;

//Destroy
instance_destroy();