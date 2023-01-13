/// @description Animate

//When on flagpole
if (ready < 2) {

    //Set climbing pose
    sprite_index = global.goal_sprite[global.powerup];

    //Animate
    if (vspeed > 0)
        image_speed = 0.15;
    else {
    
        image_speed = 0;
        image_index = 0;
    }
}

//When not on flagpole
else {

    //When on the ground, use walking sprite.
    if (yadd = 0) { 
    
        if (xspeed == 0) {
        
            //Set idle pose
            sprite_index = global.clear_sprite[global.powerup];
            image_speed = 0;
            image_index = 0;
        }
        else {
        
            //Set walking pose
            sprite_index = global.walk_sprite[global.powerup];
            
            //Animate
            image_speed = 0.065+abs(xspeed)/7.5;
        }
    }
    
    //Otherwise
    else {
		
		//If Mario has the frog suit
		if (global.powerup != cs_frog) {
    
	        //Use the jump sprite
	        sprite_index = global.jump_sprite[global.powerup];
    
	        //Use the correct image index
			if (yspeed < 0)
				image_index = 0;
			else
				image_index = 1;
		}
		
		//Otherwise
		else {
		
			//Use the walk sprite
			sprite_index = global.walk_sprite[global.powerup];
			
			//Set the animation
			image_speed = 0;
			image_index = 2;
		}
    }
}