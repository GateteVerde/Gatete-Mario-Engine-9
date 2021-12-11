/// @description Collision with bumped blocks

if (other.vspeed < 0) 
&& (bbox_bottom < other.yprevious+5) {

	//Set the vertical speed
	yspeed = -3 + (swimming * 1.5);
	y--;
}