/// @description A fireball shot by Mario

//Inherit event from parent
event_inherited();

//Set vertical speed
yspeed = 3;

//No bounces
bounces = -1;

//Do not swim
noswim = true;

//Do not turn toward walls
turn_toward = false;

//Leave a trail
alarm[0] = 1;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 16;
	}
}