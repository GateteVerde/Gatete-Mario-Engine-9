/// @description Take more steps or stomp the ground

//Stop horizontal movement
if (steps > 0) {

    //Decrement step
    steps--;
    
    //Stop horizontal speed
    xspeed = 0;
    move_snap(8, 16);
    
    //Repeat the process
    alarm[0] = 8;
}
else {

    //Set the sprite
    sprite_index = spr_sumobro_stomp;
    
    //Do not animate
    image_speed = 0;
    image_index = 0;
    
    //Stop
    xspeed = 0;
    move_snap(8, 16);
    
    //Start stomp
    alarm[2] = 48;
}