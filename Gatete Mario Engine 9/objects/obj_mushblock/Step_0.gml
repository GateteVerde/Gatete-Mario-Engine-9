/// @description Insert description here

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top-2, bbox_right, bbox_top, obj_mario, 0, 0);

//If Mario is above this object
if (mario) {

	if (can_carry())
	&& (mario.bbox_bottom < yprevious+5) {

		//Force Mario to hold
		with (mario) {
	
			holding = 1;
			visible = 0;
		}
	
		//Create puller object
		instance_create_depth(mario.x, y - 16, -5, obj_puller);
	
		//Finish pull
		alarm[0] = 10;
	}
}