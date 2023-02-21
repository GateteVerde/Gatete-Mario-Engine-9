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
		
		//Check the sprite
		switch (sprite_index) {
			
			//Red Koopa
			case (spr_shell_red): {
				
				instance_create_depth(x, y, -2, obj_beachkoopa_red);
			} break;
			
			//Blue Koopa
			case (spr_shell_blue): {
			
				instance_create_depth(x, y, -2, obj_beachkoopa_blue);
			} break;
			
			//Yellow Koopa
			case (spr_shell_yellow): {
			
				instance_create_depth(x, y, -2, obj_beachkoopa_yellow);
			} break;
	
			//Default (Green Shell)
			default: instance_create_depth(x, y, -2, obj_beachkoopa); break;
		}
		
		//Get out of the shell
		koopainside = 0;
	}
	
	//Otherwise
	else if (koopainside == -1) {
	
		//Check sprite
		switch (sprite_index) {
			
			//Red Koopa
			case (spr_shell_red_classic): {
			
				instance_create_depth(x, y, -2, obj_koopa_red_classic);
			} break;
			
			//Big Green Koopa
			case (spr_shell_big): {
			
				instance_create_depth(x, y, -2, obj_koopa_big);
			} break;
			
			//Big Red Koopa
			case (spr_shell_red_big): {
			
				instance_create_depth(x, y, -2, obj_koopa_big_red);
			} break;
			
			//Buzzy Beetle
			case (spr_shell_buzzy): {
			
				instance_create_depth(x, y, -2, obj_buzzybeetle);
			} break;
			
			//Spiny
			case (spr_shell_spiny): {
			
				instance_create_depth(x, y, -2, obj_spiny);
			} break;
			
			//Koopatrol
			case (spr_shell_koopatrol): {
				
				instance_create_depth(x, y, -2, obj_koopatrol);
			} break;
		
			//Default
			default: instance_create_depth(x, y, -2, obj_koopa_classic); break;
		}
		
		//Destroy
		instance_destroy();
	}
}