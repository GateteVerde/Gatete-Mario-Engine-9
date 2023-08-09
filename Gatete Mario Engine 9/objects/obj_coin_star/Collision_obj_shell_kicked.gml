/// @description Collect the coin

//Play either 'Big Coin' or 'All Coin' sound
event_user(0);

#region REGISTER COIN

	//If this coin was collected on a previous level run, destroy
	if (ds_map_find_value(global.sc[type], global.level) == 3)
		instance_destroy();
		
	//Otherwise
	else {

		//Register it
		if (ds_map_find_value(global.sc[type], global.level) == 0) {
			
            ds_map_replace(global.sc[type], global.level, 1);
		}

		//Create collected coin
		with (instance_create_depth(x, y-4, -4, obj_block_coin)) 
			sprite_index = spr_coin_star;
	}
#endregion

//Make visible
visible = 1;
alarm[0] = -1;
alarm[1] = -1;

//Get 4000 points
with (instance_create_depth(x, y, -4, obj_score)) value = 4000;

//Destroy
instance_destroy();