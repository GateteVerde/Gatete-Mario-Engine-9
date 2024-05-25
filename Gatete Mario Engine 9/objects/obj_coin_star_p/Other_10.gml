/// @description Play a sound depending of how many coins you got in the level

//Play 'Scatter 2' sound if two coins were collected on the level
if ((ds_map_find_value(global.sc[0], global.level) > 0) && (ds_map_find_value(global.sc[1], global.level) > 0)) 
|| ((ds_map_find_value(global.sc[0], global.level) > 0) && (ds_map_find_value(global.sc[2], global.level) > 0)) 
|| ((ds_map_find_value(global.sc[1], global.level) > 0) && (ds_map_find_value(global.sc[2], global.level) > 0)) {

    if (sprite_index != spr_coin_star_get) {
    
        audio_play_sound(snd_coin_all, 0, false);
        audio_play_sound(snd_coin_big, 0, false);
    }
    else
        audio_play_sound(snd_coin_big, 0, false);
}

//Otherwise, play default sound
else
    audio_play_sound(snd_coin_big, 0, false);