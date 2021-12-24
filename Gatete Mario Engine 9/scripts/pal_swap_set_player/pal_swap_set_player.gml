/// @function					pal_swap_set_player();
/// @param	normal_palette		Normal palette
/// @param invincible_palette	Invincible palette
/// @param mega_palette			Mega palette

// Palette enumerators
enum palette {
	
	normal = 0,
	fire = 1,
	ice = 2,
	carrot = 3,
	superball = 4,
	volt = 5,
	gold = 6	
}

function pal_swap_set_player() {
	
	//Local function variables
	var pal, spr;
	
	//If the player isn't invincible, set up your palette
	if (isflashing <= 0) {
		
		//Set normal palette sprite
		spr = argument[0];
	
		switch (global.powerup) {
		
			default: pal = palette.normal; break;					// Normal color
			case (cs_fire): pal = palette.fire; break;				// Fire palette
			case (cs_ice): pal = palette.ice;	break;				// Ice palette
			case (cs_carrot): pal = palette.carrot; break;			// Carrot palette
			case (cs_superball): pal = palette.superball; break;	// Superball palette
			case (cs_volt): pal = palette.volt; break;				// Volt palette
			case (cs_fraccoon): pal = palette.fire; break;			// Fire Raccoon palette
			case (cs_iraccoon): pal = palette.ice; break;			// Ice Raccoon palette
			case (cs_gold): pal = palette.gold; break;				// Gold palette		
		}
		
	} 
	else {
		
		//Set invincibility palette sprite(?)
		if (instance_number(obj_megashroom_timer) == 0) {
			
			pal = floor(isflashing);
			spr = argument[1];
		}
		else {
			
			pal = isflashing;
			spr = argument[2];
		}
	}
	
	//If no palette swap occurred, exit the script
	if (pal == 0)	
		exit;
	
	//Otherwise, set the palette swap
	pal_swap_set(spr, pal);

}