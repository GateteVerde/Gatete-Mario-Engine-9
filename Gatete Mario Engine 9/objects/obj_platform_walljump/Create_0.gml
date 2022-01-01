/// @description Wall Jump Platform

//State
state = "IDLE";

//Speed
spd = 1;
st_spd = spd;

//Origin
xorig = 7;
yorig = 7;

//Steps to take per steps
step = 0;

//Whether the platform jumped from a track
ready = 0;

//Direction
direct = 270;

//Set up direction based on modifier
if (place_meeting(x, y, obj_up)) {

    direct = 90;
    state = "IN_LINE";
}
else if (place_meeting(x, y, obj_down)) {

    direct = 270;
    state = "IN_LINE";
}
else if (place_meeting(x, y, obj_left)) {

    direct = 180;
    state = "IN_LINE";
}
else if (place_meeting(x, y, obj_right)) {

    direct = 0;
    state = "IN_LINE";
}

//Create top
platform = instance_create_depth(x, y + 12, depth, obj_platformparent);
with (platform) {

	sprite_index = spr_platform_walljump;
	visible = true;
	issolid = true;
	image_xscale = other.width;
}

//Create left wall
wall_l = instance_create_depth(platform.bbox_left, y+28, depth, obj_platformparent);
with (wall_l) {

	sprite_index = spr_platform_walljump;
	visible = true;
	issolid = true;
	image_yscale = other.height;
}

//Create right wall
wall_r = instance_create_depth(platform.bbox_right-15, y+28, depth, obj_platformparent);
with (wall_r) {

	sprite_index = spr_platform_walljump;
	visible = true;
	issolid = true;
	image_yscale = other.height;
}