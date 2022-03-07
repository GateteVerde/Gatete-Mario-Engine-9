/// @description Eat enemies

if (hunger == 0) && (ready == 0) {

	//Enemy eaten
	hunger = 1;
        
	//Move tongue back
	ready = 1;
	alarm[0] = 8;
	
	#region Check NPCs
	
		//Put kickable enemies inside yoshi's mouth
		if (other.object_index == obj_galoomba_down) {
	
			obj_yoshi.mouthholder = obj_galoomba_down;
			obj_yoshi.mouthsprite = other.sprite_index;
		}
		
		//Otherwise, if this item is a koopa shell
		else if (other.object_index == obj_shell) {
		
			//If Yoshi is a red one or the koopa shell is a red one, put fire on Yoshi's mouth
			if (global.mountcolour == 1)
			|| (other.sprite_index == spr_shell_red)
			|| (other.sprite_index == spr_shell_red_classic)
				obj_yoshi.mouthholder = obj_yoshi_fire;
				
			//Otherwise
			else {
			
				obj_yoshi.mouthholder = obj_shell_kicked;
				obj_yoshi.mouthsprite = other.sprite_index;
			}
		}
		
	#endregion
        
	//Food sprite
	foodsprite = other.sprite_index;
        
	//Food image
	foodindex = other.image_index;
        
	//Food offset
	with (other) other.foodoffset = (bbox_left+bbox_right)/2-x;
        
	//Destroy food
	with (other) instance_destroy();
}