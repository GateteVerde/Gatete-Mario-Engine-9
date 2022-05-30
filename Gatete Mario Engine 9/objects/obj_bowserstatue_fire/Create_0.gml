/// @description Bowser Statue fire

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = -1;

//How vulnerable is this enemy to Yoshi?
edible = 3;

//Obtain motion
alarm[0] = 1;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}
