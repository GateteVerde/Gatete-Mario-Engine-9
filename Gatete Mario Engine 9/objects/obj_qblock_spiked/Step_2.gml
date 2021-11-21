/// @description Handles the block's angling.
 
//Make the block turn when needed to
if ((turn == 1) && (angle < 180))
|| ((turn == 2) && (angle < 360)) {

    //Rotate the block by 15 degrees
    angle += turn_speed;
}
    
//Reset the angle if it's past 360
if (angle >= 360) {

    //Reset the angle
    angle = 0;
    
    //Reset the turning state
    turn = 0;
}