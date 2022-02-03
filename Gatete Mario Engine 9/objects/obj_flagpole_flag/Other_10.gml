/// @description Make flag vanish

//Go poof
visible = 0;

//Create smoke effect
with (instance_create_depth(x, y, depth, obj_flagpole_flag_vanish))
    image_index = other.image_index;