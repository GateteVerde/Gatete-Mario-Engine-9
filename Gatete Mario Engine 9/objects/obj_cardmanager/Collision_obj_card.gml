/// @description Flip cards

//If shift is pressed when the game is accepting input and the card is not flipped
if (other.sprite_index = spr_cardgame_flip) 
&& (ready = 0) 
&& (input_check_pressed(input.action_0)) {

    //Disable input
    ready = 1;

    //Play 'Card' sound
    audio_play_sound(snd_card, 0, false);

    //Make the card start flipping
    other.image_speed = 1;
}