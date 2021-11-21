/// @description Cycle between powerups

//Continue the cycle.
if (ready == 0) {

    //Repeat this process
    alarm[2] = 15;
    
    //Increment cycle
    numb++;
}

//Reset sequence
if (numb == array_length(sprout)) 
    numb = 0;