/// @function sprite_get_macro(sprite, x, y, depth);
/// @param sprite
/// @param x
/// @param y
/// @param depth

function sprite_create_object() {

	switch (argument[0]) {
	
		//Tiny Mushroom
		case (spr_tinyshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_tinyshroom);
		
		//Mushroom
		case (spr_mushroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_mushroom);
		
		//Fire Flower
		case (spr_fireflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_fireflower);
		
		//Ice Flower
		case (spr_iceflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_iceflower);
		
		//Carrot
		case (spr_carrot): return instance_create_depth(argument[1], argument[2], argument[3], obj_carrot);
		
		//Frog Suit
		case (spr_frogsuit): return instance_create_depth(argument[1], argument[2], argument[3], obj_frogsuit);
		
		//Tanooki Suit
		case (spr_tanookisuit): return instance_create_depth(argument[1], argument[2], argument[3], obj_tanookisuit);
		
		//Hammer Flower
		case (spr_hammerflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_hammerflower);
		
		//Boomerang Flower
		case (spr_boomerangflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_boomerangflower);
		
		//Super Flower
		case (spr_superflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_superflower);
		
		//Bomb Mushroom
		case (spr_bombshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_bombshroom);
		
		//Blue Shell
		case (spr_blueshell): return instance_create_depth(argument[1], argument[2], argument[3], obj_blueshell);
		
		//Bee Mushroom
		case (spr_beeshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_beeshroom);
		
		//Volt Mushroom
		case (spr_voltshroom): return instance_create_depth(argument[1], argument[2], argument[3], obj_voltshroom);
		
		//Penguin Suit
		case (spr_penguinsuit): return instance_create_depth(argument[1], argument[2], argument[3], obj_penguinsuit);
		
		//Super Bell
		case (spr_superbell): return instance_create_depth(argument[1], argument[2], argument[3], obj_superbell);
		
		//Helmet
		case (spr_helmet): return instance_create_depth(argument[1], argument[2], argument[3], obj_helmet);
		
		//Ranger Hat
		case (spr_rangerhat): return instance_create_depth(argument[1], argument[2], argument[3], obj_rangerhat);
		
		//Super Acorn
		case (spr_superacorn): return instance_create_depth(argument[1], argument[2], argument[3], obj_superacorn);
		
		//Golden Flower
		case (spr_goldenflower): return instance_create_depth(argument[1], argument[2], argument[3], obj_goldenflower);
		
		//Heart
		case (spr_heart): return instance_create_depth(argument[1], argument[2], argument[3], obj_heart);
		
		//1-UP
		case (spr_1up): return instance_create_depth(argument[1], argument[2], argument[3], obj_1up);
		
		//3-UP
		case (spr_3up): return instance_create_depth(argument[1], argument[2], argument[3], obj_3up);
		
		//Poison
		case (spr_poison): return instance_create_depth(argument[1], argument[2], argument[3], obj_poison);
		
		//Starman
		case (spr_starman): return instance_create_depth(argument[1], argument[2], argument[3], obj_starman);
	}
}