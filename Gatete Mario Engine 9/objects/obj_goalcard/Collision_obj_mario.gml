/// @description Clear the level

//If the card has not been collected
if (ready == 0) {

	//Create goal mario
	with (instance_create_depth(other.x, other.y, -5, obj_mario_card)) mygoal = other.id;

	//Stop both music and timer
	with (obj_levelcontrol) {

	    event_user(0);
	    alarm[2] = 0;
	}

	//Clear the level
	global.clear = 1;

	//Forget check points
	global.checkpoint = noone;

	//Do not bring kuribo shoes outside
	if (global.mount == 2) {

	    //Play 'Transform' sound
	    audio_play_sound(snd_powerlost, 0, false);
    
	    //Forget it
	    global.mount = 0;
    
	    //With the shoe
	    with (obj_kuriboshoe) {
    
	        //Create flying shoe
	        with (instance_create_depth(x, y, -6, obj_kuriboshoe_lost)) {
        
	            sprite_index = other.sprite_index;
	            image_xscale = other.xscale;
	            hspeed = -1;
	        }
        
	        //Destroy
	        instance_destroy();
	    }
	}

	//Card collected
	ready = 1;

	//Play stream
	event_user(0);

	//Get card
	event_user(1);

	//Destroy the player last
	with (obj_mario) instance_destroy();
}