// @function follow_which_mario()

function follow_which_mario() {
	
	//If Mario does exist
	if (instance_exists(obj_mario))
	    follow = obj_mario;
	
	//Otherwise, if Mario is warping through a pipe
	else if (instance_exists(obj_mario_warp))
		follow = obj_mario_warp;
    
	//Otherwise, if Mario does not exist anymore
	else 
	    follow = noone;
}