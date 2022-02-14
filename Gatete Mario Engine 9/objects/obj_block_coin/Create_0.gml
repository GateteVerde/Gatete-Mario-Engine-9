/// @description A coin that came out from a block

//Play 'Coin' sound
if (sprite_index != spr_coin_ace) 
&& (sprite_index != spr_coin_star) 
&& (sprite_index != spr_coin_star_get) {
	
	audio_play_sound(snd_coin, 0, false);
}

//Animate faster
image_speed *= 4;

//Set motion
vspeed = -3;
gravity = 0.2;

//Increment coins
coins_add();