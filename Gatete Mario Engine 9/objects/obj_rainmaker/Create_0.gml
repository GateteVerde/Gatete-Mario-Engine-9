/// @description Rain generator

/*
//  This object uses creation code
//
//      lightning   = Create lightning effect?
//      smog        = Show smog? (1 for clouds, 2 for smog)
//      raining     = Make rain? Used for when you only want smog/lightning
//      force       = Rain strength (Only if raining is set to 1)
*/

//Default values
lightning = 1;
smog = 2;
force = 5;
raining = true;

//Smog pos
pos = 0;

//Alpha
alpha = 1;

//Depth
depth = -7;

//Create lightning
alarm[0] = 100;

//Delay raining sound
alarm[1] = 1;