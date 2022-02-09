/// @description Set alpha if outside view

//If the card is collected
if (ready == 1) 
&& (y < camera_get_view_y(view_camera[0])) {

	image_alpha -= 0.05;
	if (image_alpha < 0)
		image_alpha = 0;
}