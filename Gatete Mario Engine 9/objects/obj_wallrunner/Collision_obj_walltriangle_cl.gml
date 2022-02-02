/// @description Make the player turn

//If the player can turn
if (ready) {

    //If the player is facing right and it's moving up
    if ((xscale > 0) && (direction == 180)) {

        //Snap onto the triangle
        x = other.xstart+15;
        y = other.ystart+15;

        //Direction
        direction = 270;

        //Disallow turn
        ready = false;

        //Angle
        angle = 225;

        //Set angle
        alarm[0] = 4;

        //Allow turning
        alarm[1] = 24;     
    }

    //Otherwise, if the player is facing left and it's moving to the right.
    else if ((xscale < 0) && (direction == 90)) {

        //Snap onto the triangle
        x = other.xstart+15;
        y = other.ystart+15;

        //Direction
        direction = 0;

        //Disallow turn
        ready = false;

        //Angle
        angle = 315;

        //Set angle
        alarm[0] = 4;

        //Allow turning
        alarm[1] = 24;     
    }
} 