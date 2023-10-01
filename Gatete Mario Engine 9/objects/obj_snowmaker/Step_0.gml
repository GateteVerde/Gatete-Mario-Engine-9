/// @description Generate snow flakes

repeat (5) {
	
	part_particles_create(system, random_range(camera_get_view_x(view_camera[0]) - 600, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 600), camera_get_view_y(view_camera[0]) - 5, part, 1);
}