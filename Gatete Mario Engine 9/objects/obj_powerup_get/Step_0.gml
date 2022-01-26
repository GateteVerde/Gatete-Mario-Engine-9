/// @description Chest item logic

//If the vertical speed is equal to 0 and it's not ready yet
if (vspeed == 0) && (ready == 0) {

    //Play 'Chest Item Get' sound
    audio_play_sound(snd_chest_item_get, 0, false);
    
    //Ready
    ready = 1;    
    
    //Add the item to the inventory
    alarm[0] = 120;
    
    //Make it invisible
    alarm[1] = 1;
}