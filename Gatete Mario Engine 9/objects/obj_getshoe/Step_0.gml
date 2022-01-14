/// @description Kuribo Shoe logic

//Inherit event from parent
event_inherited();

//If this is a dossun shoe
if (sprite_index == spr_shoe_dossun) {
    
    //Check for a quicksand pool
    sand = collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_quicksand, 0, 0);
    if (sand)
    && (bbox_bottom < sand.yprevious+8) {
    
        //Stay on semisolid
        y = sand.bbox_top-11;
        
        //Stop vertical speed
        vspeed = 0;
        gravity = 0;
    }
}