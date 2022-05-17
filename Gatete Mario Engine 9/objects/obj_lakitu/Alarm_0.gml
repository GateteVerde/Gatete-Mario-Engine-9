/// @description Throw an egg

//Before throwing an egg, check if Mario exists
if (instance_exists(obj_mario)) {

    //If there's 6 or less green lakitu eggs in place and the player is in the given coordinates.
    if (instance_number(obj_lakitu_egg) < 6) 
    && (obj_mario.x > xmin)
    && (obj_mario.x < xmax) 
	&& (!instance_exists(obj_mario_transform)) {
    
        //Play 'Hammer' sound
        audio_play_sound(snd_hammer, 0, false);
    
        //Create a egg
        with (instance_create_depth(x, y-16, -2, obj_lakitu_egg)) {
        
            //Set the vertical speed
            yspeed = -4;
            
            //Set the horizontal speed
            if (obj_mario.x < x)
                xspeed = -1;
            else
                xspeed = 1;
        }
        
        //Set throwing frame
        image_speed = 0;
        image_index = 1;

        //Set default frame
        alarm[1] = 30;
    }
    
    //Otherwise, wait
    else {
    
        alarm[0] = 150;
        exit;
    }
}

//Otherwise, wait
else {

    alarm[0] = 150;
    exit;
}
