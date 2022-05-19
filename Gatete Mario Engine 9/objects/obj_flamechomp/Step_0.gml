/// @description Flame Chomp logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Update fireballs animation
anim += 0.2;

//If the object is not spitting a fireball
if (!ready) {

    //If the player does exist
    if (instance_exists(obj_mario)) {
    
		#region MOVEMENT
		
	        //If Mario is at the right
	        if (obj_mario.x > x)
	            xspeed = min(xspeed + 0.0324, 1);

			//Otherwise, if Mario is at the left
	        else if (obj_mario.x < x)
				xspeed = max(-1, xspeed - 0.0324);
        
	        //If Mario is below
	        if (obj_mario.y > y-8)
				yspeed = min(yspeed + 0.0324, 1);
			
			//Otherwise, if Mario is above
			else if (obj_mario.y < y+8)
				yspeed = max(-1, yspeed - 0.0324);
		#endregion
		
		//Face towards Mario
		if (obj_mario.x > x)
			xscale = 1;
		else if (obj_mario.x < x)
			xscale = -1;
    }
}

//Otherwise, if it's spitting a fireball.
else if (ready) {

    //Stop movement
    xspeed = 0;
	yspeed = 0;
    
    //Exit
    exit;
}

//Manage fireball positions.
oldx[0] = x;
oldy[0] = y;
for (i=amount_previous; i>0; i-=1) {

    oldx[i] = oldx[i-1]
    oldy[i] = oldy[i-1]
}
