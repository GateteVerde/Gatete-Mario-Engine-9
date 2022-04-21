/// @description Venus Fire Trap fireball

//Inherit event
event_inherited();

//Obtain motion
alarm[0] = 1;

//Blink
alarm[1] = 300;

//Destroy
alarm[2] = 420;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(0, 0, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}
