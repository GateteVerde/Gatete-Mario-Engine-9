/// @description Destroy when in contact with a solid or when there's no water above

if (!place_meeting(x, y, obj_swim))
|| (place_meeting(x, y-1, obj_solid))
    instance_destroy();