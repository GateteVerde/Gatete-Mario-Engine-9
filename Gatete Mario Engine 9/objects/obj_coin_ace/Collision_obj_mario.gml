/// @description Collect the coin

//Play 'Big Coin' sound
audio_play_sound(snd_coin_big, 0, false);

//Remember that the coin has been collected
ds_map_add(global.acecoins, id, 1);

#region SCORE

	with (instance_create_depth(x, y, -6, obj_score)) {
	
		if (ds_map_size(global.acecoins) >= 5)
			value = -1;
		else
			value = power(2, ds_map_size(global.acecoins)-1)*1000;
	}
#endregion

//Make visible
visible = 1;
alarm[0] = -1;
alarm[1] = -1;

//Create collected coin
with (instance_create_depth(x, y-4, -4, obj_block_coin)) sprite_index = spr_coin_ace;

//Destroy
instance_destroy();