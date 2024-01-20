/// @description Update smog position and generate rain

//Draw the smog in front
depth = (foreground == 1) ? -10 : 0;

//Update smog position
pos -= 0.25;

//Generate rain drops
if (raining == true) {
	
	repeat (5) {
	
		part_particles_create(system, random_range(camera_get_view_x(view_camera[0]) - 600, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 600), camera_get_view_y(view_camera[0]) - 5, part, 1);
	}
}