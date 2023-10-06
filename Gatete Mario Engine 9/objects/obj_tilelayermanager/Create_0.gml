/// @description Tile Layer Manager

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
			if ((instance_exists(obj_tilelayermanager)) && (obj_tilelayermanager.init)) {
			
				with (obj_tilelayermanager) {
			
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
			if ((instance_exists(obj_tilelayermanager)) && (obj_tilelayermanager.init)) {
				
				//Set the surface target
		        surface_set_target(obj_tilelayermanager.TileSurface);
   
		        //You can add multiple tilemaps, simply repeat these two lines of code
				var _tilemap = layer_tilemap_get_id(layer_get_id("Tileset"));
				draw_tilemap(_tilemap, 0, 0);
				
				surface_reset_target();
                
				//Repeat this line of code for other tilemaps
				layer_set_visible(layer_get_id("Tileset"), 0);
				
				//Save the surface in a buffer
				//This is done so the tiles don't disappear when resizing the window
				obj_tilelayermanager.buff = buffer_create((room_width*room_height)*4, buffer_grow, 1);
				buffer_get_surface(obj_tilelayermanager.buff, obj_tilelayermanager.TileSurface, 0);
				
				//Free the tile surface from memory
				surface_free(obj_tilelayermanager.TileSurface);
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
layer_script_begin(layer_get_id("Tileset"), TileSurfaceInit);
layer_script_end(layer_get_id("Tileset"), TileSurfaceEnd);

//Camera position
camera_x = 0;
camera_y = 0;

//This variable is just for test purposes
vx = 0;