/// @description Jump

//If there's no gravity
if (yadd == 0) && (jumping == 0) {

    //Stop animation
    image_speed = 0;
    image_index = 0;
    
    //Hop
    yspeed = -2;
    y--;
	
	//Do jump
	jumping = 1;
}
else
    alarm[0] = 1;
