/// @description Boo movement

//Switch sides
if ((x >= (xstart + 14)) && (xscale == 1)) 
|| ((x <= xstart - 14) && (xscale == -1))
    alarm[0] = 1;

//X Movement
var spd = 0.375;
if xscale = 1 {

    if (hspeed < spd)
        hspeed += spd / 10;
    else 
		hspeed = spd;
    
} 
else {

    if (hspeed > -spd)
        hspeed -= spd / 10;
    else 
		hspeed = -spd;    
}

//Y movement
bounce = sin(time * 0.1) * 2;
time++;