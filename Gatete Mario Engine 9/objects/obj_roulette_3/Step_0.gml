/// @description Roulette step logic

//If the roulette can be stopped
if (stopready) 
&& (input_check_pressed(input.action_0)) {

    //If the roulettes didn't stop yet.
    if (stop == 0) {
    
        //Play 'Move' sound
        audio_play_sound(snd_move, 0, false);
        
        //Stop it
        stop = 1;
    }
}

//If the roulette is stopping...
if (stop == 1) {

    if (hspeed < -1.5)
        hspeed += 0.1;
    else
        hspeed = -1.5;
}
else if (stop == 2) {

    move_snap(16,1);
    if (x >= 80) && (x < 208)
		x = 80;
	else if (x > 208) && (x <= 336)
		x = 336;
}

//Round positions
x = round(x);
y = round(y);

//Wrap around
move_wrap(true, false, 48);

//Check for a stopper object.
stopper = collision_rectangle(x-1, bbox_top,x-1, bbox_bottom, obj_roulette_stop, 0, 0);

//If there's a block on the way.
if ((stop == 1) && (hspeed > -1.6) && (stopper)) {

    if (stopper.bbox_right < bbox_left) { 

        //Set up the roulette value
        obj_roulette_manager.rou3 = image_index;
        
        //End bonus
        obj_roulette_manager.rouend = 1;
        
        //Play sound
        audio_play_sound(snd_stomp,0,0);
        
        //Stop all roulettes
        with (obj_roulette_3) {
        
            hspeed = 0;
            stop = 2;
        }
        
        //Snap into position
        x = 208;
    }
}