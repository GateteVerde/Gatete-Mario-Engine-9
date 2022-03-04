/// @description Wake up

//If there's gravity
if (yadd > 0) {

    alarm[1] = 1;
    exit;
}

//Otherwise
else {
	
	//If there's a koopa inside
	if (koopainside == 1) {

		/*
		
		//Check the sprite
		switch (sprite_index) {
	
			//Default (Green Shell)
			default: instance_create_depth(x, y, -2, obj_beachkoopa); break;
		}
		
		*/
		
		//Get out of the shell
		koopainside = 0;
	}
}