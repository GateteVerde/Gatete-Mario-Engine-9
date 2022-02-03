/// @description A secret flagpole, clear the level with this

//Do not animate
image_speed = 0;
image_index = 1;

//Create flag
flag = instance_create_depth(x+8, y+27, depth-1, obj_flagpole_flag);
with (flag)
    image_index = 1;