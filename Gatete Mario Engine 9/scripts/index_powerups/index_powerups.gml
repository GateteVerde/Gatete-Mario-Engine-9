/// @function index_powerups();

function index_powerups() {

	//How many power-ups to create (the "i" created will match the enum through powerup_get_name)
	var powerup_count = 25;

	//Loop through and get every asset
	for (var i = 0; i < powerup_count; i++) {

		global.attack_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_attack");
		global.balloon_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_balloon");	
		global.carry_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_carry");
		global.carry_jump_sprite[i] =	asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_carry_jump");
		global.clear_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_clear");
		global.climb_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_climb");
		global.climb2_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_climb2");
		global.duck_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_duck");
		global.float_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_float");	
		global.goal_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_goal");
		global.hold_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_hold");
		global.hold_jump_sprite[i] =	asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_jump");
		global.hold2_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_hold2");
		global.hold2_jump_sprite[i] =	asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_hold2_jump");
		global.jump_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_jump");
		global.kick_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_kick");
		global.ride_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_ride");
		global.run_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_run");
		global.runjump_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_runjump");
		global.skid_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_skid");
		global.slide_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_slide");
		global.somersault_sprite[i] =	asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_somersault");
		global.spin_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_spin");
		global.spin2_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_spin2");
		global.spin3_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_spin3");
		global.swim_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_swim");
		global.swim2_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_swim2");
		global.swim3_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_swim3");
		global.swim4_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_swim4");
		global.walk_sprite[i] =			asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_walk");
		global.walljump_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_walljump");
		global.float_sprite[i] =		asset_get_index("spr_mario_" + string(powerup_get_name(i)) + "_float");	
	}	
}