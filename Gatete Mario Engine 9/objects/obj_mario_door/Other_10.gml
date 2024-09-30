/// @description Create a new mario object

#region CLOSE DOOR

	with (my_door) {
	
		image_speed = 0;
		image_index = 0;
	}

#endregion

//Create new player
player = instance_create_depth(x, y-1, -5, obj_mario);
with (player) {
	
	//Inherit important values
	xscale = other.image_xscale;
	holding = other.holding;
}

//Destroy
instance_destroy();