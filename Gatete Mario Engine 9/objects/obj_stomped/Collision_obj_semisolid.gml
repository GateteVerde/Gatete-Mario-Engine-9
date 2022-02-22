/// @description Stop it and then destroy

//Stop movement
if (gravity > 0) {

    //Stop gravity
    gravity = 0;
    
    //Destroy
    alarm[0] = 20;
}

//Move 1 pixel upwards
y--;

//Stop vertical movement
vspeed = 0;