/// @description Handles the Mario Start! text, room warping, music and timer

//If the music from last room is not the same as the current room
if (global.levelmusic != inisection) {

	if (audio_is_playing(global.stream)) {
		
		//Stop old stream
		alarm[1] = 1;
	}
    
    //Play new stream
    global.levelmusic = inisection;
}

//Set up the time for the level.
if (leveltime > 0) { //If the timer has been set.

    //If the global time for the level is equal to 0.
    if (global.timer = 0) {
    
        global.timer = leveltime;
        alarm[2] = 60;
    }
}
    
//If the time has been set before.
if (global.timer > 0)    
    alarm[2] = 60;

//If the player just started the level
if (global.mariostart == 0) {

    //The level has started
    global.mariostart = 1;
    
    //Handles checkpoints
    if (instance_exists(global.checkpoint)) {

        //Destroy all player objects
        event_user(1);
		
		//Set autoscroll position
		if (instance_exists(obj_autoscroll)) {
		
			with (obj_autoscroll) {
			
				x = global.checkpoint.scroll_x;
				y = global.checkpoint.scroll_y;
			}
		}

        //Check if Mario is on a plane/submarine and create it later
		var mymario = (instance_exists(obj_mario_shmup)) ? obj_mario_shmup : obj_mario;

		//Create it
		instance_create_layer(global.checkpoint.xcoor, global.checkpoint.ycoor, "Main", mymario);
    }

    //Create the Mario Start! effect
    instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -999, obj_mariostart);
}

//Otherwise, fade out
else {

	instance_create_depth(0, 0, -99, obj_fade_out);
}

//If Mario came from another room
if (global.postchange != -1) {

	//Destroy player objects
	event_user(1);
	
	//Create the appropiate object at the given position
    with (obj_warp_node) {
    
        if (global.exit_id == myid)
            event_user(0);
    }
    
    //Allow warp
    global.postchange = -1;
}

//If the player was riding a yoshi or a kuribo shoe on the previous room
if (global.mount > 0) {
	
	//Kuribo Shoe
	if (global.mount == 2)
		instance_create_depth(x, y, -2, obj_kuriboshoe);
		
	//Yoshi
	else if (global.mount == 1)
		instance_create_depth(x, y, -2, obj_yoshi);
}

//Otherwise, if the player carried an item from the previous room
else if (global.carrieditem != noone) {
    
    //Create it
    with (instance_create_depth(x, y, -2, global.carrieditem)) {
    
        //Hold the item
        held = 1;
        
        //Set up the sprite
        if (global.carriedsprite != noone) {
        
            //Change the sprite of the held item
            sprite_index = global.carriedsprite;
			image_index = global.carriedframe;
            
            //Reset the sprite
            global.carriedsprite = noone;
			global.carriedframe = 0;
        }
    }
    
    //Check what item is going to hold the item
    follow_which_mario(); 
    
    //Check if Mario exists and make it hold if so.
    if (instance_exists(obj_mario)) {
    
        //If the item held was a SMB2 one
        if (object_get_parent(global.carrieditem) == obj_carryparent) {
        
            //If the item held was a blue boomerang
            if (global.carrieditem == obj_boomerang_blue_held)
                obj_mario.holding = 3;
            else            
                obj_mario.holding = 1;
        }
        
        //Otherwise, if the item held was a SMB3 / SMW one
        else if (object_get_parent(global.carrieditem) == obj_holdparent)
            obj_mario.holding = 2;
    }
    
    //Otherwise
    else {
    
        if (instance_exists(follow))
            follow.holding = 1;
    }

    //Reset held object
    global.carrieditem = noone;
}

//Turn on P-Switch if it was activated on the previous room.
if (global.pswitch > 0) {

    //Check ticks brought from last room
    if (global.pswitch < 120) {
    
        pswitch_warn = 1;
    }    

    //Turn on the P-Switch
    event_user(5);
    
    //Set the timer
    alarm[5] = max(global.pswitch, 30);
    
    //Reset the variable
    global.pswitch = 0;
}

//Turn on gray P-Switch if it was activated on the previous room.
if (global.gswitch > 0) {

    //Check ticks brought from last room
    if (global.gswitch < 120) {
    
        gswitch_warn = 1;
    }    
    
    //Turn on the gray P-Switch
    event_user(6);
    
    //Set the timer
    alarm[6] = max(global.gswitch, 30);
    
    //Reset the variable
    global.gswitch = 0;
}

//If a star was active on the previous room.
if (global.starman > 0) {

    //Create a new starman object.
    with (instance_create_depth(0, 0, 100, obj_invincibility)) {
		
		//Set the timer
		alarm[0] = max(global.starman, 30);
		
		//Hereby the combo from last room
		if (global.hitcombo > 0) {
		
			hitcombo = global.hitcombo;
			global.hitcombo = 0;
		}
		
		//Prevent the warning sound from playing
		if (global.starman < 120) 
			warning = 1;
	}
    
    //Reset the variable
    global.starman = 0;
}

//Get a starman if you activated one on the map
if (global.mapstar == 1) {

	//Create a new starman object
	instance_create_depth(0, 0, 100, obj_invincibility);
	
	//Reset variable
	global.mapstar = 0;
}