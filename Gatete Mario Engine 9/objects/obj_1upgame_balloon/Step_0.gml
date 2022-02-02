/// @description Destroy when outside the view

if (hspeed < 0) && (x < -20)
|| (hspeed > 0) && (x > room_width + 20)
	instance_destroy();