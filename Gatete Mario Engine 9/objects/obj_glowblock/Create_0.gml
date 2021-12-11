/// @description Glow Block

//Inherit the parent event
event_inherited();

//Create a light
if (instance_exists(obj_lightcontrol)) {
	
	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 16;
	}
}
else
	mylight = -1;