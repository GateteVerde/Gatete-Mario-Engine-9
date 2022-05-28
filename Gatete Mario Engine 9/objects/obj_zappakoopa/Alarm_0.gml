/// @description Stop and open the mouth

//If there's no gravity
if (yadd == 0) {
    
	//Set the sprite
    sprite_index = spr_zappakoopa_charge;
	
	//Do not animate
    image_speed = 0;
    image_index = 0;
	
	//Stop moving
    xspeed = 0;
	
	//Open the mouth
    alarm[1] = 30;
	
	//Stop following Mario
	alarm[11] = -1;
}
else 
    alarm[1] = 1;
