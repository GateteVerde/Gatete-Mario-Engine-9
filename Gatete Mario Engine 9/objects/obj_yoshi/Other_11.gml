/// @description Abandon Yoshi

with (instance_create_depth(x, y, -2, obj_yoshi_abandon)) {

    //Hereby the same colour
    colour = other.colour;

    //If Yoshi was holding an item on his mouth
    if (other.mouthholder != noone) {
    
        image_index = 1;
        alarm[1] = 16;
    }
    
    //Vertical speed
    yspeed = 1;
    
    //Move the player up
    obj_mario.y -= 16;

    //Set the frame
    if (instance_exists(obj_mario)) {
    
        //Hereby horizontal speed
        xspeed = obj_mario.xspeed/2;
    
        //Hereby facing direction
        xscale = obj_mario.xscale;
    }
}

//Destroy
instance_destroy();