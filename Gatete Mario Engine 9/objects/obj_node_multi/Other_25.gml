/// @description Open adyacent paths

//Check for a path above and open it if it is not visible
var pathU = collision_point(x+7, y-1, obj_pathparent, 0, 0);
if (pathU) 
&& (pathU.image_alpha == 0)
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 90;

//Check for a path below and open it if it is not visible
var pathD = collision_point(x+7, y+16, obj_pathparent, 0, 0);
if (pathD) 
&& (pathD.image_alpha == 0) 
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 270;

//Check for a path at the left and open it if it is not visible
var pathL = collision_point(x-1, y+7, obj_pathparent, 0, 0);
if (pathL) 
&& (pathL.image_alpha == 0)
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 180;

//Check for a path at the right and open it if it is not visible
var pathR = collision_point(x+16, y+7, obj_pathparent, 0, 0);
if (pathR) 
&& (pathR.image_alpha == 0)
    with (instance_create_layer(x, y, "Main", obj_mapopener)) direct = 0;
