/// @description Destroy when outside the room

if ((x < -32) && (hspeed < 0))
|| ((y < -32) && (vspeed < 0))
|| ((x > room_width) && (hspeed > 0))
|| ((y > room_height) && (vspeed > 0))
    instance_destroy();