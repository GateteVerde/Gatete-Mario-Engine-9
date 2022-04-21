/// @description Hold a torpedo, then launch it.

//If Mario does not exist or it does exists and it's not transforming, deny event
if (!instance_exists(obj_mario)) 
|| (instance_exists(obj_mario_transform)) {

    alarm[0] = 1;
    exit;
}

//Ready to launch
ready = 1;

//Set the facing direction
if (obj_mario.x > x+16)
    gx = 1;
else
    gx = -1;
