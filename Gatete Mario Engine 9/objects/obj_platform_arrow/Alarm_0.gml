/// @description Allow creation of new platforms

//Make sure the player is not above it.
if (collision_rectangle(bbox_left, bbox_top-2, bbox_right, bbox_top-2, obj_mario, 0, 0)) {

    alarm[0] = 1;
    exit;
}

//Reset the platform
ready = 0;