/// @description Make the player interact with the item

//If the player is above and moving down, stomp the trampoline.
if (other.bbox_bottom < bbox_top-vspeed+5)
&& (other.yspeed > 0) {

    //Animate
    image_speed = 0.4;
    
    //Player logic
    with (other) {
    
        //Stop horizontal movement
        xspeed = 0;
        
        //Stop vertical movement
        yspeed = 0;
        if (yadd > 0)
            yadd = 0;
    }
    
    //Trampoline is ready
    ready = 1;
    ready2 = 1;
    
    //Make sure to reset the player variable
    with (other) event_user(15);
}

//If the player is above the spring.
if (ready) {

	//Force 'Idle' state, disable gravity and set y position
	obj_mario.state = playerstate.idle;
	obj_mario.disablegrav = 1;
	obj_mario.jumping = 2;
	obj_mario.sliding = 0;
	obj_mario.y = self.y+(image_index*3)-14;
}