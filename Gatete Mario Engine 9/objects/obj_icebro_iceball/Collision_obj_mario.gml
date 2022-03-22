/// @description Freeze Mario

//If the player is invulnerable
if (instance_exists(obj_invincibility)) {

    event_user(0);
    exit;
}

//Otherwise, if the player is riding a yoshi or it's flying with the cape
else if (global.mount > 0) 
|| (instance_number(obj_mario_fly) > 0) {

    with (other) event_user(0);
    event_user(0);
    exit;
}

//Otherwise, freeze
else {

    //If the player has not been frozen
    if (other.freezetime == 0) {
    
        //With the player
        with (other) {
    
            //Play 'Freeze' sound
            audio_play_sound(snd_freeze, 0, false);
            
            //Stop movement
            xspeed = 0;
            yspeed = 0;
            yadd = 0;
            
            //Freeze
            freezetime = 60;
            
            //Disable controls
            enable_control = false;
        }
    }
    
    //Otherwise, get hurt
    else if (other.freezetime > 0) {
    
        //With the player
        with (other) {
        
            //Play 'Shatter' sound
            audio_play_sound(snd_icicle, 0, false);
            
            //Repeat 32 times
			repeat (32) {
			
				with (instance_create_depth(bbox_left + sprite_width/2, bbox_top + sprite_height / 2, -6, obj_sparkle))
					motion_set(random(360), random(1));
			}
        
            //Get hurt
            event_user(0);
            
            //Break ice
            freezetime = 0;
            
            //Enable controls
            enable_control = true;            
        }
    }
}

//Destroy snow ball
event_user(0);