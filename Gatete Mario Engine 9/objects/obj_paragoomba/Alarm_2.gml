/// @description Spawn microgoombas

if (flying > 1)
&& (flying < 3) {

    //Create microgoombas
	instance_create_depth(x, y+8, -6, obj_goomba_micro);
    
    //Repeat
    alarm[2] = 48;
}