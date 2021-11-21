/// @description If Mario jumps from below, reveal block

//If Mario's vertical speed is lower than 0 and Mario is not on his Mega form
if (global.powerup != cs_mega)
&& (other.yspeed < 0)
&& (other.bbox_top > bbox_bottom+other.yspeed) {

	//Create a new block, give it the same item and bump it.
	with (instance_create_depth(x, y, 9, obj_noteblock_blue)) {
	
		//Set state to bumped
		ready = 1;
						
		//Set horizontal speed
		vspeed = -2;
		alarm[0] = 4;
	}
	
	//Destroy
	instance_destroy();
}