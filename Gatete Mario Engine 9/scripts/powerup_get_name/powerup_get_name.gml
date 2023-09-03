/// @function powerup_get_name(powerup);
/// @param powerup

function powerup_get_name() {

	switch (argument[0]) {

		case (cs_tiny): return "tiny";
		case (cs_small): return "small";
		case (cs_big): return "big";
		case (cs_fire): return powerup_get_name(cs_big);
		case (cs_ice): return powerup_get_name(cs_big);
		case (cs_carrot): return "carrot";
		case (cs_raccoon): return "raccoon";
		case (cs_cape): return powerup_get_name(cs_big);
		case (cs_frog): return "frog";
		case (cs_tanooki): return "tanooki";
		case (cs_hammer): return "hammer";
		case (cs_boomerang): return "boomerang";
		case (cs_superball): return powerup_get_name(cs_big);
		case (cs_bomb): return "bomb";
		case (cs_shell): return "shell";
		case (cs_bee): return "bee";
		case (cs_volt): return powerup_get_name(cs_big);
		case (cs_penguin): return "penguin";
		case (cs_propeller): return "propeller";
		case (cs_bell): return "cat";
		case (cs_football): return "football";
		case (cs_ranger): return "ranger";
		case (cs_squirrel): return "squirrel";
		case (cs_fraccoon): return powerup_get_name(cs_raccoon);
		case (cs_iraccoon): return powerup_get_name(cs_raccoon);
		case (cs_beet): return "beetroot";
		case (cs_lui): return powerup_get_name(cs_big);
		case (cs_wind): return powerup_get_name(cs_big);
		case (cs_bubble): return powerup_get_name(cs_big);
		case (cs_gold): return powerup_get_name(cs_big);
		case (cs_mega): return powerup_get_name(cs_big);
	}
}