/// @description Fog logic

//Friction
friction = 0.005;

//Check for Mario
var player = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 1, 0);

//If the player does exist
if (player)
&& (player.jumpstyle > 0) {

    alpha -= 0.05;
    if (alpha < 0.05)
        instance_destroy();
}
else {

    alpha -= 0.0025;
    if (alpha < 0.0025)
        instance_destroy();
}

//Angle
angle -= 1*hspeed;

//Increment scale
scale += 0.02;
if (scale > 1)
    scale = 1;
