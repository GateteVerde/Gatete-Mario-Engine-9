/// @description Collision with bumped blocks

if (other.vspeed < 0) 
&& (bbox_bottom < other.yprevious+5) {

	//Set the vertical speed
	yspeed = -4 + (swimming * 2);
	y--;
	
	//Reverse horizontal speed
	if ((xspeed > 0) && (x < other.x + sprite_get_width(sprite_index) / 2))
	|| ((xspeed < 0) && (x > other.x + sprite_get_width(sprite_index) / 2))
		xspeed = -xspeed;
}