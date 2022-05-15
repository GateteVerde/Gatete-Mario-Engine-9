/// @description Volcano Lotus fireball

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//Rinka (Set automatically)
rinka = 0;

//No gravity
yadd = 0;

//Fall
ready = 0;

//Obtain motion
alarm[0] = 1;

//Enable gravity
alarm[1] = 100;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}
