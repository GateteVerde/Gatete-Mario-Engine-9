/// @description Makes tiles invisible in an area

/*

This object is needed to control and draw the tile layers affected by the bridges
You can always merge this code into other objects

IMPORTANT

The object must be in a layer that's on top of the tile layers

*/

//This is to make the surface a bit bigger than the view
extra = 10;

//Camera stuff, make sure to change this with your own camera id and size
CAMERA = view_camera[0];
WIDTH = camera_get_view_width(CAMERA)+extra;
HEIGHT = camera_get_view_height(CAMERA)+extra;

buff=-4;

//This is to check if we saved all the tilemaps
init = 1;

//Surface variables
TileSurface  = -4;
BufferSurface = -4;
FinalSurface = -4;

//Functio to initialize the tile surface
TileSurfaceInit = function() {
	
	 if(event_type = ev_draw) {
		 
	    if(event_number == 0) {
			
	        if (obj_bridgecontrol.init){
				
	            var surf = obj_bridgecontrol.TileSurface;
	            if (!surface_exists(surf))
	            {
					//Unfortunately this surface has to be as big as the room
					//as it needs the entire tilemap
	                surf = surface_create(room_width,room_height);
	            }
	            surface_set_target(surf);
	            gpu_set_blendmode(bm_normal);
				surface_reset_target();
	        }
	    }
	 }	
	
}

//Function to draw the tilemaps into the surface
//Edit this one
TileSurfaceEnd = function(){
	
	 if(event_type = ev_draw){
		 
	    if(event_number == 0) {
			
	        if (obj_bridgecontrol.init) {
				
	            surface_set_target(obj_bridgecontrol.TileSurface);
   
                //You can add multiple tilemaps, simply repeat these two lines of code
			    var _tilemap = layer_tilemap_get_id(layer_get_id("Tileset"));
			    draw_tilemap(_tilemap,0,0);
				
			    surface_reset_target();
                
				//Repeat this line of code for other tilemaps
			    layer_set_visible(layer_get_id("Tileset"),0);
				
				//Save the surface in a buffer
				//This is done so the tiles don't disappear when resizing the window
				obj_bridgecontrol.buff = buffer_create((room_width*room_height)*4,buffer_grow,1);
				buffer_get_surface(obj_bridgecontrol.buff,obj_bridgecontrol.TileSurface,0);
				
				//Free the tile surface from memory
				surface_free(obj_bridgecontrol.TileSurface);
				
	        }
	    }
	 }	
	
}

//Create the tile surface and execute the scripts
TileSurface = surface_create(room_width,room_height);
surface_set_target(TileSurface);
draw_clear_alpha(c_white,0);
   
surface_reset_target();

//Duplicate these two lines for multiple tile layers
//Edit this one
layer_script_begin(layer_get_id("Tileset"),TileSurfaceInit);
layer_script_end(layer_get_id("Tileset"),TileSurfaceEnd);

camera_x = 0;
camera_y = 0;

//This variable is just for test purposes
vx = 0;
