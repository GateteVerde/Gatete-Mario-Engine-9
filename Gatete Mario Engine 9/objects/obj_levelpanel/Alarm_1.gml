/// @description Go where the panel takes you

//Allow level exit
global.beaten = beaten;
	
//Check star coins
event_user(0);

//If no checkpoint was set, go to the default room
if (checkpoint == noone)
    global.targetroom = destination;
    
//Otherwise
else {

    //Remember it...
    global.checkpoint = checkpoint;
    checkpoint = noone;
    
    //...and go to the checkpoint room
    global.targetroom = global.checkpointroom;
}

//Remember the player last position in map
with (obj_mapmario) event_user(0);

//If no curtain exists
if (instance_number(obj_curtain_in) == 0) {

	with (instance_create_depth(obj_mapmario.x + 8, obj_mapmario.y + 4, -99, obj_curtain_in))
		target = global.targetroom;
}