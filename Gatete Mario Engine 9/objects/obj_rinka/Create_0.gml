/// @description Rinka

//Inherit the parent event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//How vulnerable is this enemy to various items?
vulnerable = 2;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 0;

//Set motion
alarm[10] = 60;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}