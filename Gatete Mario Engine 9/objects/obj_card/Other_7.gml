/// @description Finish flipping the card

//Switch to the card sprite
sprite_index = spr_cardgame_cards;

//Do not animate
image_speed = 0;

//Pick the appropriate card
image_index = mycard;

//If this is the first card picked for a pair
if (obj_cardmanager.cardcount = 0) {

    //Let the card manager remember that
    obj_cardmanager.cardcount = 1;

    //Make the card manager remember this card's info
    obj_cardmanager.oncard = mycard;
    obj_cardmanager.lastcard = id;

    //Let the game progress
    obj_cardmanager.alarm[0] = 10;
}

//If this is the second card in a pair
else {

    //Reset the count
    obj_cardmanager.cardcount = 0;

    //Check the pair
    alarm[0] = 20;
}