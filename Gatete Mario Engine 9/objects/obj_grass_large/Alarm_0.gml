/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x-8, y+8, -4, obj_turnip_out)) {
    
        sprite_index = spr_turnip_large;
        myveggie = obj_turnip_large;
    }
    
    //Destroy
    instance_destroy();
}