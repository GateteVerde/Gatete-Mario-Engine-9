/// @description End animation or revive

//If animating forward
if (image_speed > 0) {
    
    //Stop the animation
    image_speed = 0;
    image_index = 1;
}

//Otherwise, if animating backwards
else if (image_speed < 0) {

    //If this is a pile of drybones
    if (sprite_index == spr_drybones_crumble) {
		
		//Revive this enemy
		with (instance_create_depth(x, y, depth, obj_drybones)) {
		
			xspeed = 0.5 * sign(other.xscale);
			bone = other.bone;
		}
		
		//Destroy
		instance_destroy();
    }
}
