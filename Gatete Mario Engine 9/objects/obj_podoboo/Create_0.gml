/// @description Podoboo

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
yadd = 0.2;

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

		mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
		with (mylight) {
		
			parent = other.id;
			radius = 8;
			new_radius = 8;
		}
	}
}