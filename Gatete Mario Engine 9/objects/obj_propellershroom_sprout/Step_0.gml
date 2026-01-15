/// @description Propeller shroom logic

//If not frozen
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//If the propeller shroom is sprouting out from the block.
if (action = "sprout") {

    //Slowdown till it stops
	yspeed = lerp(yspeed, 0, 0.1);
		
	//If about to stop
    if (yspeed == 0) {
    
        if (action == "sprout") {
        
            //End ascend
            action = "wait";
            
            //Set temporary y
            tempY = y;
        
            //Start flying
            alarm[0] = 40;
        }
    }
    
    //Set the depth
    depth = -2;
}

//Otherwise, if the leaf is floating to the right.
else if ((action == "left") || (action == "right")) {

    //If the propeller shroom is about to start it's flight
    if (readytogo == 1) {
    
        //Set the vertical speed
        yspeed += 0.0324;
        
        //Go up
        if (y > tempY+24)
            readytogo = 2;
    }

    //If the propeller shroom is not done with it's flight
    else if (readytogo == 2) {
    
        //Decrement timeout
        if (timeout > 0)
            timeout--;
        
        //Move
        if (y > tempY+24) {
        
            yspeed -= 0.0324;
            if (timeout == 0)
                readytogo = 3;
        }
        else if (y < tempY)
            yspeed += 0.0324;
    }
    else if (readytogo == 3)
        yspeed -= 0.0324;
}

//Destroy if above the top boundary
if (y < -96)
    instance_destroy();