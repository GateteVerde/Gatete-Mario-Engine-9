/// @description Draw the laser

//Laser Animation
anim += 0.25;

//If the parent does exist
if (instance_exists(parent)) {
    
    //If the parent is facing right
    if (parent.xscale == 1) {
    
        //Draw lightning
        draw_sprite_tiled_area_ext(spr_zappakoopa_lightning, anim, xstart, ystart-8, xstart, ystart-8, xstart+length, ystart+8, c_white, 1);
    
        //Draw lightning end points
        draw_sprite_ext(spr_zappakoopa_lightning_end, image_index, xstart, parent.y+8, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_zappakoopa_lightning_end, image_index, x, parent.y+8, 1, 1, 0, c_white, 1);
    }
        
    //Otherwise, if the parent is facing left
    else if (parent.xscale == -1) {
    
        //Draw lightning 
        draw_sprite_tiled_area_ext(spr_zappakoopa_lightning, anim, xstart, ystart-8, x, ystart-8, xstart, ystart+8, c_white, 1);
    
        //Draw lightning end points
        draw_sprite_ext(spr_zappakoopa_lightning_end, image_index, xstart, parent.y+8, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_zappakoopa_lightning_end, image_index, x, parent.y+8, 1, 1, 0, c_white, 1);
    }
}
