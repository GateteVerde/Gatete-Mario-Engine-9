/// @description Displays the In-Map HUD

//Stay always at the front
depth = -98;

//Level name
levelname = "";

//Level id
levelid = noone;

//Bar offset
offset_x = 0;
offset_y = 0;

//Inventory offset
inv_offset_y = 0;

//Animation
anim = 0;

//Marquee text speed
rate = 0;

//Prompt to show
prompt = 0;
alarm[0] = 180;

//Show "Game Saved!" text (Applies only if Auto-Saving is enabled)
show_saved = 0;

//Draw powerups
for (var i = 1; i <= global.inventory[0]; i++) {
			
	//Set alpha of item
	alpha[i] = 1;
	scale[i] = 1;
}