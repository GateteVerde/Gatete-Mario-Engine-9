/// @description Manage offset

switch (offsetnext) {
	
    case (0): offset = 1; break;
	case (1): offset = 0; break;
	case (2): offset = -1; break;
	case (3): offset = 0; break;
}

//Change offset
alarm[2] = 7;

//Increment next offset
offsetnext++;
if (offsetnext == 4)
    offsetnext = 0;