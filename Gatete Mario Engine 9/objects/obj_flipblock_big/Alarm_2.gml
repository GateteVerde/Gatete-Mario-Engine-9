/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y+8, -4, obj_turnip_out)) {
    
        sprite_index = spr_flipblock_big_held;
		image_speed = 0;
		image_index = 0;
        myveggie = obj_flipblock_big_held;
    }
    
    //Destroy
    instance_destroy();
}