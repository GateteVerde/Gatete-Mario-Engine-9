/// @description Balloon Boo

//Inherit the parent event
event_inherited();

//Set up scale based on state and only if Mario exists
if (instance_exists(obj_mario))
&& (!instance_exists(obj_mario_transform)) {
	
	//If the boo is not moving, inflate
	if (movenow == 0) {
	
		//Set up frame
		image_index = (scale >= 2) ? 1 : 0;
		
		//Set up fx
		effect = (scale >= 2) ? 0 : 2;
	
		//Set up scale
		scale += 0.01;
		if (scale > 2)
			scale = 2;
	}

	//Otherwise
	else {
		
		//Set up frame
		image_index = 1;
		
		//Set up fx
		effect = (scale > 0.5) ? 1 : 0;
		
		//Set up scale
		scale -= 0.01;
		if (scale < 0.5)
			scale = 0.5;
	}
}

//Set yscale based on image_xscale
image_xscale = scale * xscale;
image_yscale = scale;