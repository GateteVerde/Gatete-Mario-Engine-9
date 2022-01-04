/// @description Make Mario interact with the item

if (can_carry()) {

    //Force Mario to hold
    with (obj_mario) {
    
        holding = 1;
        visible = 0;
    }
    
    //Create puller
    instance_create_depth(other.x, other.y, -5, obj_puller);
    
    //If the puller object exist
    if (instance_exists(obj_puller)) {
    
        //Play 'Pickup' sound
        audio_play_sound(snd_pickup, 0, false);
        
        //Create vegetable
        with (instance_create_depth(obj_mario.x-8, y+8, -4, obj_turnip_out)) {
        
            sprite_index = spr_turnip_small;
            myveggie = obj_turnip_small;
        }
        
        //Destroy
        instance_destroy();
    }
}