/// @description Congratulate the player for pressing a switch!

//Get sprite of current switch
switch (obj_palaceswitch.sprite_index) {

    //Yellow
    case (spr_palaceswitch_y): sw = spr_area_y; break;
    
    //Green
    case (spr_palaceswitch_g): sw = spr_area_g; break;    
    
    //Red
    case (spr_palaceswitch_r): sw = spr_area_r; break;
    
    //Blue
    case (spr_palaceswitch_b): sw = spr_area_b; break;   
}

//Alpha
alpha = 0;