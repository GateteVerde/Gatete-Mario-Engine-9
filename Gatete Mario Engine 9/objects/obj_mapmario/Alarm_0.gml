/// @description Open adjacent paths depending of what exit was found

//Find nearest panel
check = collision_point(x+xorig, y+yorig, obj_levelpanel, 0, 0);

//Handle the visual "clear levels" for the title screen
with (check) {

    //If you didn't warp...
    if (global.clear < 3) {

        //And the normal/secret exit wasn't cleared...
        if (is_undefined(ds_map_find_value(global.worldmap_beaten,string(id)+"_"+string(global.clear)))) {
        
            //Note this
            global.cleared_levels++;
            ds_map_replace(global.worldmap_beaten, string(id) + "_" + string(global.clear), 1);        
        }        
    }    
}

//If the level has been cleared with the normal exit
if (global.clear == 1) {

    //If this panel is a switch palace, do not open paths
    if (check.paneltype == 2) {
        
        savegame = true;
    
        //Mark panel as beaten
        with (check) {
        
            ds_map_replace(global.worldmap, id, 2);
            alarm[2] = 1;
            exit;
        }           
    }
    
    //Otherwise
    else {

        //If this panel is a castle
        if (check.paneltype == 1) {
        
            if (check.beaten != 2) {
            
				//Save the game if required
                savegame = true;
            
				//Mark this panel as beaten
                with (check) {
                
                    ds_map_replace(global.worldmap, id, 2);
                    alarm[2] = 1;
                    exit;                    
                }         
            }            
        }
    
        //Check what exit was set in the panel
        switch (check.normalexit) {
        
            //Up
            case (90): {
        
                //Check for a path above and open it if it is not visible
                var pathU = collision_point(x+xorig, y+yorig-8, obj_pathparent, 0, 0);
                
                //If the path exists
                if (pathU) 
                && (pathU.image_alpha == 0)
                    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 90;
            } break;
            
            //Down
            case (270): {
                
                //Check for a path below and open it if it is not visible
                var pathD = collision_point(x+xorig, y+yorig+9, obj_pathparent, 0, 0);
                
                //If the path exists
                if (pathD) 
                && (pathD.image_alpha == 0) 
                    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 270;
            } break;
            
            //Left
            case (180): {
                
                //Check for a path at the left and open it if it is not visible
                var pathL = collision_point(x+xorig-8, y+yorig, obj_pathparent, 0, 0);
                
                //If the path exists
                if (pathL) 
                && (pathL.image_alpha == 0)
                    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 180;
            } break;
            
            //Right
            case (0): {
                
                //Check for a path at the right and open it if it is not visible
                var pathR = collision_point(x+xorig+9, y+yorig, obj_pathparent, 0, 0);
                
                //If the path exists
                if (pathR) 
                && (pathR.image_alpha == 0)
                    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 0;
            } break;    
        }
    }
}

//Otherwise, if the level has been cleared with the secret exit
else if (global.clear == 2) {

    //Check what exit was set in the panel
    switch (check.secretexit) {
    
        //Up
        case (90): {
    
            //Check for a path above and open it if it is not visible
            var pathU = collision_point(x+xorig, y+yorig-8, obj_pathparent, 0, 0);
            
            //If the path exists
            if (pathU) 
            && (pathU.image_alpha == 0)
                with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 90;
        } break;
        
        //Down
        case (270): {
            
            //Check for a path below and open it if it is not visible
            var pathD = collision_point(x+xorig, y+yorig+9, obj_pathparent, 0, 0);
            
            //If the path exists
            if (pathD) 
            && (pathD.image_alpha == 0) 
                with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 270;
        } break;
        
        //Left
        case (180): {
            
            //Check for a path at the left and open it if it is not visible
            var pathL = collision_point(x+xorig-8, y+yorig, obj_pathparent, 0, 0);
            
            //If the path exists
            if (pathL) 
            && (pathL.image_alpha == 0)
                with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 180;
        } break;
        
        //Right
        case (0): {
            
            //Check for a path at the right and open it if it is not visible
            var pathR = collision_point(x+xorig+9, y+yorig, obj_pathparent, 0, 0);
            
            //If the path exists
            if (pathR) 
            && (pathR.image_alpha == 0)
                with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 0;
        } break;    
    }    
}

//Otherwise, if the player warped through a pipe
else if (global.clear == 3) {

    event_user(15);
}

//Mark level as beaten
with (check) {

    if (paneltype != 1)
        ds_map_replace(global.worldmap_beaten, id, 1);        
}

//Reset clear variable
global.clear = 0;

if (instance_exists(check)) {

    //If no map openers were made...
    if ((instance_number(obj_mapopener) == 0) && (check.paneltype == 0)) {
        
        //Save game
        alarm[1] = 2;    
    }    
} 
else {
	
	status = mapstate.idle;
}
    
//Do not remember checkpoint for this level
if (variable_instance_exists(check, "checkpoint"))
    with (check) checkpoint = noone;