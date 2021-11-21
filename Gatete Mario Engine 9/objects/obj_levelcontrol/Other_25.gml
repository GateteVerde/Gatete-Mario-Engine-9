/// @description Set up object to follow

//If the player does exist
if (instance_exists(obj_mario))
    follow = obj_mario;
    
//Otherwise, if the player exists and he just died
else 
    follow = noone;