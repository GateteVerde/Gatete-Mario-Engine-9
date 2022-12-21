// @function macro_get_sprite
// @param macro
function macro_get_sprite() {

	switch (argument[0]) {
	
		case (cs_tiny): return spr_tinyshroom;
	    case (cs_big): return (obj_coordinator.colourblind == 1) ? spr_mushroom_cb : spr_mushroom;
	    case (cs_fire): return (obj_coordinator.colourblind == 1) ? spr_fireflower_cb : spr_fireflower;
	    case (cs_ice): return (obj_coordinator.colourblind == 1) ? spr_iceflower_cb : spr_iceflower;
	    case (cs_carrot): return spr_carrot;
	    case (cs_raccoon): return spr_leaf;
		case (cs_cape): return spr_feather;
	    case (cs_frog): return spr_frogsuit;
	    case (cs_tanooki): return spr_tanookisuit;
	    case (cs_hammer): return spr_hammerflower;
	    case (cs_boomerang): return spr_boomerangflower;
	    case (cs_superball): return (obj_coordinator.colourblind == 1) ? spr_superflower_cb : spr_superflower;
	    case (cs_bomb): return spr_bombshroom;
	    case (cs_shell): return spr_blueshell;
	    case (cs_bee): return spr_beeshroom;
	    case (cs_volt): return spr_voltshroom;
	    case (cs_penguin): return spr_penguinsuit;
	    case (cs_propeller): return spr_propellershroom;
	    case (cs_bell): return spr_superbell;
	    case (cs_football): return spr_helmet;
		case (cs_ranger): return spr_rangerhat;
		case (cs_squirrel): return spr_superacorn;
		case (cs_fraccoon): return spr_fieryleaf;
		case (cs_iraccoon): return spr_chillleaf;
		case (cs_beet): return spr_beet;
		case (cs_lui): return spr_lui;
		case (cs_gold): return (obj_coordinator.colourblind == 1) ? spr_goldenflower_cb : spr_goldenflower;
		case (cs_mega): return spr_megashroom;
	    case (cs_yoshi_g): return spr_egg;
	    case (cs_yoshi_r): return spr_egg_r;
	    case (cs_yoshi_y): return spr_egg_y;
	    case (cs_yoshi_b): return spr_egg_b;
	    case (cs_yoshi_t): return spr_egg_t;
	    case (cs_yoshi_p): return spr_egg_p;
	    case (cs_shoe_kuribo): return spr_shoe_kuribo;
	    case (cs_shoe_baburu): return spr_shoe_baburu;
	    case (cs_shoe_dossun): return spr_shoe_dossun;
	    case (cs_shoe_jugemu): return spr_shoe_jugemu;
	    case (cs_shoe_pentaro): return spr_shoe_pentaro;
		case (cs_pballoon): return spr_balloon;
		case (cs_pwing): return spr_pwing;
	    case (cs_1up): return (obj_coordinator.colourblind == 1) ? spr_1up_cb : spr_1up;
	    case (cs_3up): return spr_3up;
		case (cs_heart): return spr_heart;
		case (cs_poison): return (obj_coordinator.colourblind == 1) ? spr_poison_cb : spr_poison;
		case (cs_rotten): return spr_rotten;
		case (cs_starman): return spr_starman;
		case (cs_pswitch): return spr_pswitch;
		case (cs_gswitch): return spr_gswitch;
		case (cs_key): return spr_key;
		case (cs_trampoline): return spr_trampoline;
		case (cs_propellerblock): return spr_propellerblock;
		case (cs_powblock): return spr_powblock;
		case (cs_billy): return spr_billygun;
		case (cs_beanstalk): return spr_beanstalk;
		case (cs_beanstalk_side): return spr_beanstalk_side;
		default: return -1;
	}
}