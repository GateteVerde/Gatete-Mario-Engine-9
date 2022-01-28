/// @description Open up the chest and give it's contents

//If the chest has not been opened yet, open it
if (ready == 0) {

    //If the roll gave a number between 0 and 8000
    if ((roll >= 0) && (roll <= 8000)) {
    
        with (instance_create_depth(x+8, y, -4, obj_powerup_get))
            sprite_index = macro_get_sprite(round(random_range(cs_fire, cs_iraccoon)));
    }
        
    //Otherwise, if the roll gave a number between 8001 and 9990
    else if ((roll >= 8001) && (roll <= 9990)) {
    
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