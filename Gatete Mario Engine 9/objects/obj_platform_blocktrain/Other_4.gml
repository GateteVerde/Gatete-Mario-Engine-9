/// @description Make it move when a arrow modifier is in place

//Collision with 'Up' modifier
if (place_meeting(x, y, obj_up)) {

    //Create block train
    with (instance_create_depth(xstart, ystart, depth, obj_blocktrain_front)) {

        dir = 90;
        motion_set(90, other.spd);
        length = other.length;
    }
    
    //Destroy
    instance_destroy();
}

//Collision with 'Down' modifier
else if (place_meeting(x, y, obj_down)) {

    //Create block train
    with (instance_create_depth(xstart, ystart, depth, obj_blocktrain_front)) {
    
        dir = 270;
        motion_set(270, other.spd);
        length = other.length;
    }
    
    //Destroy
    instance_destroy();
}

//Collision with 'Left' modifier
else if (place_meeting(x, y, obj_left)) {

    //Create block train
    with (instance_create_depth(xstart, ystart, depth, obj_blocktrain_front)) {
    
        dir = 180;
        motion_set(180, other.spd);
        length = other.length;
    }
    
    //Destroy
    instance_destroy();
}

//Collision with 'Right' modifier
else if (place_meeting(x, y, obj_right)) {

    //Create block train
    with (instance_create_depth(xstart, ystart, depth, obj_blocktrain_front)) {
    
        dir = 0;
        motion_set(0, other.spd);
        length = other.length;
    }
    
    //Destroy
    instance_destroy();  
}