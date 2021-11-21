/// @description Blink

if (image_index == 0) {

    image_index = 1;
    alarm[0] = 10;
}
else {

    image_index = 0;
    alarm[0] = 120+random(round(120));
}