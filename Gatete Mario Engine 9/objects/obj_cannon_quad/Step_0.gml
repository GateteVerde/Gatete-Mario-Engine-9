/// @description Manage cannon angle

//If the cannon can set the angle
if (ready == 1) {

    //Set angle
    angle += 1.5;
    
    //Shoot when angle reaches target
    if (angle > angle_tgt) {
    
        //Set angle
        angle = angle_tgt;
        
        //Stop cannon
        ready = 0;
        alarm[0] = 90;
        
        //Reset angle if needed
        if (angle > 359) {
        
            angle_tgt -= 360;
            angle -= 360;
        }
    }
}