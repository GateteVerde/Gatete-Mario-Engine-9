/// @description Create the appropiate point object based on Mario's height

//1-UP
if (obj_mario_clear.bbox_bottom <= y+23) {

    limit = 27;
    with (instance_create_depth(bbox_right+40, y+144, -6, obj_score_goal)) {
		
        value = -1;
		gold = true;
	}
}

//5000 Points
else if (obj_mario_clear.bbox_bottom <= y+47) {

    limit = 32;
    with (instance_create_depth(bbox_right+40, y+144, -6, obj_score_goal)) 
        value = 5000;
}
    
//2000 points
else if (obj_mario_clear.bbox_bottom <= y+79) {

    limit = 64;
    with (instance_create_depth(bbox_right+40, y+144, -6, obj_score_goal)) 
        value = 2000;
}
    
//800 points
else if (obj_mario_clear.bbox_bottom <= y+103) {

    limit = 88;
    with (instance_create_depth(bbox_right+40, y+144, -6, obj_score_goal)) 
        value = 800;
}
    
//400 points
else if (obj_mario_clear.bbox_bottom <= y+143) {

    limit = 128;
    with (instance_create_depth(bbox_right+40, y+144, -6, obj_score_goal)) 
        value = 400;
}
    
//100 points
else {

    limit = 144;
    with (instance_create_depth(bbox_right+40, y+144, -6, obj_score_goal)) 
        value = 100;
}