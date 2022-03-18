/// @description Kamikaze Shell Logic

//Previous xspeed
prevxspeed = xspeed;

//Inherit the parent event
event_inherited();

//If the direction changed, speed up
if (xspeed != prevxspeed) {

	//Play 'Bump' sound
	audio_play_sound(snd_bump, 0, false);

	//Set horizontal speed
    xspeed = sign(xspeed)*2;
	
	//Create shell thump
	with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) 
		bump = true;
}
	
//If there's no yadd
if (yadd == 0) {
            
    //Follow Mario
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x) {
            
        xspeed -= 0.1;
        if (xspeed < -2)
            xspeed = -2;
    }
    else {
            
        xspeed += 0.1;
        if (xspeed > 2)
            xspeed = 2;
    }
}

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;