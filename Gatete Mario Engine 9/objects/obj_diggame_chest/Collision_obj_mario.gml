/// @description Open up the chest and give it's contents

//If the chest has not been opened yet, open it
if (ready == 0) {

    //If the roll gave a number between 0 and 1000
    if ((roll >= 0) && (roll <= 1000)) {
    
        //Set up a new roll
        var roll2
        roll2 = choose(10, 20, 50);
        
        //Repeat the number given in roll2
        repeat (roll2) {
            
            with (instance_create_depth(x+8, y-16, -4, obj_coinnpc)) {
            
                //Set the horizontal speed
                hspeed = random_range(1,-1);
                
                //Set the vertical speed
                vspeed = random_range(-3,-6);
            }
        }
    }
    
    //Otherwise, if the roll gave a number between 1001 and 8000
    else if ((roll >= 1001) && (roll <= 8000)) {
    
        with (instance_create_depth(x+8, y, -4, obj_powerup_get))
            sprite_index = macro_get_sprite(round(random_range(cs_fire, cs_iraccoon)));
    }
        
    //Otherwise, if the roll gave a number between 8001 and 9990
    else if ((roll >= 1001) && (roll <= 9990)) {
    
        with (instance_create_depth(x+8, y, -4, obj_powerup_get)) 
            sprite_index = macro_get_sprite(choose(cs_starman, cs_1up));
    }
                
    //Otherwise, if the roll gave a number above 9991
    else if (roll >= 9991) {
    
        with (instance_create_depth(x+8, y, -4, obj_powerup_get)) 
            sprite_index = macro_get_sprite(cs_3up);
    }
    
    //Chest opened
    ready = 1;
    
    //Go poof
    alarm[0] = 60;
    
    //Return to the map
    alarm[1] = 360;    
    
    //Set animation frame
    image_speed = 0;
    image_index = 1;
}