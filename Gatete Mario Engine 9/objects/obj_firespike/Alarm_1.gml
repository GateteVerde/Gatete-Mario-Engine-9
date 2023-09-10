/// @description Throw the ball

//Set the sprite
sprite_index = spr_firespike;

//Throw the previously created ball
with (myball) {
	
	//Set the sprite
	sprite_index = spr_heavyfirebro_fireball;
    
    //Set the horizontal speed
    xspeed = 2*sign(other.xscale);    
    
    //Boost
    y--;
    
    //Apply physics
    ready = 1;
}

//Start moving
alarm[10] = 15;