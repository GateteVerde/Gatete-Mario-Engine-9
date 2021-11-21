/// @description Coin Challenge Block logic

//If gravity is ever activated 
if (ready2 == 1) {

	//Plummet to where it splits open
	if (y > camera_get_view_y(view_camera[0]) + global.gh - 30) {
		
		//Play 'Spin Stomp' sound
		audio_play_sound(snd_spinstomp, 0, false);

		//Destroy the sprite
		sprite_delete(snapshot);

		//Activate all instances
		instance_activate_all();

		//Smoke
		for (var i = 0; i < 3; i++) {
			
			instance_create_depth(camera_get_view_x(view_camera[0]) + 12 + (i * 16), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, -32, obj_smoke)
		}

		//Collect Mode
		with (obj_hud) {
			
			collect_mode = 1;
			coins_left = other.coins;
		}

		//Destroy this object
		instance_destroy();
	}
}