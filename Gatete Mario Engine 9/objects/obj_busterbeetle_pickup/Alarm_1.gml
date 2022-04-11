/// @description Throw the brick if Mario is on sight

//If the holder does not exist
if (!instance_exists(parent)) {

    alarm[1] = 1;
    exit;
}

//If Mario does exist
if (instance_exists(obj_mario)) {

    //If Mario is 48 pixels below the holder top and this one is not frozen
    if ((obj_mario.y > y-48) && (parent.freeze == false)) {
		
		//Play 'Hammer' sound
		audio_play_sound(snd_hammer, 0, false);
    
        //Create a thrown brick
        with (instance_create_depth(x, y, -2, obj_brick_blue_th)) {
        
            //If Mario is at the left, throw it in that direction
            if (obj_mario.x < x) {
            
                //Make the parent look at that direction
                with (other.parent) {
                
                    xscale = -1;
                    event_user(15);
                }
                
                //Set the motion
                xspeed = -2.7;
                yspeed = -3;
            }
            
            //Otherwise if Mario is at the right, throw it in that direction
            else if (obj_mario.x > x) {
                        
                //Make the parent look at that direction
                with (other.parent) {
                
                    xscale = 1;
                    event_user(15);
                }
                
                //Set the motion
                xspeed = 2.7
                yspeed = -3;              
            }
            
            //Throw it
            ready = 1;
            
            //Allow the brick to hurt Mario
            harmplayer = 1;
            
            //Set the brick details
            sprite_index = other.sprite_index;
            shard_sprite = other.shard_sprite;
        }
        
        //Destroy
        instance_destroy();
    }
    
    //Otherwise, wait
    else {
    
        alarm[1] = 1;
        exit;
    }
}
