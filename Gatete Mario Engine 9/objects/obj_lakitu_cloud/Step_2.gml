/// @description Make Mario move along the cloud if riding

//If Mario does exist
if (instance_exists(obj_mario)) {
    
    if (player_on == true) {
    
        obj_mario.x = x;
        obj_mario.y = y-6;
    }
}

mytop.x = x-8;
mytop.y = y+10;
