/// @description Update solid position

if (s_ready == 1) {

    if (ready == 1)
        mysolid.y += 2;
    else
        mysolid.y -= 2;
}
else
    mysolid.y = ystart+4;