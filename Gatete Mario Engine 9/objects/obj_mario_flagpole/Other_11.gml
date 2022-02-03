/// @description Enter castle

if (instance_exists(obj_castle)) {

    //Do the victory pose
    if (ready2 == 0) 
    && (x > obj_castle.x) {
    
        //Snap in castle door
        x = obj_castle.x;
    
        //Stop in the door
        ready2 = 1;
        
        //Stop moving
        xspeed = 0;
        
        //Move again after a while
        alarm[3] = 30;
    }    
    else if (x > obj_castle.x+8) {
    
        //Set up in-door state
        if (ready == 2)
            ready = 4;

        //If the object is in-door state, make him enter
        else if ((ready == 4) && (x > obj_castle.x+32)) {
        
            //Snap to the castle's door
            x = obj_castle.x+32;
            
            //Inside castle state
            ready = 5;
            
            //Stop moving
            xspeed = 0;
            
            //Begin countdown state
            event_user(15);
        }
    }
}