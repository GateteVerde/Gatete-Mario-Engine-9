/// @description Moving Platform logic

//If the collision exists
if (instance_exists(mytop)) {

    //Snap semisolid to position
    mytop.x = bbox_left;
    mytop.y = bbox_top;

    //If Mario is on this enemy
    if ((collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
    && (obj_mario.bbox_bottom < yprevious+5)
    && (obj_mario.state < playerstate.jump)) {
    
        //If the enemy is pullable 
        if (isheavy < 2) {
        
            //If the pull object does not exist and this object can be pulled
			if (can_carry() == true)
            && (instance_number(obj_mario_puller) == 0) {
            
                //Force Mario to hold the enemy
                with (obj_mario) {
                
                    holding = 1;
                    visible = 0;
                }
                
                //Create puller
                instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_puller);
                
                //Finish pull
                if (isheavy == 0)
                    alarm[0] = 10;
                else
                    alarm[0] = 20;    
            }
        }
                
		//Check for a semisolid
		var check = collision_rectangle(obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_mario.bbox_right, obj_mario.bbox_bottom+1, obj_semisolid, 0, 0);
		
		//If there's not a semisolid in position, exit
		if (check) 
		&& (check != mytop)
			exit;
			
		//Snap Mario vertically
		obj_mario.y = ceil(bbox_top-15);

		//Snap Mario horizontally and prevent it from getting embed on a solid
		obj_mario.x += x-xprevious;
		if (collision_rectangle(obj_mario.bbox_right+xspeed, obj_mario.bbox_top+4, obj_mario.bbox_right+1+xspeed, obj_mario.bbox_bottom-1, obj_solid, 1, 0))
			with (obj_mario) x--;
		else if (collision_rectangle(obj_mario.bbox_left-1-xspeed, obj_mario.bbox_top+4, obj_mario.bbox_left-xspeed, obj_mario.bbox_bottom-1, obj_solid, 1, 0))
			with (obj_mario) x++;
    }
}
