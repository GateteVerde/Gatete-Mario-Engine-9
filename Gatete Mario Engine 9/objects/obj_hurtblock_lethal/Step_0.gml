/// @description Insta-kill Mario

//Check for Mario
var mario = collision_rectangle(bbox_left - 1, bbox_top -1, bbox_right + 1, bbox_bottom + 1, obj_mario, 0, 0);

//If Mario is on this platform
if (mario) {
	
	//If Mario is not invulnerable
	if (mario.invulnerable == false) {

		//Kill Mario instantly
		instance_create_depth(mario.x, mario.y, -5, obj_mario_dead);
		with (mario) instance_destroy();
		exit;
	}
}