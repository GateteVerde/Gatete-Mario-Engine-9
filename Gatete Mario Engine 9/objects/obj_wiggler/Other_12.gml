/// @description Enemy turn script

//Collision with regular enemies
var overlap = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom-4, obj_enemyparent, 0, 1);

//If there's an enemy and this one is not invulnerable
if (overlap)
&& (overlap.vulnerable < 99) 
&& (overlap.object_index != obj_wiggler_body) {

    //Go right if the object is further to the right or in the same spot and a higher id.
    if ((bbox_left + bbox_right) * 0.5 > (overlap.bbox_left + overlap.bbox_right) * 0.5)
    || (((bbox_left + bbox_right) * 0.5 = (overlap.bbox_left + overlap.bbox_right) * 0.5) && (id > overlap.id)) {
    
        //Keep going right.
        xspeed = abs(xspeed);
    }
    
    //Otherwise, go left.
    else
        xspeed = -abs(xspeed);
}
