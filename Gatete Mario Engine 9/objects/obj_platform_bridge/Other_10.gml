/// @description Bump nearby blocks

//Check for a block to the left
var myleft = instance_position(x-1, y, obj_platform_bridge);

//If there's a block
if (myleft) {

	with (myleft) {
	
		//Set sprite
		sprite_index = spr_platform_bridge_l;
		
		//Animate
		image_speed = 1;
		image_index = 0;
	}
}

//Check for a block to the right
var myright = instance_position(x+8, y, obj_platform_bridge);

//If there's a block
if (myright) {

	with (myright) {
	
		//Set sprite
		sprite_index = spr_platform_bridge_r;
		
		//Animate
		image_speed = 1;
		image_index = 0;
	}
}

//Animate
image_speed = 1;
image_index = 0;