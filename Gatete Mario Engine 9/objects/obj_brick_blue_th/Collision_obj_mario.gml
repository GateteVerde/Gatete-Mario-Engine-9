/// @description Make Mario interact with the item

//If the block can hurt the player
if (hurtplayer == 1)
    with (other) event_user(0);
    
//Otherwise
else {

    //If not moving up
    if (yspeed > -0.5) {
    
        //If the item can be held and the player can hold it
        if (can_hold())
        && (ready == 0)
        && (other.bbox_bottom > bbox_top) {
        
            //Make the player hold it
            other.holding = 2;
            
            //Hold
            held = 1;
            
            //Stop movement
            xspeed = 0;
			yspeed = 0;
			yadd = 0;
        }
        
        //Otherwise
        else if ((held == 0) && (ready == 0)) {
        
            //Play 'Kick' sound
            audio_play_sound(snd_kick, 0, false);
            
            //Create thump
            with (instance_create_depth(x, y+8, -6, obj_smoke)) sprite_index = spr_spinthump;
            
            //Kick it
            ready = 1;
            
            //Reset alarms
            alarm[0] = -1;
            alarm[1] = -1;
            image_speed = 1;
            
            //If the player is at the left of the block
            if (other.x < x)
                xspeed = (2.7+(abs(obj_mario.xspeed)/4));
                
            //Otherwise, if the player is at the right of the block
            else if (other.x > x)
                xspeed = -(2.7+(abs(obj_mario.xspeed)/4));                             
        }
    }
}