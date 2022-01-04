/// @description Puller logic

//Make sure Mario exists
if (instance_exists(obj_mario)) {

    //Make sure to deny gravity
    with (obj_mario) {
    
        yspeed = 0;
        yadd = 0;
    }
    
    //Make Mario invisible
    obj_mario.visible = 0;
    
    //Snap in player's position
    x = round(obj_mario.x);
    y = round(obj_mario.y);
}