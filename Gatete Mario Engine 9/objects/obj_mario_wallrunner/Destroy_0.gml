/// @description Prepare Mario to stop wallrunning

//If Mario exists
if (instance_exists(obj_mario)) {

    //Make him visible and enable controls
    with (obj_mario) {
		
        visible = 1;
        enable_control = 1;
    }

    //If Mario is running up, use the regular direction
    if (direction == 90)
        obj_mario.xscale = direct;

    //Otherwise, reverse his facing direction
    else
        obj_mario.xscale = -direct;
}