/// @description Collect coin

//If not animating faster
if (image_speed != 0.8) {
	
	#region SPRITE CHECK
	
		//Check the coin used
		switch (sprite_index) {
			
			//50-Coin
			case (spr_coin_50): coins_add(50); break;
			
			//30-Coin
			case (spr_coin_30): coins_add(30); break;
	
			//Get 10 coins
			default: coins_add(10); break;
		}
	
	#endregion
	
	//Remember last y position
	yy = y;
	
	//Make visible and ignore alarms
	visible = 1;
	alarm[0] = -1;
	alarm[1] = -1;
	
	//Perform coin collection and get points
	event_user(0);
	with (instance_create_depth(x, y, -6, obj_score))
		value = 100;
}