/// @description Break when stomping blocks while riding a yoshi

//Inherit event from parent
event_inherited();

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_bottom+4, obj_mario, 0, 0);

//If Mario does exist
if (mario) {

	//If Mario is riding up a Yoshi
	if ((global.mount == 1) && (mario.yspeed > 0)) {
	
		//Break the block
		event_user(15);
		
		//Make Mario bounce
		with (mario)
			event_user(1);		
	}
}