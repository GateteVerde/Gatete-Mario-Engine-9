/// @description Handles the Mario Start! text, room warping, music and timer

//If the music is not the same as the music used in the last room
if (global.levelmusic != levelmusic) {

    //Stop the old music
    audio_stop_sound(global.levelmusic);

    //Set the new music
    global.levelmusic = levelmusic;    
}

//Set up the time for the level.
if (leveltime > 0) { //If the timer has been set.

    //If the global time for the level is equal to 0.
    if (global.timer = 0) {
    
        global.timer = leveltime;
        alarm[2] = 60;
    }
    
    //Otherwise, if the time has been set before.
    else if (global.timer > 0)    
        alarm[2] = 60;
}

//If the player just started the level
if (global.mariostart == 0) {

    //The level has started
    global.mariostart = 1;
    
    //Handles checkpoints
    if (instance_exists(global.checkpoint)) {

        //Destroy all player objects
        event_user(1);
        
        //Create a new Mario at the desired location
		instance_create_layer(global.checkpoint.xcoor, global.checkpoint.ycoor, "Main", obj_mario);
    }

    //Create the Mario Start! effect
    instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -999, obj_mariostart);
}
else
    instance_create_depth(0, 0, -99, obj_fade_out);