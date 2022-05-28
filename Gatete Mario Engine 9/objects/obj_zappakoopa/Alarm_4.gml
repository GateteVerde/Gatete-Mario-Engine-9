/// @description Close the mouth and resume movement

//Animate backwards
if (image_index > 0) {

    //Change frame and repeat if needed
    image_index--;
    alarm[4] = 4;
}
else
    alarm[10] = 2;
