/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//If this block contains a mega shroom
if (sprout[numb] == cs_mega)		
	instance_create_depth(x + 8, ystart, 10, obj_megashroom_sprout);

//Otherwise
else {

	//Make an item come out, if there is one        
	with (instance_create_depth(x+8, y, 10, obj_powerup_sprout)) {
		
	    sprite_index = macro_get_sprite(other.sprout[other.numb]);
		if (other.bottom == true)
			yspeed = 0.5;
	}
}

//Do not allow bump
ready = 2;