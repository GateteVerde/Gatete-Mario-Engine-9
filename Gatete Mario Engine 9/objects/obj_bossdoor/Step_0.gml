/// @description Close door when Mario passes thru and begin boss battle

//If not visible
if (visible == 0) {

	//If Mario exists and passes thru this door
	if ((instance_exists(obj_mario)) && (obj_mario.x > x+48)) {
		
		//Play 'Destroy' sound
		audio_play_sound(snd_destroy, 0, false);
	
		//Make visible
		visible = 1;
		
		//Create solid barrier
		with (instance_create_layer(x, y, "Main", obj_solid)) image_yscale = 4;
		
		//Scroll the screen to the right
		with (instance_create_layer(obj_levelcontrol.x, obj_levelcontrol.y, "Main", obj_autoscroll)) {
		
			speed = 3;
			maxspd = 3;
			alarm[2] = -1;
		}
		
		//Create smoke
		instance_create_depth(x+8, y+8, -6, obj_smoke);
		alarm[0] = 20;
		
		//Freeze Mario
		with (obj_mario) enable_control = false;
	}
}