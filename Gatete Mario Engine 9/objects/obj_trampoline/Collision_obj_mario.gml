/// @description Make the player interact with the spring

//If the player is above and moving down, use the stomp event.
if ((other.bbox_bottom < bbox_top+5) && (other.yspeed >= 0)) {

    //Animate
    image_speed = 0.4;
    
    //Player logic
    with (other) {
        
        //Force idle state
        state = playerstate.idle;
    
        //Stop horizontal speed.
        xspeed = 0;
        
        //Stop vertical speed.
        yspeed = 0;
        if (yadd > 0)
            yadd = 0;
    }
    
    //Spring is ready
    ready = 1;
    s_ready = 1;
    
    //Player logic (Part 2)
    with (other) event_user(15);
}
    
//If the player is above the spring.
if (ready) {

	//Force 'Idle' state, disable gravity and set y position
	obj_mario.state = playerstate.idle;
	obj_mario.disablegrav = 1;
	obj_mario.jumping = 2;
	obj_mario.sliding = 0;
	obj_mario.y = self.y+(image_index*4)-14;
}