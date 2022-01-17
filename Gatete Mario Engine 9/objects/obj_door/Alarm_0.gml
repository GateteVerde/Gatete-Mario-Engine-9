/// @description Unlock if this door was opened before

if (lock == 1) 
&& (ds_map_exists(global.doors, id)) {

    lock = 0;
    sprite_index = spr_door_lock_unlocked;
}
