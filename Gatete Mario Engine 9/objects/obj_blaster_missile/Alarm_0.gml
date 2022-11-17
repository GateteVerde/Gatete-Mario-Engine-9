/// @description Shoot a missile bill

//If this object is outside the view or Mario does not exist, deny event
if (outside_view())
|| (!instance_exists(obj_mario)) {

	alarm[0] = 60;
	exit;
}

//Otherwise
else {

    //If Mario is transforming or it's next to the cannon
	if (instance_exists(obj_mario_transform))
    || ((obj_mario.x > bbox_left-32) && (obj_mario.x < bbox_right+32)) {
    
        alarm[0] = 1;
        exit;
    }
    
    //Otherwise, if none of the conditions above match, let the shooting begin.
    else {
    
        //If this cannon did not shoot a missile bill
        if (mybullet != -1) {
        
            alarm[0] = 1;
            exit;
        }
    
        //If Mario is at the left
        if (obj_mario.x < x) {
                        
            //Play 'Thud' sound
            audio_play_sound(snd_thud, 0, false);
                
            //Create missile bill
			mybullet = instance_create_depth(x+8, y, -2, obj_missilebill);
			with (mybullet) {
					
				//Set motion
                direction = 180;
				speed = 1.5;
					
				//Create smoke effect
                instance_create_depth(x, y+8, -6, obj_smoke);
            }
                
            //Repeat
            alarm[0] = 300;
        }
        
        //Otherwise, if Mario is at the right
        else if (obj_mario.x > x) {
            
            //Play 'Explosion' sound
            audio_play_sound(snd_thud, 0, false);
                
            //Create bullet bill
			mybullet = instance_create_depth(x+8, y, -2, obj_missilebill);
			with (mybullet) {
					
				//Set motion
                direction = 0;
				speed = 1.5;
					
				//Create smoke effect
                instance_create_depth(x, y+8, -6, obj_smoke);
            }
                
            //Repeat
            alarm[0] = 300;     
		}
    }
}
