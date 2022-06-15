/// @description Follow through rooms

//If the enemy was active on the last room
if (persistent) {

    //Do not remember it
    persistent = false;
    
    //Follow
    ready = 2;
    
    //Start at the top-left corner
    alarm[0] = 2;
}