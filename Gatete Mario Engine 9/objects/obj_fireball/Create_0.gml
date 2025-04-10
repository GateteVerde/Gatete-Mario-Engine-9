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

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 4;
		new_radius = 4;
	}
}

//Set green fireball
if (global.player == 1)
&& (object_index != obj_iceball)
	sprite_index = spr_fireball_luigi;