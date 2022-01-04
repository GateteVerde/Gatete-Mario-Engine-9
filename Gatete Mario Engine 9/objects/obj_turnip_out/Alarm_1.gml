/// @description Make the vegetable get drawn at a specified y position

if (drawpiece2 < 2) {

    drawpiece2++;
    alarm[1] = 20;
}
else if (drawpiece2 == 2) {

    y += 8;
    alarm[0] = 1;
}