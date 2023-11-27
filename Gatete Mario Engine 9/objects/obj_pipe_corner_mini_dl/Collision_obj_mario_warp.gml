/// @description Collision with the player when it is warping

//If the player is moving to the right and the player is at the middle, make the player move downwards.
if (other.direction = 0) && (other.x > x+8) {

    //With the player
    with (other) {
    
        //Set up the direction
        direction = 270;
        
        //Snap into position
        x = other.x+8;
        y = other.y;
    }
}

//Otherwise, if the player is moving up and the player is at the middle, make the player move to the left.
else if (other.direction == 90) && (other.y < y) {

    //With the player
    with (other) {
    
        //Set up the direction
        direction = 180;
        
        //Snap into position
        x = other.x+8;
        y = other.y;
    }    
}