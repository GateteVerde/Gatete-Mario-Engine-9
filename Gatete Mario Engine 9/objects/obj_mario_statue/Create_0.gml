/// @description Mario transformed into a statue

//Owner of the spinner for adhering to position
owner = noone;

//If the player does exist
if (instance_exists(obj_mario)) {
	
	//Depth
	depth = obj_mario.depth;

	//With Mario
	with (obj_mario) {
	
		//Stop Mario
		xspeed = 0;
		yspeed = 0;
		
		//Make Mario invisible
		visible = false;
		
		//Make Mario invulnerable
		invulnerable = true;
		
		//Disable controls
		enable_control = false;
	}
}

//Start blinking when time starts running out.
alarm[0] = 90;

//Time runs out.
alarm[1] = 180;

//Set Luigi sprite
if (global.player == 1)
	sprite_index = spr_luigi_tanooki_attack2;