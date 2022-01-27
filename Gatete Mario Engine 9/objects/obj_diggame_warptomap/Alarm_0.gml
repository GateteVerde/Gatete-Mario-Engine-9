/// @description Return to map if the player has not opened the chest

//If the chest exists
if (instance_exists(obj_diggame_chest)) {

    //If the chest has been opened, exit
    if (obj_diggame_chest.ready)
    exit;
    
    //Otherwise, stop minigame sound
    audio_stop_sound(snd_minigame);
    
    //Clear it
    global.clear = 1;
    
    //Return to the map
    end_level();
}