/// @description Blow the ball

//If the ball does exist.
if (instance_exists(myball)) {

    //If the ball is above the plant.
    if (myball.y < bbox_top-32) {
    
        //Repeat the process.
        alarm[0] = 1;
        exit;
    }
    
    //Otherwise, make the plant blow the ball.
    else
        ready = true;
}