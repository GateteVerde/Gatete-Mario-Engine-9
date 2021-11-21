/// @description Activate the coins

//If the ring has not been activated.
if (sprite_index != spr_coin_red_ring_active) {

    //Play 'Ring' and 'Timer' sound
    audio_play_sound(snd_ring, 0, false);
    audio_play_sound(snd_timer, 0, true);
    
    //Restart red coins
    global.coins_red = 0;

    //Make the coins visible            
    with (obj_coin_red) {
    
        //Check if the ring id's match
        if (ring_id == other.ring_id)        
            visible = true;    
    }
    
    //Countdown
    alarm[0] = 720;
    
    //Destroy all not collected coins
    alarm[1] = 900;
    
    //Change the sprite
    sprite_index = spr_coin_red_ring_active;
    image_index = 0;
    
    //Prevent the coins from re-appearing
    ds_map_add(global.redrings, id, 1);
}