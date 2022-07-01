/// @description Bowser Level Panel

//Inherit the parent event
event_inherited();

//Check map value
if (ds_map_find_value(global.worldmap, id) == 2) {

	//Set the sprite
	image_speed = 1;
		
	//Mark as beaten
	beaten = 1;
}
else
	image_speed = 1;