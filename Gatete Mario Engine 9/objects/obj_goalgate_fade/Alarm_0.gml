/// @description Fade in / out

//Set the alpha of the front goal gate
obj_goalgate_front.alpha = image_alpha;

//Repeat the process
alarm[0] = 1;

//Fade in
if (fade == 0) {

    //Fade the screen black
    image_alpha += 0.00625;
    if (image_alpha > 1) {
    
        image_alpha = 1;
        fade = 1;
    }
    
    //Fade tides if it exists
    if (instance_exists(obj_water_foreground))
        with (obj_water_foreground) alpha -= 0.00625;
}

//Fade out
else if (fade == 2) {

    //Unfade the screen
    image_alpha -= 0.0125;
    if (image_alpha < 0) {
    
        image_alpha = 0;
    }
    
    //Unfade tides
    if (instance_exists(obj_water_foreground))
        with (obj_water_foreground) alpha += 0.0125;
}