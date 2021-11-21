/// @description Change the direction

//Check the direction
switch (dir) {

    //Up
    case (1): 
    case (3): {
    
        //Move up
        direction = 90;
        
        //Set up the frame
        image_index = 5;
    } break;
    
    //Left
    case (2): {
    
        //Move left
        direction = 180;
        
        //Set up the frame
        image_index = 6;
    } break;
    
    //Right
    case (4): {
    
        //Move right
        direction = 0;
        
        //Set up the frame
        image_index = 7;
    }
}

//Cycle between directions
dir++;
if (dir > 4)
    dir = 1;