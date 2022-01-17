/// @description If a key makes contact with this door...

//If the door is locked
if (lock == 1)
&& (other.held == true) {

    //Play 'Chest' sound
    audio_play_sound(snd_chest, 0, false);
    
    //Set the sprite
    sprite_index = spr_door_lock_unlocked;

    //Unlock the door
    lock = 0;
    
    //With the key
    with (other) {
    
        //Play 'Bump' sound
        audio_play_sound(snd_bump, 0, false);
        
        //Create a puff of smoke
        instance_create_depth(x, y+8, -4, obj_smoke);
        
        //Destroy
        instance_destroy();
    }
    
    //Create a puff of smoke
    instance_create_depth(x+8, y, -4, obj_smoke);
    
    //Remember it
    ds_map_add(global.doors, id, 1);
}