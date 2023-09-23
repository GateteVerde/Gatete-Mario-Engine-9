/// @description Generated Disco Light logic

//Stay in position
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
y = camera_get_view_y(view_camera[0]) + 48;

//Set the light angle
xx += 0.75*sign(ready);
if (xx < -92)
    ready = 1;
else if (xx > 91)
    ready = -1;