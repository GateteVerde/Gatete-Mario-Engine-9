/// @description Rotodisc (Actual waffle)

//Animate
image_speed = 0;
pal = 0;

//Leave a trail
alarm[0] = 2;

//Change palette
alarm[1] = 2;

//Angle
angle = 0;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	mylight = instance_create_layer(0, 0, "Main", obj_light_npc);
	with (mylight) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}