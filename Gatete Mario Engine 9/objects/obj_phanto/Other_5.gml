/// @description If the key has been brought to another room, remember it

//If the key does exist and it's held up, follow the player through rooms.
if (instance_exists(obj_pullkey_up))
&& (obj_pullkey_up.held)
    persistent = 1;