/// @description Make the chomp retreat

//Retreat
retreat = 1;

//Do not lunge
lunge = 0

//Do not stay idle
idle = 0

//Find start position
start = instance_position(originx, originy, obj_chainchomp)
with (start) {
	
    taunt = false;
}

//Set the turning positions
if (originx <= x) {

    xspeed = -1;
    stopleft = originx-20;
}
else if (originx >= x) {

    xspeed = 1;
    stopright = originx+20;
}