/// @description SMW Goal Gate

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = 150;

//Create tape
instance_create_layer(x, y+144, "Main", obj_goalgate_tape);

//Create right part
with (instance_create_depth(x+32, y, -6, obj_goalgate_front))
    sprite_index = other.sprite_index;