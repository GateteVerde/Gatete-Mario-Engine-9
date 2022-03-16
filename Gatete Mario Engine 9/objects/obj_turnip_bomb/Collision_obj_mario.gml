/// @description Make Mario interact with the item

if (can_carry())
&& (other.bbox_bottom < mytop.yprevious+5) {

	//Force Mario to hold
	with (obj_mario) {
	
		holding = 1;
		visible = 0;
	}
	
	//Create puller object
	instance_create_depth(other.x, other.y, -5, obj_mario_puller);
	
	//Finish pull
	alarm[0] = 10;
}