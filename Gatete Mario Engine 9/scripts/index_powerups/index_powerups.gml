/// @function index_powerups();

function index_powerups() {

	//How many power-ups to create (the "i" created will match the enum through powerup_get_name)
	var powerup_count = 30;
	
	//Temporary variable
	var resource = noone;
		
	//Switch between player
	switch (global.player) {
			
		//Mario
		case (0): resource = "spr_mario_"; break;
			
		//Luigi
		case (1): resource = "spr_luigi_"; break;
	}
	
	#region MAP SPRITES
	
		//No Yoshi
		global.map_sprite =				asset_get_index(string(resource) + "map");
		global.map_up_sprite =			asset_get_index(string(resource) + "map_up");
		global.map_side_sprite =		asset_get_index(string(resource) + "map_side");
		global.map_climb_sprite =		asset_get_index(string(resource) + "map_climb");
		global.map_select_sprite =		asset_get_index(string(resource) + "map_select");
		global.map_wait_sprite =		asset_get_index(string(resource) + "map_wait");
		
		//Yoshi
		global.map_yoshi_sprite =		asset_get_index(string(resource) + "map_yoshi");
		global.map_yoshi_up_sprite =	asset_get_index(string(resource) + "map_yoshi_up");
		global.map_yoshi_side_sprite =	asset_get_index(string(resource) + "map_yoshi_side");
		
	#endregion
	
	#region EVENT SPRITES
	
		//Death sprites
		global.death_sprite =			asset_get_index(string(resource) + "dead");
		global.death_big_sprite =		asset_get_index(string(resource) + "dead_big");
		global.death_tiny_sprite =		asset_get_index(string(resource) + "dead_tiny");
		
		//Transformation sprites
		global.tf_grow_sprite_a	=		asset_get_index(string(resource) + "grow");
		global.tf_grow_sprite_b =		asset_get_index(string(resource) + "grow_to_mega");
		global.tf_grow_sprite_c	=		asset_get_index(string(resource) + "grow_tiny_to_big");
		global.tf_grow_sprite_skyp =	asset_get_index(string(resource) + "skypop_grow");
		global.tf_grow_sprite_subp =	asset_get_index(string(resource) + "subpop_grow");
		global.tf_shrink_sprite_a =		asset_get_index(string(resource) + "shrink");
		global.tf_shrink_sprite_b =		asset_get_index(string(resource) + "shrink_big_to_tiny");
		global.tf_shrink_sprite_c =		asset_get_index(string(resource) + "shrink_small_to_tiny");
		global.tf_shrink_sprite_skyp =	asset_get_index(string(resource) + "skypop_shrink");
		global.tf_shrink_sprite_subp =	asset_get_index(string(resource) + "subpop_shrink");
		global.tf_powerup =				asset_get_index(string(resource) + "powerup");
		global.tf_powerdown =			asset_get_index(string(resource) + "powerdown");
			
	#endregion
	
	#region SHMUP SPRITES
		
		global.skypop_sprite =	asset_get_index(string(resource) + string("skypop"));
		global.subpop_sprite =	asset_get_index(string(resource) + string("subpop"));
		global.skypop_small_sprite =	asset_get_index(string(resource) + string("skypop_small"));
		global.subpop_small_sprite =	asset_get_index(string(resource) + string("subpop_small"));
	#endregion
	
	#region CAPE FLIGHT SPRITES
	
		global.cape_flight_sprite =		asset_get_index(string(resource) + string("cape_fly"));
	#endregion

	//Loop through and get every asset
	for (var i = 0; i < powerup_count; i++) {

		global.attack_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_attack");
		global.attack2_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_attack2");
		global.balloon_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_balloon");	
		global.carry_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_carry");
		global.carry_jump_sprite[i] =	asset_get_index(string(resource) + string(powerup_get_name(i)) + "_carry_jump");
		global.clear_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_clear");
		global.climb_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_climb");
		global.climb2_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_climb2");
		global.duck_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_duck");
		global.float_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_float");	
		global.goal_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_goal");
		global.hold_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_hold");
		global.hold_jump_sprite[i] =	asset_get_index(string(resource) + string(powerup_get_name(i)) + "_hold_jump");
		global.hold2_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_hold2");
		global.hold2_jump_sprite[i] =	asset_get_index(string(resource) + string(powerup_get_name(i)) + "_hold2_jump");
		global.jump_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_jump");
		global.kick_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_kick");
		global.pull_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_pull");	
		global.ride_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_ride");
		global.run_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_run");
		global.runjump_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_runjump");
		global.skid_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_skid");
		global.slide_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_slide");
		global.slide2_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_slide2");
		global.somersault_sprite[i] =	asset_get_index(string(resource) + string(powerup_get_name(i)) + "_somersault");
		global.spin_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_spin");
		global.spin2_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_spin2");
		global.spin3_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_spin3");
		global.swim_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_swim");
		global.swim2_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_swim2");
		global.swim3_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_swim3");
		global.swim4_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_swim4");
		global.walk_sprite[i] =			asset_get_index(string(resource) + string(powerup_get_name(i)) + "_walk");
		global.walljump_sprite[i] =		asset_get_index(string(resource) + string(powerup_get_name(i)) + "_walljump");
	}	
}