for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with b
	{
		for (var l = 0; l < array_length(alarm); l++)
		{
			if alarm[l] >= 0
				alarm[l]--;
		}
		switch identifier
		{
			case afterimage.mach3effect:
				if !obj_ow_player.move
					alarm[0] = 0;
				if obj_ow_player.move
				{
					var p = 4;
					var m = obj_ow_player.movespd - p;
					var t = 12 - p;
					alpha = m / t;
					alpha = clamp(alpha, 0, 1);
				}
				visible = obj_ow_player.visible;
				break;
			
			case afterimage.heatattack:
				x += hsp;
				y += vsp;
				break;
			
			case afterimage.firemouth:
			case afterimage.blue:
			case afterimage.fakepep:
			case afterimage.enemy:
			case afterimage.noise:
				alpha -= 0.05;
				if alpha <= 0 && alarm[0] != 0
					alarm[0] = 0;
				break;
			
			case afterimage.blur:
				alpha -= spd;
				x += hsp;
				y += vsp;
				if alpha <= 0 && alarm[0] != 0
					alarm[0] = 0;
				if (instance_exists(obj_ow_player))
					visible = obj_ow_player.visible;
				else
					visible = true;
				break;
		}
		if alarm[1] == 0
		{
			other.alpha[identifier] = 0;
			alarm[2] = 3;
		}
		if alarm[2] == 0
		{
			other.alpha[identifier] = 1;
			if identifier == afterimage.mach3effect
				other.alpha[identifier] = alpha;
			alarm[2] = 3;
		}
		if alarm[0] == 0
		{
			delete b;
			ds_list_delete(global.afterimage_list, i);
			i--;
		}
		else
		{
			
		}
	}
}