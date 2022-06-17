/// @description Make Mario move along the cloud if riding

//If Mario does exist
if (instance_exists(obj_mario)) {
    
    if (player_on == true) {
    
        obj_mario.x = x;
		if (sprite_index == spr_lakitu_cloud)
			obj_mario.y = y-6;
		else
			obj_mario.y = y;
    }
}

mytop.x = x-8;
if (player_on == true) {
	
	if (sprite_index == spr_lakitu_cloud)
		mytop.y = y+8;
	else
		mytop.y = y+16;
}
else
	mytop.y = -1000;
