/// @description Check Star Coins

//If the level is not the same as the previous level
if (global.level != levelid) {

	//Check for collected star coins in the previous world
	for (var i = 0; i < 3; i++) {
    
	    //If the star coin has not been saved
	    if (ds_map_find_value(global.sc[i], global.level) < 3)
	        ds_map_replace(global.sc[i], global.level, 0);
	}
	
	//Set the new level id
	global.level = levelid;
}