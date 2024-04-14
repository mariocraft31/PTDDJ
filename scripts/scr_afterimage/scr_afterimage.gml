function create_afterimage(_x, _y, _sprite, _image_index)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_index: _image_index,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.afterimage_color1, global.afterimage_color2),
		image_xscale: 1,
		image_yscale: 1,
		identifier: afterimage.simple,
		visible: true,
		alpha: 1
	};
	ds_list_add(global.afterimage_list, q);
	return q;
}

function create_mach3effect(_x, _y, _sprite, _image_index, _afterimage = false)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_index: _image_index,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.mach_color1, global.mach_color2),
		image_xscale: 1,
		image_yscale: 1,
		visible: true,
		identifier: afterimage.mach3effect,
		playerid: obj_ow_player,
		alpha: 1
	};
	if _afterimage
		q.identifier = afterimage.simple;
	ds_list_add(global.afterimage_list, q);
	return q;
}