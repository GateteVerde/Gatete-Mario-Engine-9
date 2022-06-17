/// @description Autobomb

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 3;

//Do not lift
isheavy = 2;

//Create rider
rider = instance_create_depth(x, y, -2, obj_shyguy_rider);
with (rider) {

	image_speed = 1;
	visible = 1;
}

//Move towards Mario
alarm[10] = 2;