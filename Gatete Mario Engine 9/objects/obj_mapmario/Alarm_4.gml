/// @description Open all adyacent paths

//Check for a path above and open it if it is not visible
var pathU = collision_point(x+xorig, y+yorig-8, obj_pathparent, 0, 0);
                
//If the path exists
if (pathU) 
&& (pathU.image_alpha == 0)
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 90;
				
//Otherwise, if the path has been opened before
else {
			
	alarm[10] = 32;
	with (obj_mapcontrol)
		alarm[0] = 32;
}
                
//Check for a path below and open it if it is not visible
var pathD = collision_point(x+xorig, y+yorig+9, obj_pathparent, 0, 0);
                
//If the path exists
if (pathD) 
&& (pathD.image_alpha == 0) 
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 270;
				
//Otherwise, if the path has been opened before
else {
			
	alarm[10] = 32;
	with (obj_mapcontrol)
		alarm[0] = 32;
}
                
//Check for a path at the left and open it if it is not visible
var pathL = collision_point(x+xorig-8, y+yorig, obj_pathparent, 0, 0);
                
//If the path exists
if (pathL) 
&& (pathL.image_alpha == 0)
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 180;
				
//Otherwise, if the path has been opened before
else {
			
	alarm[10] = 32;
	with (obj_mapcontrol)
		alarm[0] = 32;
}
                
//Check for a path at the right and open it if it is not visible
var pathR = collision_point(x+xorig+9, y+yorig, obj_pathparent, 0, 0);
                
//If the path exists
if (pathR) 
&& (pathR.image_alpha == 0)
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 0;
				
//Otherwise, if the path has been opened before
else {
			
	alarm[10] = 32;
	with (obj_mapcontrol)
		alarm[0] = 32;
}  

//End clear phase
global.clear = 0;