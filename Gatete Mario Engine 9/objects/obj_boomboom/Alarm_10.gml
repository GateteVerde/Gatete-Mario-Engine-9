/// @description Move towards the player

//Animate
image_speed = 0.2 * increment;

//Hop if hitpoints are equal to 2
switch (hp) {

    //2 Stomps left
    case (2): {
    
        alarm[1] = 120;
    } break;
}

//Make vulnerable
stomp = 4;
ready = 0;

//Jump
yspeed = -3;
y--;

//Follow Mario
alarm[11] = 60;

//If Mario does not exist or Mario is at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xspeed = (swimming == true) ? -0.5 : -1;
else
	xspeed = (swimming == true) ? 0.5 : 1;