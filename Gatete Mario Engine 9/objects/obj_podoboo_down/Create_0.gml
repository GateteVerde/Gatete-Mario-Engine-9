/// @description Ceiling Podoboo

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

//Whether the Lava Bubble is jumping
ready = 0;

//Gravity
gravity = 0.2;
gravity_direction = 90;

//Set depth
depth = 150;

//Leave trail when moving up
alarm[3] = 1;

//Shake
offset = 0;
offsetdir = 1; //Set this to 1 if you want a shaking Podoboo
alarm[4] = 1;

//If this is a lava podoboo
if (sprite_index == spr_podoboo) {

	//Create a light
	if (instance_exists(obj_lightcontrol)) {

		with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
			parent = other.id;
			radius = 16;
			new_radius = 16;
		}
	}
}