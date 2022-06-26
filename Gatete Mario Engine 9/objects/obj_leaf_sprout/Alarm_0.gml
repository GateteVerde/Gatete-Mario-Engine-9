/// @description Set the new action for the leaf.

//If the leaf is about to float to the right.
if (action == "nright") {

    //Set the vertical speed.
    xspeed = 0.5;
    
    //Set the new action.
    action = "right";
}

//Otherwise, if the leaf is about to float to the left.
else {

    //Set the vertical speed.
    xspeed = -0.5;
    
    //Sets a new action.
    action = "left";
}

//Set the vertical speed.
yspeed = 1.75;