/// @description Blow Mario in the given direction

if (instance_exists(obj_mario)) {

    //If Mario does have the frog or penguin powerup or the P-Switch is active.
    if (((global.powerup == cs_frog) || (global.powerup == cs_penguin)) || (obj_levelcontrol.pswitch_on == true))
    exit;
    
	//Up
    if (direct == "Up") {
    
        //Blow Mario upwards
        if (collision_rectangle(x, bbox_top-80, x+31, bbox_top, obj_mario, 0, 0)) {
        
            if (obj_mario.yspeed > -4)
                obj_mario.yspeed -= 0.5;
        }
    }
	
	//Down
    else if (direct == "Down") {
    
        //Blow Mario downwards
        if (collision_rectangle(x, bbox_bottom, x+31, bbox_bottom+80, obj_mario, 0, 0)) {
        
            if (obj_mario.yspeed < 4)
                obj_mario.yspeed += 0.5;
        }    
    }
	
	//Left
    else if (direct == "Left") {
    
        //Blow Mario to the left
        if (collision_rectangle(bbox_left-80, y, bbox_left, y+31, obj_mario, 0, 0)) {
        
            if (obj_mario.xspeed > -4)
                obj_mario.xspeed -= 0.5;
        }    
    }
	
	//Right
    else if (direct == "Right") {
    
        //Blow Mario to the right
        if (collision_rectangle(bbox_right, y, bbox_right+80, y+31, obj_mario, 0, 0)) {
        
            if (obj_mario.xspeed < 4)
                obj_mario.xspeed += 0.5;
        }    
    }
}