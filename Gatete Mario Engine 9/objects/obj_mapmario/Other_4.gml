/// @description Manage Star Coins

//If health mode is active
if (global.hp_mode == true) {
	
	//Restore all health
	if (global.hp < global.hp_max)
		global.hp = global.hp_max;
	
	//Turn Mario into Big Mario automatically
	if (global.powerup < cs_big)
		global.powerup = cs_big;
}

//Save star coins if the level has been beaten
if (global.clear > 0) {

    for (var i = 0; i < 3; i++) {
    
        if (ds_map_find_value(global.sc[i], global.level) > 0) 
        && (ds_map_find_value(global.sc[i], global.level) < 3) {
        
            //Save it forever
            ds_map_replace(global.sc[i], global.level, 3);
            
            //Increment star counter
            global.starcoins++;
        }
    }
}

//Otherwise, do not save them unless a checkpoint was reached.
else if (global.level != noone) {

    for (var i = 0; i < 3; i++) {
    
        if (ds_map_find_value(global.sc[i], global.level) > 0) 
        && (ds_map_find_value(global.sc[i], global.level) < 2) //This line will check if a checkpoint was hit.
            ds_map_replace(global.sc[i], global.level,0);
    }
}

//Delete all cards
if (global.card[0] != -1) 
&& (global.card[1] != -1) 
&& (global.card[2] != -1) {

    for (var j = 0; j < 3; j++)
        global.card[j] = -1;
}