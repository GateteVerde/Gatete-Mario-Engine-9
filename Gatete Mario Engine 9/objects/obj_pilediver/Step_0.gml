/// @description Pile Diver Micro-Goomba logic

//Inherit the parent event
event_inherited();

//Set up the facing direction if in ground and make it jump again
if (yadd == 0) {

    //If the object jumped
    if (jumping == 2) {
    
        //Play 'Thud' sound
        audio_play_sound(snd_thud, 0, false);
    
        //Stop horizontal movement
        xspeed = 0;
    
        //End jump
        jumping = 3;
        
        //Jump again
        alarm[0] = 60;
    }
    
    //Otherwise, if the player does exist and it's nearby
    else if (jumping == 0) {
    
        //If the player does exist
        if (instance_exists(obj_mario)) 
        && (obj_mario.x > bbox_left-32)
        && (obj_mario.x < bbox_right+32) {
        
            //Animate
            image_speed = 1;
        
            //Start jump
            jumping = 1;
        }
    }
}

//If moving down, allow landing
if (yspeed > 0)
&& (jumping == 1)
    jumping = 2;