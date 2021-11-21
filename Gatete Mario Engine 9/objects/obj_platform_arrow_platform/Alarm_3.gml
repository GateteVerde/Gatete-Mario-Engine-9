/// @description Start moving inmediately

//Check the platform type
switch (type) {

    //Up
    case (0): 
    case (1): {
    
        //Set the frame
        image_speed = 0;
        image_index = 5;
        
        //Set the vertical movement
        vspeed = -0.5;
    } break;
    
    //Left
    case (2): {
    
        //Set the frame
        image_speed = 0;
        image_index = 6;
        
        //Sets the horizontal speed...
        hspeed = -0.5;
    } break;
    
    //Right
    case (3): {
    
        //Set the frame
        image_speed = 0;
        image_index = 7;
        
        //Sets the horizontal speed...
        hspeed = 0.5;
    } break;
}