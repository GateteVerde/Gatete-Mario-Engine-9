/// @description P-Tooie logic

//Keep the ball activated
instance_activate_object(myball);

//Snap the ball into x position
myball.x = x;

//Update ball distance
dist = bbox_top+16;

//If the ball exists
if (instance_exists(myball)) {
	
	//Do not animate
	image_speed = 0;

    //If the ball is moving down
    if (myball.yspeed > 0)     
        image_index = 0;
        
    //Otherwise, if the ball is moving up
    else if (myball.yspeed < 0)
        image_index = 1;
}
