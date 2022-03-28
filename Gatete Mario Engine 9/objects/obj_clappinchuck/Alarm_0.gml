/// @description Jump or make noise when charging
    
//Do not animate
image_speed = 0;
image_index = 1;
    
//Gravity
yadd = 0.15;
    
//If Mario exists
if (instance_exists(obj_mario)) {
    
    //If Mario is on the air
    if (obj_mario.state == playerstate.jump) {
        
        //Play 'Trampoline' sound
        audio_play_sound(snd_trampoline, 0, false);
            
        //Set the vertical speed
        yspeed = -5;
        y--;
            
        //Clap
        clap = 1;
    }
    else {
        
        yspeed = -1.75;
        y--;
    }
}
else {
    
    yspeed = -1.75;
    y--;
}