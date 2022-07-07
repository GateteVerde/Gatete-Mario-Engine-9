/// @description Open the prize chest

//If the prize appeared
if (ready == 1) 
&& (sprite_index == spr_chest_small) {
    
    //Return to the world map later
    alarm[1] = 360;
    
    //Chest is empty
    ready = 2;

    //Change frame
    image_index = 1;
    
    //Create the item
	with (instance_create_depth(x + 8, y, depth-1, obj_powerup_get))
		sprite_index = macro_get_sprite(global.prize[0]);
}