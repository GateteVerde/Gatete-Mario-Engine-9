/// @description Flip all opened cards and fade out

//For all cards
with (obj_card) {

    //If the card was flipped in a previous game
    if (ds_map_exists(global.cardgame, string(id))) {

        //Flip the card
        sprite_index = spr_cardgame_cards

        //Choose the correct card image
        image_index = mycard;
    }
}

//Fade out
instance_create_depth(0, 0, -99, obj_fade_out);