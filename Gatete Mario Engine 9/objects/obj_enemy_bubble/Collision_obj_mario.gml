/// @description Pop the bubble

//Stop movement of the player if not sliding
with (other) {

    if (sliding == 0) {
    
        xspeed = 0;
        yspeed = 0;
    }
}

//Destroy
alarm[1] = 1;