/// @description Lava Lotus fireball

//Inherit event
event_inherited();

//Ignore moving platforms
ignore_platforms = true;

//Obtain motion
alarm[0] = 1;

//Blink
alarm[1] = 300;

//Destroy
alarm[2] = 420;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}