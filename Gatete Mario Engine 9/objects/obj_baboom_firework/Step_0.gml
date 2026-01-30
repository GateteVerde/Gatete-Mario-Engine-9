/// @description Pop-Omb Firework logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Slow down
yspeed += 0.05;
if (yspeed > 0.1) {

	instance_create_depth(x, y - 4, -2, obj_explosion);
	instance_destroy();
	exit;
}