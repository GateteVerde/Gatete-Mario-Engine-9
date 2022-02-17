/// @description Make Mario complete the level

//If Mario does exist
if (instance_exists(obj_mario)) {

	//Prevent him from passing through the house
	if (obj_mario.x > x) {
	
		//Stay at the same offset of the house
		obj_mario.x = x;
		
		//If Mario's state is below jump
		if (obj_mario.state < playerstate.jump) {
		
			//Ignore if Mario has the mega powerup
			if (global.powerup == cs_mega)
			exit;
			
			//Stop music
			with (obj_levelcontrol) {
			
				event_user(0);
				alarm[2] = -1;
			}
			
			//Create goal object
			instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_bell);
			with (obj_mario) instance_destroy();
			exit;
		}
	}
}