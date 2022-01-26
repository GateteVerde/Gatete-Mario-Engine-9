/// @description Move the cursor

//If the game is waiting for input
if (!ready) {

    //If up is pressed not on the top row.
    if (((input_check_pressed(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) && (y != 160)) {
    
        //Move to the card above
        y -= 40;
        
        //Play 'Move' sound
        audio_play_sound(snd_move, 0, false);
    }

    //If down is press not on the bottom row.
    if (((input_check_pressed(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) && (y != 240)) {
    
        //Move to the card below
        y += 40;
        
        //Play 'Move' sound
        audio_play_sound(snd_move, 0, false);
    }

    //If left is pressed not on the left row
    if (((input_check_pressed(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (x != 120)) {

        //Move to the card to the left
        x -= 32;

        //Play 'Move' sound
        audio_play_sound(snd_move,0,0);
    }

    //If right is pressed not on the right row
    if (((input_check_pressed(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (x != 280)) {

        //Move to the card to the right
        x += 32;

        //Play 'Move' sound
        audio_play_sound(snd_move,0,0);
    }
}