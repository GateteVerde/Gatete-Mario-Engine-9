/// @description Move up, again...

//If the vegetable sprite height is greater than 16, pull slower
if (((sprite_width > 16) && (sprite_height > 16)) || (big)) {

    y -= 3;
    alarm[7] = 10;
}

//Otherwise, pull faster
else {

    y--;
    alarm[7] = 3;
}