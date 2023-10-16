/// @description Display inventory and get given item

//If the item inside is a 1UP
if (sprite_index == spr_1up)
    instance_create_layer(obj_mario.x, obj_mario.y, "Main", obj_1up);
    
//Otherwise, if the item inside is a 3UP
else if (sprite_index == spr_3up)
    instance_create_layer(obj_mario.x, obj_mario.y, "Main", obj_3up);
    
//Otherwise, add a item to the inventory
else {

	//If the inventory is not full, increment size
    if (global.inventory[0] < 15) {
		
        global.inventory[0]++;
	}
	
	#region INVENTORY ADD

		//If this item is a gold flower
		if (sprite_index == spr_tinyshroom)
			global.inventory[global.inventory[0]] = cs_tiny;
	
		//If this item is a gold flower
		else if (sprite_index == spr_goldenflower)
		|| (sprite_index == spr_goldenflower_cb)
			global.inventory[global.inventory[0]] = cs_gold;
			
		//Otherwise, if this item is a star
		else if (sprite_index == spr_starman)
			global.inventory[global.inventory[0]] = cs_starman;
			
		//Otherwise, if this item is a p-wing
		else if (sprite_index == spr_pwing)
			global.inventory[global.inventory[0]] = cs_pwing;
			
		//Otherwise, add a normal powerup
		else {
			
			global.inventory[global.inventory[0]] = sprite_get_macro(sprite_index);
		}
	
	#endregion
	
	//Show up inventory
	instance_create_depth(-16, 0, -98, obj_inventoryprev);
}

//Create smoke effect
instance_create_depth(x, y+8, -4, obj_smoke);

//Make it invisible
image_alpha = 0;