/// @description Destroy if Mario dies or clears the level

if (instance_exists(obj_mario_dead))
|| (instance_exists(obj_mario_clear)) {
	
	instance_destroy();
	exit;
}
