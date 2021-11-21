/// @description Make Mario bounce if this one is above the block

if (vspeed < 0)
&& (other.bbox_bottom < yprevious+5)
	other.yspeed = -2;