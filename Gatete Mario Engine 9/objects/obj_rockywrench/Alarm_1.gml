/// @description Throw a wrench

//Animate
image_speed = 1;

//Wrench
with (instance_create_depth(x, y+8, -2, obj_plantfire2)) {
	
	//Set the sprite
	sprite_index = spr_rockywrench_wrench;
	
	//Set vertical speed
    yspeed = -1;
	
	//Set horizontal speed
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -1.5;
    else
        xspeed = 1.5;
}