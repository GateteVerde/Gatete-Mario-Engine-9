/// @description Twister logic

//Inherit event from parent
event_inherited();

//Push Mario upwards
if (instance_exists(obj_mario)) {

    //If Mario is above this twister
    if (collision_rectangle(x-16, bbox_bottom-112, x+16, bbox_bottom, obj_mario, 0, 0)) {
    
        //With Mario
        with (obj_mario) {
        
            //Force set 'Jump' state
            state = playerstate.jump;
            
            //Do not allow jump
            jumping = 2;
            
            //Set vertical speed
            yspeed -= 0.5;
            if (yspeed < -4.5)            
                yspeed = -4.5;     
        }
    }
}
