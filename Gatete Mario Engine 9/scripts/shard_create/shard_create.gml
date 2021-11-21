/// @function shard_create(sprite, x, y, depth, speed, direction);
/// @param sprite
/// @param x
/// @param y
/// @param depth
/// @param speed
/// @param direction

function shard_create() {

	var _s, _sprite, _xx, _yy, _depth, _speed, _direction;
	
	_sprite =		argument[0];
	_xx =			argument[1];
	_yy =			argument[2];
	_depth =		argument[3];
	_speed =		argument[4];
	_direction =	argument[5];
	
	//Create shard
	_s = instance_create_depth(_xx, _yy, _depth, obj_shard);
		_s.sprite_index = _sprite;
		_s.speed		= _speed;
		_s.direction	= _direction;
		
	//Return _s
	return _s;
}