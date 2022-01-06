/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_puller)) {
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x - 8, y + 16, -4, obj_turnip_out)) {
    
        sprite_index = spr_powblock_red_large_up;
        myveggie = obj_powblock_red_large_up;
    }
    
    //Destroy
    instance_destroy();
}