/// @description A fireball shot by Mario

//Inherit event from parent
event_inherited();

//Set vertical speed
yspeed = (global.fireballtype == 1 && global.player == 1) ? 0 : 3;

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
		radius = 8;
		new_radius = 8;
	}
}

//Set green fireball
if (global.player == 1)
&& (object_index != obj_iceball)
	sprite_index = spr_fireball_luigi;