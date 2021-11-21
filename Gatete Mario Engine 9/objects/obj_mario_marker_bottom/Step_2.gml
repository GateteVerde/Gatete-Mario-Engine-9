/// @description Stay always at Mario's feet

//If Mario does not exist
if (!instance_exists(obj_mario)) {

	instance_destroy();
	exit;
}

x = obj_mario.x;
y = obj_mario.bbox_bottom + 1;