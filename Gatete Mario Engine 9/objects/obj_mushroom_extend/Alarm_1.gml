/// @description Boop the mushroom

if (boop < 2) {
	
	//Boop
    boop++;
    alarm[1] = 15;
    
	//Change boop rate
    if (extend == 1)
        boop_change -= 8;
    else
        boop_change += 8;
}