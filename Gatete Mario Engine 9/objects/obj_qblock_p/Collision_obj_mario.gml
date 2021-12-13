/// @description Make Mario bounce if this one is above the block

//If the block is visible
if (visible == true) {

	if (vspeed < 0)
	&& (other.bbox_bottom < yprevious+5)
		other.yspeed = -2;
}