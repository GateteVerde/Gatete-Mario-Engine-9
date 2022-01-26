/// @description Remember the state of the game.

//Stop 'Minigame' music
audio_stop_sound(snd_minigame);

//Clear level
global.clear = 1;

//Clear the state of the game if all cards were flipped
if (count == 18) {

    //Clear all cards
    ds_map_clear(global.cardgame);
    
    //Get a new card pattern
    global.cardpattern++;
    if (global.cardpattern > 8)
        global.cardpattern = 1;
}

//Otherwise
else {

    //Remember the number of cards flipped
    if (ds_map_exists(global.cardgame, "count")) {
    
        ds_map_replace(global.cardgame, "count", count);
    }
    else
        ds_map_add(global.cardgame, "count", count)

    //For all cards
    with (obj_card) {

        //Remember cards that are flipped
        if (sprite_index = spr_cardgame_cards) {
        
            if (ds_map_exists(global.cardgame, string(id))) {
            
                ds_map_replace(global.cardgame, string(id), 1);
            }
            else
                ds_map_add(global.cardgame, string(id), 1);
        }
    }
}