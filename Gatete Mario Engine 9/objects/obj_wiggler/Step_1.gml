/// @description Wiggler body logic

//Activate
for (i=1; i < seg; i++) {

    if (!instance_exists(mybody[i]))
        instance_activate_object(mybody[i]);
}

//If the wiggler is moving
if (xspeed != 0) {

	//Set the body position
	for (i=1; i < seg; i++) {
		
		mybody[i].x = oldx[i*closeness];
		mybody[i].y = oldy[i*closeness];
	}

	//Record coordinates for body parts to follow
	oldx[0] = x;
	oldy[0] = y;
	for (i = amount_previous; i > 0; i--) {
	
		oldx[i] = oldx[i-0.001];
		oldy[i] = oldy[i-0.001];
	}
}
