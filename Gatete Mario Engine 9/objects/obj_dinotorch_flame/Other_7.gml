/// @description Change sprite

//If blowing fire
if (image_speed == 1)
&& (sprite_index == spr_dinotorch_flame_st)
    sprite_index = spr_dinotorch_flame;
    
//Otherwise, if ending blow
else if (image_speed == -1) {

    //Make the parent move
    if (!instance_exists(parent))
        alarm[1] = 1;
        
    else {
    
        //Make the dino torch move
        with (parent) alarm[10] = 30;
        
        //Destroy
        instance_destroy();
    }
}