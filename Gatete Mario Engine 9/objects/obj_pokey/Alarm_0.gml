/// @description Manage offset

//If there's memory of a pokey below
if (instance_exists(mebelow)) {

    offsetxscale = -mebelow.offsetxscale
}

switch (offsetnext) {
    case (0): {
        offset = offsetxscale;
    } break;
    case (1): {
        offset = 0;
    } break;
    case (2): {
        offset = -offsetxscale;
    } break;
    case (3): {
        offset = 0;
    } break;
}

//Change offset again
alarm[0] = 10;

//Increment next offset
offsetnext++;
if (offsetnext == 4)
    offsetnext = 0;
    

