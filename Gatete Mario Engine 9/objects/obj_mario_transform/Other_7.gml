/// @description If the animation has ended and no more loops are needed.

if (ready) {

    //Does the animation still loop, if so decrement loop
    if (loop > 0)
        loop--;

    else {
        
        //With the player
        with (obj_mario) {
        
            //Enable gravity
            enable_gravity = true;
            
            //Make visible
            visible = true;
            
            //Set alpha back to 1, but check first if the player is not doing a special action.
            if (instance_exists(obj_mario_puller))
            || (instance_exists(obj_mario_wallrunner))
                image_alpha = 0;
            else
                image_alpha = 1;
        }
        
        //Destroy
        instance_destroy();
    }
}