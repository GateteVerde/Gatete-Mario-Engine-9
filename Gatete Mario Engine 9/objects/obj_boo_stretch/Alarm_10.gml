/// @description Change frame and move

//Start moving
if (image_index > 3) {

    //Set the moving frame
    image_index = 4;
    
    //Start moving
    alarm[0] = 2;
}

//Otherwise, change frame
else {

    image_index++;
    alarm[10] = 7;
}
