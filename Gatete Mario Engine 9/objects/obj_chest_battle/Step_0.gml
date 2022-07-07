/// @description Prize chest logic

if (ready == 0) {

    //Check if there's enemies alive.
    if (instance_number(obj_enemyparent) == 0) {
    
        //Stop the timer
        obj_levelcontrol.alarm[2] = -1;
    
        //Make the chest appear
        alarm[0] = 120;
        
        //Chest appeared
        ready = 1;
    }
}