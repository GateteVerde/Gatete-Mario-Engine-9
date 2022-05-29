/// @description Set the depth and vulnerability

switch (depth) {

    //If behind a fence, turn vulnerable
    case (150): {
    
        //Set the sprite
        sprite_index = spr_netkoopa_red;
    
        //Set vulnerability
        vulnerable = 0;
        
        //Set stomp grade
        stomp = 0;
		
		//Set edible grade
		edible = 0;
        
        //Set depth
        depth = -2;
    } break;
    
    //Otherwise if it's on front of a fence, turn invulnerable
    case (-2): {
    
        //Set the sprite
        sprite_index = spr_netkoopa_red_b;
    
        //Set vulnerability
        vulnerable = 100;
        
        //Set stomp grade
        stomp = -1;
		
		//Set edible grade
		edible = 3;
        
        //Set depth
        depth = 150;
    } break;
}

//Set animation
image_speed = 1;

//Choose new direction
switch (ready) {

    //Down
    case (2): {
    
        ready = 0;
        yspeed = 1;
    } break;
    
    //Right
    case (3): {
    
        ready = 1;
        xspeed = 1;
    } break;
    
    //Up
    case (0): {
    
        ready = 2;
        yspeed = -1;
    } break;
    
    //Left
    case (1): {
    
        ready = 3;
        xspeed = -1;
    } break;
}

//Can turn again
alarm[1] = 10;
