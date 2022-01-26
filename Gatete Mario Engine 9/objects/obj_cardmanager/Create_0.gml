/// @description A game of card matching

//Check if the previous card count exists.
if (!ds_map_exists(global.cardgame, "count")) {

    //Create the game.
    ds_map_add(global.cardgame, "count", 0);
}

//Remember the previous card count.
count = ds_map_find_value(global.cardgame, "count");

//Background animation
anim = 0;

//Wait for input
ready = 0;

//Number of cards flipped in the current pair.
cardcount = 0;

//Number of wrong matches
wrong = 0;

//The image on the last card flipped.
oncard = -1;

//The id of the last card flipped.
lastcard = 0;