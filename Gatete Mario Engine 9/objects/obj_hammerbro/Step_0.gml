/// @description Hammer Bro logic

//If not jumping through solids
if (throughsolid == 0) {
	
	//Inherit the parent event
	event_inherited();
	
	//Turn around
	if ((xspeed > 0) && (x > xstart+16))
	|| ((xspeed < 0) && (x < xstart-16))
		xspeed = -xspeed;
}

//Otherwise, if jumping through solids
else {
	
	//Manage pseudo movement variables
	if (freeze == false) {
	
		y += yspeed;
		yspeed += yadd;
	}

    //Gravity
    yadd = 0.25;

    //Cap vertical speed
    if (yspeed > 4) {
    
        yspeed = 4;
        yadd = 0;
    }
}

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;

//If the Silver P-Switch is active and the enemy is inside the view and can turn into a silver coin
if (obj_levelcontrol.gswitch_on == true) 
&& (turn_silver == true)
&& (outside_view() == false)
	exit;