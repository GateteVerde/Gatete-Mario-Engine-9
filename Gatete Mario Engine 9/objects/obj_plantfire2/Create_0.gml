/// @description Jumping Piranha Plant fireball

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//Generate effect
numb = 0;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 4;
		new_radius = 4;
	}
}
