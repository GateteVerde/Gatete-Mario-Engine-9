/// @description Hang the balloon

if (other.state == playerstate.jump)
&& (ready == 0)
&& (global.mount == 0)
&& (obj_mario.holding == 0)
&& (global.powerup != cs_tiny)
&& (global.powerup != cs_mega) {
	
	//If Mario is holding a balloon, ignore
	if (collision_point(other.x, other.y, obj_glider, 0, 0))
	exit;
	
	//Hang balloon
	ready = 1;
	
	//Stop jumping
	if (other.jumping > 0)
		other.jumping = 0;
}