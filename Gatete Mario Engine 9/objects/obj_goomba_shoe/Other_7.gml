/// @description Prepare to jump towards the player

if (ready == 1) {

    //Prepare to jump again.
    ready = 0;
    
    //Do not animate
    image_speed = 0;
    image_index = 1;
    
    //Jump towards Mario
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        alarm[0] = 10;
    else
        alarm[1] = 10;
}