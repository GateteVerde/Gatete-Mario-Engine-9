/// @description Finish pull

//If the puller object exists
if (instance_exists(obj_mario_puller)) {

    //With Mario
    with (obj_mario) {
    
        visible = 1;
        holding = 0;
        enable_control = true;
    }
    
    //Destroy puller
    with (obj_mario_puller) instance_destroy();
    
    //Destroy
    instance_destroy();
}