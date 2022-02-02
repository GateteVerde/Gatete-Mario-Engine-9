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
		if (other.xspeed > 2.5)
		&& (position_meeting(x+24, y-8, obj_solid))
			with (instance_create_depth(x+1, y-8, -5, obj_wallrunner)) angle = 45;
    }
}