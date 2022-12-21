// @function sprite_get_macro
// @param sprite
function sprite_get_macro() {
	
	switch (argument[0]) {
	
		case (spr_tinyshroom): return cs_tiny;
	    case (spr_mushroom): return cs_big;
	    case (spr_fireflower): 
		case (spr_fireflower_cb): return cs_fire;
	    case (spr_iceflower): 
		case (spr_iceflower_cb): return cs_ice;
	    case (spr_carrot): return cs_carrot;
	    case (spr_leaf):
		case (spr_leaf_sp): return cs_raccoon;
		case (spr_feather): return cs_cape;
	    case (spr_frogsuit): return cs_frog;
	    case (spr_tanookisuit): return cs_tanooki;
	    case (spr_hammerflower): return cs_hammer;
	    case (spr_boomerangflower): return cs_boomerang;
	    case (spr_superflower): 
		case (spr_superflower_cb): return cs_superball;
	    case (spr_bombshroom): return cs_bomb;
	    case (spr_blueshell): return cs_shell;
	    case (spr_beeshroom): return cs_bee;
	    case (spr_voltshroom): return cs_volt;
	    case (spr_penguinsuit): return cs_penguin;
	    case (spr_propellershroom): return cs_propeller;
	    case (spr_superbell): return cs_bell;
	    case (spr_helmet): return cs_football;
		case (spr_rangerhat): return cs_ranger;
		case (spr_superacorn): return cs_squirrel;
		case (spr_fieryleaf): 
		case (spr_fieryleaf_sp): return cs_fraccoon;
		case (spr_chillleaf): 
		case (spr_chillleaf_sp): return cs_iraccoon;
		case (spr_beetroot): return cs_beet;
		case (spr_jumpinglui): return cs_lui;
		case (spr_goldenflower): 
		case (spr_goldenflower_cb): return cs_gold;
		case (spr_megashroom): return cs_mega;
	    case (spr_egg): return cs_yoshi_g;
	    case (spr_egg_r): return cs_yoshi_r;
	    case (spr_egg_y): return cs_yoshi_y;
	    case (spr_egg_b): return cs_yoshi_b;
	    case (spr_egg_t): return cs_yoshi_t;
	    case (spr_egg_p): return cs_yoshi_p;
	    case (spr_shoe_kuribo): return cs_shoe_kuribo;
	    case (spr_shoe_baburu): return cs_shoe_baburu;
	    case (spr_shoe_dossun): return cs_shoe_dossun;
	    case (spr_shoe_jugemu): return cs_shoe_jugemu;
	    case (spr_shoe_pentaro): return cs_shoe_pentaro;
		case (spr_balloon): return cs_pballoon;
		case (spr_pwing): return cs_pwing;
	    case (spr_1up): 
		case (spr_1up_cb): return cs_1up;
	    case (spr_3up): return cs_3up;
		case (spr_heart): return cs_heart;
		case (spr_poison): return cs_poison;
		case (spr_rotten): return cs_rotten;
		case (spr_starman): return cs_starman;
		case (spr_pswitch): return cs_pswitch;
		case (spr_gswitch): return cs_gswitch;
		case (spr_key): return cs_key;
		case (spr_trampoline): return cs_trampoline;
		case (spr_propellerblock): return cs_propellerblock;
		case (spr_powblock): return cs_powblock;
		case (spr_billygun): return cs_billy;
		case (spr_beanstalk): return cs_beanstalk;
		case (spr_beanstalk_side): return cs_beanstalk_side;
		default: return -1;
	}
}