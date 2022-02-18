/// @description Clear if Mario is 16 pixels to the leftmost part of the tape

//If Mario exists
if (instance_exists(obj_mario)) {

    //If Mario is 16 pixels at the right of the tape
    if (obj_mario.x > x+16) {
    
        //Play 'Goal' sound
        audio_play_sound(snd_goalgate, 0, false);
        
        //Turn Mario onto the goal object
        with (obj_mario) {
        
            with (instance_create_depth(x, y, -5, obj_mario_gate)) {
            
                yspeed = obj_mario.yspeed;
            }
            instance_destroy();
        }
        
        //Destroy the tape
        instance_destroy();
    }
}