/// @description Restart up animation

if (sprite_index == spr_trampoline) {

    //If the spring is about to launch the player upwards.
    if (s_ready == 1) {
    
        //If Mario does exist.
        if (instance_exists(obj_mario)) {
        
            //Play 'Trampoline' sound
            audio_play_sound(snd_trampoline, 0, false);
            
            //Set the player vertical speed
            obj_mario.yspeed = -5.425;
                        
            //Force player jump
            obj_mario.state = playerstate.jump;
            
            //Move up
            obj_mario.y -= 8;
            
            //Check if 'Shift' is pressed.
            if (input_check(input.action_0))
                obj_mario.jumping = 1;
            else
                obj_mario.jumping = 2;
        }
    }
    
    //Allow use
    ready = 0;
    alarm[0] = 8;
    
    //Set animation
    image_speed = 1;
    image_index = 0;
    
    //Set trampoline end sequence
    sprite_index = spr_trampoline_end;
}
else if (sprite_index == spr_trampoline_end) {

    //Set the sprite
    sprite_index = spr_trampoline;

    //Restart animation
    image_speed = 0;
    image_index = 0;
}