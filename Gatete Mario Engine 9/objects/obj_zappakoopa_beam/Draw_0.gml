/// @description Draw the beam when ready

//Set the blend mode
gpu_set_blendmode(bm_add);
    
//Set the alpha
draw_set_alpha(alpha);

//Set precision
draw_set_circle_precision(64);

//If the parent does exist
if (instance_exists(parent)) {
    
    //If facing right
    if (parent.xscale == 1) {
    
        draw_circle_colour(parent.x+6, parent.y+6, radius, make_colour_rgb(0, 147, 255), make_colour_rgb(0, 147, 255), false);
    }
    
    //Otherwise, if facing left
    else if (parent.xscale == -1) {
    
        draw_circle_colour(parent.x-7, parent.y+6, radius, make_colour_rgb(0, 147, 255), make_colour_rgb(0, 147, 255), false);
    }
}
    
//Reset alpha
draw_set_alpha(1);

//Set the blend mode to normal
gpu_set_blendmode(bm_normal);
