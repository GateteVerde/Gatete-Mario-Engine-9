/// @description Collision with kicked shells

//Deny getting killed
if (collision_rectangle(x + 8 * sign(xscale), bbox_top, x + 8 * sign(xscale), bbox_bottom, other, 0, 0))
    exit;

//Inherit event
with (other) event_inherited();