/// @description Coin Challenge Block logic

//If gravity is ever activated 
if (ready2 == 1) {
	
	//Move to where the coin belongs
	var _xtarget = camera_get_view_x(view_camera[0]) - 8;
	x = lerp(x, _xtarget, 0.02);

	//Plummet to where it splits open
	if (y > camera_get_view_y(view_camera[0]) + global.gh - 28) {
		
		//Play 'Spin Stomp' sound
		audio_play_sound(snd_spinstomp, 0, false);

		//Smoke
		for (var i = 0; i < 3; i++) {
		
			instance_create_depth(camera_get_view_x(view_camera[0]) + 12 + (i * 16), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, -100, obj_smoke)
		}
		
		//Collect Mode
		global.collect_mode = 1;
		global.coins_left = coins;
		
		//Delay un-freeze
		alarm[2] = 30;
		
		//Make it invisible
		visible = false;
		
		//Stop the block
		ready2 = 2;
	}
}