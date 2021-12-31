/// @description Go right

//If the object is not inside the view, deny event
if (outside_view() == true) {

    alarm[0] = 1;
    exit;
}

//Set the horizontal speed
hspeed = 1;

//Stop it
alarm[1] = 32;