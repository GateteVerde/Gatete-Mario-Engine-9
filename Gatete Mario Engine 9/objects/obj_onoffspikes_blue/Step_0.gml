/// @description Blue On/Off Spikes logic

//Show spikes if this platform is ON
image_index = (global.on_off_block == 1) ? 1 : 0;

//Hurt Mario if spikes are shown
if (image_index == 1) {

	//Check for Mario
	var mario = collision_rectangle(bbox_left - 1, bbox_top - 2, bbox_right + 1, bbox_bottom + 2, obj_mario, 0, 0);

	//If Mario is on this platform
	if (mario)
		with (mario) event_user(0);	
}