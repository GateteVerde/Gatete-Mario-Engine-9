/// @description Turn into a mechakoopa

//If there's gravity
if (yadd > 0) {

    alarm[1] = 1;
    exit;
}

//Otherwise, return to normal
else {
	
	//Turn into a non-stunned mecha koopa
	instance_create_depth(x, y, -2, returnobj);
    
    //Destroy
    instance_destroy();
}
