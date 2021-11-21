/// @description Propeller shroom logic

//If the propeller shroom is sprouting out from the block.
if ((action = "sprout") && (y < ystart-18)) {

    //Slowdown till it stops
    if (vspeed < 0)
        vspeed += 0.0648;
		
	//If about to stop
    else if (vspeed > -0.0648) {
    
        vspeed = 0;
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
        vspeed += 0.0324;
        
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
        
            vspeed -= 0.0324;
            if (timeout == 0)
                readytogo = 3;
        }
        else if (y < tempY)
            vspeed += 0.0324;
    }
    else if (readytogo == 3)
        vspeed -= 0.0324;
}

//Destroy if above the top boundary
if (y < -96)
    instance_destroy();