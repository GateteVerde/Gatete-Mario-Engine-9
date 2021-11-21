/// @description Stop all blocks

//Stop back block
if (instance_exists(myback)) {

    with (myback) {
    
        speed = 0;
        move_snap(16, 16);
    }
}

//Stop
speed = 0;

//Snap in position
move_snap(16, 16);