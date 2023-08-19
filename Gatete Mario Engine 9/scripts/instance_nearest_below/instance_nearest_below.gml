// @function instance_nearest_below(x, y, obj);
// @param x
// @param y
// @param obj

function instance_nearest_below() {

	var xx = argument[0];
	var yy = argument[1];
	var obj = argument[2];
	var dis;
	var nearest_dis = 999999;
	var nearest_id = noone;
	
	with (obj) {
	
		if (y > yy) {
		
			dis = point_distance(x, y, xx, yy);
			if (dis < nearest_dis) {
			
				nearest_dis = dis;
				nearest_id = id;
			}
		}
	}
	
	return nearest_id;
}