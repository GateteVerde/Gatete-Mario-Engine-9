/// @description Animate and set beat animation

if (sprite_index == spr_levelpanel) {
	
	//Play 'Inventory' sound
	audio_play_sound(snd_inventory, 0, false);

	//Set beaten sprite
	sprite_index = spr_levelpanel_beaten;
	
	//Animate
	image_speed = 1;
	image_index = 0;
	
	//Mark as beaten
	beaten = 1;
}