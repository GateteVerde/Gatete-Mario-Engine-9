/// @description Display cards and fake up P-Meter depletion

//Set P-Meter position
if (collect_mode > 0)
|| ((instance_exists(obj_coinblock)) && (obj_coinblock.ready == 1))
	pmeterx = 48;

//Handle out prizes if coin collection mode is active
if (collect_mode == 1) {
	
	//If there's no more coins to collect
	if (coins_left <= 0) {
		
		//Set collection mode to 2
		collect_mode = 2;
		
		//Create a poof of smoke
		instance_create_depth(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, -32, obj_smoke);
		
		//Enable the blue house in-map
		global.blue_house = true;
	}
}

//If the goal card exists, show HUD cards
if (instance_exists(obj_goalcard)) {

	if (obj_levelcontrol.x > obj_goalcard.x-global.gw) 
	|| (obj_levelcontrol.x > obj_goalcard.x)
	    show_cards = 240;
	else
	    show_cards--;
}

//Otherwise, hide HUD cards
else
show_cards = 0;

//Fake P-Meter if Mario exists and the pmeter is greater than 0
if (fake_pm == 0) {
	
	if (instance_exists(obj_mario))
	&& (obj_mario.pmeter > 0)
		fake_pm = obj_mario.pmeter;
}
else
	fake_pm--;