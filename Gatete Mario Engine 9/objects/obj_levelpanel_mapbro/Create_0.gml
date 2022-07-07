/// @description Map Bro

//Do not animate
image_speed = 0;
alarm[3] = 7;

//Checkpoint
checkpoint = noone;
alarm[0] = 1;

//Ready
ready = 0;

//Scale
xscale = 1;
offset = 0;

//Was the level beaten
beaten = 0;

//Panel type
paneltype = 3;

//Alpha
image_alpha = 1;

//Check map value
if (ds_map_find_value(global.worldmap, id) > 0) {
	
	//Set alpha
	image_alpha = 1;
	
	//If this level has been beaten before
	if (ds_map_find_value(global.worldmap, id) == 2) {
		
		//Allow entrance if the game has been beaten at 100%
		if (global.gameclear < 100) {
		
			//Set beaten frame
			image_index = 2;
			
			//Beaten
			beaten = 2;
		}
	}
}