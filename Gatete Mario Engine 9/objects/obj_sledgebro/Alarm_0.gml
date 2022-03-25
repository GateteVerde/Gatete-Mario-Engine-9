/// @description Prepare to jump

//If the sledge bro is on contact with the ground.
if (yadd == 0) {

    //Stop horizontal speed
    prevxspeed = xspeed;
    xspeed = 0;        
    
    //Jump
    alarm[1] = 30;
}

//Otherwise, deny event.
else
    alarm[0] = 1;