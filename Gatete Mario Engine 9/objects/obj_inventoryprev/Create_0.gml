/// @description Displays the inventory after obtaining a item

//Play 'Inventory' sound
audio_play_sound(snd_inventory, 0, false);

//Stay always at the front
depth = -98;

//Inventory offset
inv_offset_y = 0;

//Get the Game's width
game_width = (global.gw - 30);

//Boxselection
boxselection = global.inventory[0];

//Overflow Items
margin = 1;
length = 0;
list_pos = 1;

//Draw powerups
for (var i = 1; i <= global.inventory[0]; i++) {
			
	//Set alpha of item
	alpha[i] = 1;
	scale[i] = 1;
}