/// @description Damage Mario

if (yspeed > 0) {

	instance_create_depth(other.x, other.y, -5, obj_mario_dead);
	with (other) instance_destroy();
	exit;
}