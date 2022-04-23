/// @description Fire Snake body

//Inherit the parent event
event_inherited();

//Does this object have a parent
parent = -1;

//How vulnerable is this enemy to various items?
vulnerable = 2;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 2;

//No swimming
noswim = 1;

//Jump
jumping = 0;

//Jump downwards
ready = 0;

//Type of jump
jump_type = 0;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 16;
		new_radius = 16;
	}
}
