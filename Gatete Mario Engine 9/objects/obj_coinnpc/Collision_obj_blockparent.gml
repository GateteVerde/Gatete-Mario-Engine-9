/// @description Collect the coin

if (yspeed >= 0)
&& (other.vspeed < 0) {

	//Turn into a collected coin
	instance_create_depth(x, y, -4, obj_block_coin);
	
	//Destroy
	instance_destroy();
}