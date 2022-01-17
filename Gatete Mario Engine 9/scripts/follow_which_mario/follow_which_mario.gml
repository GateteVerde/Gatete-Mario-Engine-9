// @function follow_which_mario()

function follow_which_mario() {
	
	//If Mario does exist
	if (instance_exists(obj_mario))
	    follow = obj_mario;
	
	//Otherwise, if Mario is using a pipe
	else if (instance_exists(obj_mario_warp))
		follow = obj_mario_warp;
		
	//Otherwise, if Mario is using a door
	else if (instance_exists(obj_mario_door))
		follow = obj_mario_door;
		
	//Otherwise, if Mario is jumping
	else if (instance_exists(obj_mario_jump))
		follow = obj_mario_jump;
		
	//Otherwise, if Mario is using a warp note block
	else if (instance_exists(obj_mario_jump_note))
		follow = obj_mario_jump_note;
    
	//Otherwise, if Mario does not exist anymore
	else 
	    follow = noone;
}