/// @description Wiggler body logic

//Activate
for (i=1; i < seg; i++) {

    if (!instance_exists(mybody[i]))
        instance_activate_object(mybody[i]);
}

//Platform interaction
var plat = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom+8, obj_platformparent, 0, 0);
if (plat) then bodyadd = plat.x-plat.xprevious; //hspeed

//Set the body position
for (i=1; i < seg; i++) {
		
	mybody[i].x = oldx[i*closeness];
	mybody[i].y = oldy[i*closeness];
}

//Record coordinates for body parts to follow
oldx[0] = x;
oldy[0] = y;
for (i = amount_previous; i > 0; i--) {
	
	oldx[i] = oldx[i-(1*sign(xspeed <> 0))] + bodyadd;
	oldy[i] = oldy[i-(1*sign(xspeed <> 0))];
}
