/// @description Player flagpole logic

//Animate Yoshi if riding one
anim += 0.065+abs(xspeed)/7.5;
if (anim > 2.99) {
	
	anim = 0;
}

//When in the physics or countdown state
if (ready >= 2) && (ready < 5) {

    //Prevent physics parent from destroying (Hack)
    if (bbox_top > room_height) {
    
        //If it's moving to the right...
        if (ready = 2) then xspeed = -1
        
        //Stay invisible on the bottom of the view
        y = room_height-32;
        visible = 0;
    }

    //Default event
    event_inherited();

    //If Mario reached a wall or fell out of the room when in the physics state
    if (ready = 2) {
    
        if (xspeed < 0) {

            //Countdown state
            ready = 3;
    
            //Begin countdown state
            event_user(15);
    
            //Stop walking
            xspeed = 0;
        }
        else {
        
            if (ready2 != 1) {
            
                //Set horizontal speed
                xspeed += 0.07;
                if (xspeed > 1.5)
                    xspeed = 1.5;
            }
        }
    }
}

//Animate
event_user(0);

//Enter castle
event_user(1);