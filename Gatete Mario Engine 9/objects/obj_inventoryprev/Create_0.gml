/// @description Displays the inventory after obtaining a item

//Play 'Inventory' sound
audio_play_sound(snd_inventory, 0, false);

//Stay always at the front
depth = -98;

//Inventory offset
inv_offset_y = 0;

//Boxselection
boxselection = global.inventory[0];

//Draw powerups
for (var i = 1; i <= global.inventory[0]; i++) {
			
	//Set alpha of item
	alpha[i] = 1;
	scale[i] = 1;
}