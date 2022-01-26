/// @description Progress the game

//Return to the world map if there were 2 wrong matches or 18 cards flipped
if ((wrong == 2) || (count == 18))
    end_level();

//Otherwise, wait for user input.
else
    ready = 0;