/// @description Collision with the player when it is warping

//If the player is moving to the left and the player is at the middle, make the player move upwards.
if (other.direction = 180) && (other.x < x+16) {

    //With the player
    with (other) {
    
        //Set up the direction
        direction = 90;
        
        //Snap into position
        x = other.x+16;
        y = other.y+16;
    }
}

//Otherwise, if the player is moving down and the player is at the middle, make the player move to the right.
else if (other.direction == 270) && (other.y > y+16) {

    //With the player
    with (other) {
    
        //Set up the direction
        direction = 0;
        
        //Snap into position
        x = other.x+16;
        y = other.y+16;
    }    
}