/// @description Make Mario run up walls

//Ignore if Mario does have the following powerups
if (global.powerup == cs_tiny)
|| (global.powerup == cs_frog) 
|| (global.powerup == cs_bell)
|| (global.powerup == cs_mega)
exit;

//If Mario is not riding anything
if (global.mount == 0) {

    //If Mario meets the following conditions
    if (other.state == playerstate.walk)
    && (other.crouch == 0)
    && (other.holding == 0)
    && (other.swimming == 0) {
    
        //If Mario is moving to the right
        if (other.xspeed < (other.xspeedmax-0.5)*-1)
        && (position_meeting(x-8, y-8, obj_solid)) {
			
            with (instance_create_depth(x+16, y-8, -5, obj_wallrunner)) {
				
				angle = 135;
				xscale = -1;
			}
		}
            
        //If Mario is moving to the left
        else if (other.xspeed > other.xspeedmax-0.5)
        && (position_meeting(x+8, y+24, obj_solid))
        && (!position_meeting(x+24, y+24, obj_semisolid)) {
        
            with (instance_create_depth(x+31, y, -5, obj_wallrunner)) {
            
                angle = 315;
                direction = 270;
            }
        }
    }
}