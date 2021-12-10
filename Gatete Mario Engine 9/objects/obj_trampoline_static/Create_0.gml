///@description Trampoline (Static)

//Do not animate
image_speed = 0;
image_index = 0;

//Whether the player is on the trampoline
ready = 0;
s_ready = 0;

//Make it solid
mysolid = instance_create_layer(x, y+4, "Main", obj_solid);
with (mysolid)
    image_yscale = 2;