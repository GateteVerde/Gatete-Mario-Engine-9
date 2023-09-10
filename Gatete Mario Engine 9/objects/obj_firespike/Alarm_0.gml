/// @description Pick a ball

//If Mario does not exist or is nearby
if (!instance_exists(obj_mario))
|| (yadd > 0)
|| (freeze == true)
|| (myball != noone)
|| ((obj_mario.x > x-32) && (obj_mario.x < x+32)) {

    alarm[0] = 1;
    exit;
}

//Set the throwing sprite
sprite_index = spr_firespike_throw;

//Animate
image_speed = 1;
image_index = 0;

//Stop
xspeed = 0;