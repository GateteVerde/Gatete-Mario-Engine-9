/// @description Collision with kicked shells

//Deny getting killed
if (collision_rectangle(x+(boxl*sign(xscale)), bbox_top+boxt, x+(boxr*sign(xscale)), bbox_bottom+boxb, other, 0, 0))
    exit;

//Inherit event
with (other) event_inherited();