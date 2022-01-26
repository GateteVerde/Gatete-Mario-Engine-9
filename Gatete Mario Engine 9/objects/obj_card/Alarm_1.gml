/// @description Flip the card back

//If the sprite is not the flip sprite
if (sprite_index == spr_cardgame_cards) {

    //Switch to the flip sprite
    sprite_index = spr_cardgame_flip;

    //Flip to the last frame in the animation
    image_index = 5;

    //Continue the animation
    alarm[1] = 4;
}

//If the card is not done being flipped
else if (image_index > 0) {

    //Decrement the frame
    image_index -= 1;

    //Continue the animation
    alarm[1] = 4;
}