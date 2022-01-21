/// @description Path opener logic

//Update steps
step += spd;
while (step >= 1) {

    //Travel through paths
    if (collision_point(x+xorig+cos(degtorad(direct)), y+yorig-sin(degtorad(direct)), obj_pathparent, 1, 0)) {
    
        x += cos(degtorad(direct));
        y += -sin(degtorad(direct));
    }
    else if (collision_point(x+xorig+cos(degtorad(direct))-sin(degtorad(direct)), y+yorig-sin(degtorad(direct))-cos(degtorad(direct)), obj_pathparent, 1, 0)) {
    
        x += cos(degtorad(direct))-sin(degtorad(direct));
        y += -sin(degtorad(direct))-cos(degtorad(direct));
    }
    else if (collision_point(x+xorig+cos(degtorad(direct))+sin(degtorad(direct)), y+yorig-sin(degtorad(direct))+cos(degtorad(direct)), obj_pathparent, 1, 0)) {
    
        x += cos(degtorad(direct))+sin(degtorad(direct));
        y += -sin(degtorad(direct))+cos(degtorad(direct));
    }
    else if (collision_point(x+xorig-sin(degtorad(direct)), y+yorig-cos(degtorad(direct)), obj_pathparent, 1, 0)) {
    
        x += -sin(degtorad(direct));
        y += -cos(degtorad(direct));
        direct += 90;
    }
    else if (collision_point(x+xorig+sin(degtorad(direct)), y+yorig+cos(degtorad(direct)), obj_pathparent, 1, 0)) {
    
        x += sin(degtorad(direct));
        y += cos(degtorad(direct));
        direct -= 90;
    }
    else 
        direct += 180;
    
    //Reset angles
    if (direct < 0) then direct += 360;
    if (direct >= 360) then direct -= 360;
    
    //Stop when inside a node
    node = collision_point(x+xorig, y+yorig, obj_node, 0, 0);
    
    //If there's a node
    if (node) {
    
        //If the player is at the center of the node
        if (x+xorig == node.x+7)
        && (y+yorig == node.y+7) {
			
			//If this node opens multiple paths
			if (node.object_index == obj_node_multi) {
				
				//Make that node open adyacent paths
				with (node) {
					
					event_user(15);
				}
				
				//Destroy opener
				instance_destroy();
			}
			
			//Otherwise
			else {
			
				//Stop 'Path Reveal' sound
				audio_stop_sound(snd_pathreveal);
			
				//Play 'Path Reveal End' sound
				audio_play_sound(snd_pathreveal_end, 0, false);
        
	            //Destroy
	            instance_destroy();
			}
        }
    }
    
    //Update step
    step--;
}