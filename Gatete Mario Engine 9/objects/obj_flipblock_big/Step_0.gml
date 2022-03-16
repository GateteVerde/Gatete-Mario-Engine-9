/// @description Make Mario interact with the item

//Check for Mario
var mario = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+6, obj_mario, 0, 0);

//If Mario does exist
if (mario) {

	//If the item can be carried
	if (can_carry())
	&& (mario.bbox_bottom < yprevious+5) {

		//Force Mario to hold
		with (mario) {
	
			holding = 1;
			visible = 0;
		}
	
		//Create puller object
		instance_create_depth(mario.x, mario.y, -5, obj_mario_puller);
	
		//Finish pull
		alarm[2] = 40;
	}
}

//Inherit event from parent
event_inherited();