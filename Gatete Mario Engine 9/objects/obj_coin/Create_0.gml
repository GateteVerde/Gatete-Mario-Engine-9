/// @description Coin

//If there's a coin in the room, retrieve frame from them
if (instance_exists(obj_coin))
	image_index = obj_coin.image_index;
else
	image_index = 0;