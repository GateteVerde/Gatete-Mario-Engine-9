/// @description Set view parameters

//Set the room width and room height based on global.gw and global.gh values
if (room_width < global.gw) then room_width = global.gw;
if (room_height < global.gh) then room_height = global.gh;

//Enable the views if they were not enabled
view_enabled = true;

//Make view 0 visible if not visible
view_visible[0] = true;

//Set the window size according to the size size
window_set_size(global.gw*size, global.gh*size);

//Set the view size
camera_set_view_size(view_camera[0], global.gw, global.gh);

//Rescale the surface
surface_resize(application_surface, global.gw*size, global.gh*size);

//Set the viewing border
camera_set_view_border(view_camera[0], camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2);

//Set the viewing target to the coordinator (to be changed to Level Coordinator, etc. later)
camera_set_view_target(view_camera[0], self);