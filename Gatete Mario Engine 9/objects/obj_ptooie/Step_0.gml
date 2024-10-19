/// @description P-Tooie logic

//Inherit the parent event
event_inherited();

//Keep the ball activated
instance_activate_object(myball);

//Snap the ball into x position
myball.x = x;

//Update ball distance
dist = bbox_top+16;

//If the ball exists
if (instance_exists(myball)) {

    //If the ball is moving down
    if (myball.yspeed > 0)     
        sprite_index = spr_ptooie;
        
    //Otherwise, if the ball is moving up
    else if (myball.yspeed < 0)
        sprite_index = spr_ptooie_blow;
}