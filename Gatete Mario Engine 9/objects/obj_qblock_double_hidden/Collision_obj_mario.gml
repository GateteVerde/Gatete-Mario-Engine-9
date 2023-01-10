/// @description If Mario jumps from below, reveal block

//If Mario is moving up and it's jumping
if (global.powerup != cs_mega)
&& (other.yspeed < 0)
&& ((other.jumping > 0) || (other.swimming == 1))
&& (other.bbox_top > bbox_bottom + other.yspeed) {

	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false);
	
	//Stop Mario
	other.yspeed = 0;

	//Create a new block, give it the same item and bump it.
	with (instance_create_depth(x, y, 9, obj_qblock_double)) {
		
		//Set the item to reveal
		sprout[0] = other.sprout[0];
		sprout[1] = other.sprout[1];
	
		//Set state to bumped
		ready = 1;
						
		//Set horizontal speed
		vspeed = -2;
		alarm[0] = 4;
						
		//Create block specific events
		event_user(0);		
	}
	
	//Destroy
	instance_destroy();
}