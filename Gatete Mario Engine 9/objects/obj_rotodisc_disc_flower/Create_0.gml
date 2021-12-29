/// @description Flower Rotodisc (Actual waffle)

//Animate
image_speed = 0;
pal = 0;

//Leave a trail
alarm[0] = 2;

//Change palette
alarm[1] = 2;

//Direction
clockwise = 1;

//Radius
maxradius = 80;
radius = maxradius;

//Angle
angle = 0;

//Step
step = 0;
speedd = 2;

//Create a light
if (instance_exists(obj_lightcontrol)) {

	with (instance_create_layer(x + 8, x + 8, "Main", obj_light_npc)) {
		
		parent = other.id;
		radius = 8;
		new_radius = 8;
	}
}