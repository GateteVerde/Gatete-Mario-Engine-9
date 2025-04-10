/// @description Diagonal Podoboo

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 3;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 2;

//Do not turn into silver coins
turn_silver = 0;

//Do not unfreeze
freeze_object = -2;

//Start moving
alarm[10] = 2;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}
