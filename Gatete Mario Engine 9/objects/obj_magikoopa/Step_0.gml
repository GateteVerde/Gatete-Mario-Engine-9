/// @description Magikoopa Logic

//If the magikoopa is about to appear
if (ready == 0) {

    //If the player is inside the area
    if (instance_exists(obj_mario))
    && (obj_mario.x > xmin)
    && (obj_mario.x < xmax) {
        
        //Increment alpha
        image_alpha += 0.0324;
        
        //If the magikoopa is done
        if (image_alpha > 1) {
        
            //Set both alpha and frame
            image_alpha = 1;
            image_index = 1;
            
            //Make vulnerable
            vulnerable = 1;
            stomp = 0;
            
            //Prepare a spell
            ready = 1;
            alarm[0] = 90;
        }
    }
}

//Otherwise, if the magikoopa is dissappearing
else if (ready == 2) {

    //Decrement alpha
    image_alpha -= 0.0324;
    
    //If the magikoopa is done
    if (image_alpha < 0) {
    
        //Set both alpha and frame
        image_index = 0;
        image_alpha = 0;
        
        //End
        ready = 3;
    }
    
    //Make invulnerable
    vulnerable = 100;
    stomp = -1;   
}

//Otherwise if the magikoopa is changing it's position
else if (ready == 3) {

    //If the player is inside the given coordinates, and there's not a tile at the given position.
    if (instance_exists(obj_mario))
    && (obj_mario.x > xmin)
    && (obj_mario.x < xmax) {
		
		//Move to a random position
		x = (floor(random_range(camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) / 16) * 16) + 8;
		y = floor(random_range(camera_get_view_y(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16) / 16) * 16;
                
        //Check for a semisolid
        var semisolid = collision_rectangle(x, bbox_bottom, x, bbox_bottom+2, obj_semisolid, 0, 0);
		
		//Check for a specific tile map
		var tilemap = layer_tilemap_get_id("Tileset");
        
        //If there's a collision in position
        while (semisolid)
        && (ready == 3)
        && (tilemap_get_at_pixel(tilemap, x-8, bbox_bottom+1) != 0) 
        && (tilemap_get_at_pixel(tilemap, x-7, bbox_bottom+1) != 0)
        && (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 1)) {
            
            //Snap above the semisolid
            y = semisolid.bbox_top-16;
			
			//Play 'Magikoopa Appear' sound
			audio_play_sound(snd_magikoopa_appear, 0, false);
            
            //Prepare spell
            ready = 0; 
        }
    }  
}

//Go up if overlapping a slope
while (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_slopeparent, 1, 1)) y--;

//Face towards the player
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;