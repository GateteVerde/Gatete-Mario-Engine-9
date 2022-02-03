/// @description Leave trail

alarm[0] = 1;
if (speed > 0.5) {

    trail = instance_create_depth(x, y, depth+1, obj_sparkle);
    with (trail) {
		
		//Set the sprite
		sprite_index = spr_firework;
		image_index = other.image_index + 1;
        shrink_rate = 0.05;
        motion_set(random(other.direction*-1-random_range(22.5,-22.5)), other.speed/2);
    }
}