/// @description Venus Fire Trap fireball

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//Obtain motion
alarm[0] = 1;

//Leave trail
alarm[1] = 1;

//Generate effect
numb = 0;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 4;
		new_radius = 4;
	}
}
