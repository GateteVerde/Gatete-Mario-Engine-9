/// @description Hotfoot

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 2;

//Whether the enemy is moving
movenow = 0;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 16;
		new_radius = 16;
	}
}
