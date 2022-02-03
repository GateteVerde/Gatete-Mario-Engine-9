/// @description Create the appropiate point object based on Mario's height

//1-UP
if (obj_mario_clear.ystart+16 <= y+35) {

    limit = 27;
    with (instance_create_depth(bbox_right+24, y+144, -6, obj_score_goal)) 
        value = -1;
}
    
//4000 points
else if (obj_mario_clear.ystart+16 <= y+80) {

    limit = 45;
    with (instance_create_depth(bbox_right+24, y+144, -6, obj_score_goal)) 
        value = 4000;
}
    
//1000 points
else if (obj_mario_clear.ystart+16 <= y+104) {

    limit = 91
    with (instance_create_depth(bbox_right+24, y+144, -6, obj_score_goal)) 
        value = 1000;
}
    
//400 points
else if (obj_mario_clear.ystart+16 <= y+144) {

    limit = 115;
    with (instance_create_depth(bbox_right+24, y+144, -6, obj_score_goal)) 
        value = 400;
}
    
//100 points
else {

    limit = 144;
    with (instance_create_depth(bbox_right+24, y+144, -6, obj_score_goal)) 
        value = 100;
}