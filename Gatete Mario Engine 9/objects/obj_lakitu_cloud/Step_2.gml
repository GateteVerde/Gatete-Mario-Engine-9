/// @description Make Mario move along the cloud if riding

//If Mario does exist
if (instance_exists(obj_mario)) {
    
    if (player_on == true) {
    
        obj_mario.x = x;
        obj_mario.y = y-6;
    }
}

mytop.x = x-8;
if (player_on == true)
	mytop.y = y+8;
else
	mytop.y = -1000;
