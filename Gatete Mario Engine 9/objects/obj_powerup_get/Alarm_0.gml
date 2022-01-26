/// @description Display inventory and get given item

//If the item inside is a 1UP
if (sprite_index == spr_1up)
    instance_create_layer(obj_mario.x, obj_mario.y, "Main", obj_1up);
    
//Otherwise, if the item inside is a 3UP
else if (sprite_index == spr_3up)
    instance_create_layer(obj_mario.x, obj_mario.y, "Main", obj_3up);
    
//Otherwise, add a item to the inventory
else {
	
	//If the sprite is a tiny mushroom, increment tiny mushroom count
	if (sprite_index == spr_tinyshroom)
		global.inventory[0]++;
		
	//Otherwise, if the sprite is a mushroom, increment mushroom count
	else if (sprite_index == spr_mushroom)
		global.inventory[1]++;
		
	//Otherwise, if the sprite is a gold flower, increment gold flower count
	else if (sprite_index == spr_goldenflower)
		global.inventory[24]++;
		
	//Otherwise, if the sprite is a star, increment star count
	else if (sprite_index == spr_starman)
		global.inventory[25]++;
		
	//Otherwise, if the sprite is a pwing, increment pwing count
	else if (sprite_index == spr_pwing)
		global.inventory[26]++;
		
	//Otherwise, if the sprite is greater than a tiny mushroom or a mushroom
	else
		global.inventory[sprite_get_macro(sprite_index) - 1]++;
}

//Create smoke effect
instance_create_depth(x, y+8, -4, obj_smoke);

//Make it invisible
image_alpha = 0;