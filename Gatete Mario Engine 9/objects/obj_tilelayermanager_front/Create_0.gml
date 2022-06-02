/// @description Front Tile Layer Manager

/*
//	Before using this object, make sure you have the following set
//
//	A instance layer called "Tileset_Front_Manager" set at depth -7
//	A instance layer called "Tileset_Front_" set at depth -6
//
//	Once you have those set, add this object in "Tileset_Front_Manager"
*/

//This is to make the surface a bit bigger than the view
extra			= 10;

//Camera stuff, make sure to change this with your own camera id and size
CAMERA			= view_camera[0];
WIDTH			= camera_get_view_width(CAMERA) + extra;
HEIGHT			= camera_get_view_height(CAMERA) + extra;

buff			= -4;

//This is to check if we saved all the tilemaps
init			=  1;

//Surface variables
TileSurface		= -4;
BufferSurface	= -4;
FinalSurface	= -4;

//Function to initialize the TileSurface
TileSurfaceInit = function() {
	
	//If the event is a 'Draw' event
	if (event_type = ev_draw) {
		
		//If the event number is equal to 0
		if (event_number == 0) {
			
			//If the controller exists
			if ((instance_exists(obj_tilelayermanager_front)) && (obj_tilelayermanager_front.init)) {
			
				with (obj_tilelayermanager_front) {
			
					if (!surface_exists(TileSurface))
						TileSurface = surface_create(room_width, room_height); 	 
				}
			}
		}
	}		
}

//Function to draw the tilemaps into the surface
TileSurfaceEnd = function() {
	
	//If the event is a 'Draw' event
	if (event_type = ev_draw) {
		
		//If the event number is equal to 0
	    if (event_number == 0) {
						
			//If the controller exists
			if ((instance_exists(obj_tilelayermanager_front)) && (obj_tilelayermanager_front.init)) {
				
				//Set the surface target
		        surface_set_target(obj_tilelayermanager_front.TileSurface);
   
		        //You can add multiple tilemaps, simply repeat these two lines of code
				var _tilemap = layer_tilemap_get_id(layer_get_id("Tileset_Front"));
				draw_tilemap(_tilemap, 0, 0);
				
				//Reset surface target
				surface_reset_target();
                
				//Repeat this line of code for other tilemaps
				layer_set_visible(layer_get_id("Tileset_Front"), 0);
				
				//Save the surface in a buffer
				//This is done so the tiles don't disappear when resizing the window
				obj_tilelayermanager_front.buff = buffer_create((room_width*room_height)*4, buffer_grow, 1);
				buffer_get_surface(obj_tilelayermanager_front.buff, obj_tilelayermanager_front.TileSurface, 0);
				
				//Free the tile surface from memory
				surface_free(obj_tilelayermanager_front.TileSurface);
			}
	    }
	}		
}

//Create the tile surface and execute the scripts
TileSurface = surface_create(room_width, room_height);

//Set the surface target
surface_set_target(TileSurface);

//Clear alpha in white
draw_clear_alpha(c_white,0);

//Reset the surface target
surface_reset_target();

//Duplicate these two lines for multiple tile layers (Edit these ones)
layer_script_begin(layer_get_id("Tileset_Front"), TileSurfaceInit);
layer_script_end(layer_get_id("Tileset_Front"), TileSurfaceEnd);

//Camera position
camera_x = 0;
camera_y = 0;

//This variable is just for test purposes
vx = 0;
