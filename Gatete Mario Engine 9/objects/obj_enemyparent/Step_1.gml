/// @description Turn enemies into silver coins

//If the Silver P-Switch is active and the enemy is inside the view and can turn into a silver coin
if (obj_levelcontrol.gswitch_on == true) 
&& (turn_silver == true)
&& (outside_view() == false) {

	//Turn into a silver coin
    with (instance_create_depth(round(bbox_left + bbox_right)/2, round(bbox_top + bbox_bottom)/2-8, -4, obj_coinnpc_silver)) {

        //Jump a bit
        yspeed = -4;
        y--;
        
        //Move in the opposite way Mario is
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x)
            xspeed = 0.5;
        else
            xspeed = -0.5;                    
    }
    
    //Destroy
    instance_destroy();    
}
