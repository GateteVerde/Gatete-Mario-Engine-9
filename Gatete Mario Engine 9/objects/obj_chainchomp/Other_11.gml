/// @description Set up the length of the chain if the chomp is taunting 

var length = point_distance(cx, cy, chomp.x, chomp.y);
chain[0].x = cx+0.1*length*cos(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[0].y = cy-0.1*length*sin(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[1].x = cx+0.3*length*cos(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[1].y = cy-0.3*length*sin(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[2].x = cx+0.5*length*cos(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[2].y = cy-0.5*length*sin(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[3].x = cx+0.7*length*cos(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);
chain[3].y = cy-0.7*length*sin(point_direction(cx, cy, chomp.x, chomp.y)*pi/180);