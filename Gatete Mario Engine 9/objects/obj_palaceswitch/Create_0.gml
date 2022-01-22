/// @description Palace Switch

//Do not animate
image_speed = 0;

//Whether the switch is pressed
ready = 0;

//Stay in ground
y++;

//Make solid mask
mysolid = instance_create_layer(x, y+1, "Main", obj_solid);
    mysolid.image_xscale = 2;
    mysolid.image_yscale = 2;