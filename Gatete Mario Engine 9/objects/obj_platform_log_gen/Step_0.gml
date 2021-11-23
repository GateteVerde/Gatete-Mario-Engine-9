/// @description Log Platform logic

//Cap vertical speed
if (vspeed > 3) {

	vspeed = 3;
	gravity = 0;
}

//Destroy when outside
if (bbox_top > room_height + 32)
	instance_destroy();