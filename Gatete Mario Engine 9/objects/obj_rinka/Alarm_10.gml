/// @description Move towards Mario

if (freeze == true) {

	alarm[10] = 1;
	exit;
}

//Motion
direction = (instance_exists(obj_mario)) ? point_direction(x, y, obj_mario.x, obj_mario.y+8) : point_direction(x, y, obj_levelcontrol.x+8, obj_levelcontrol.y+8);
speed = 1.5;

//Transform speed
xspeed = hspeed;
yspeed = vspeed;
speed = 0;
