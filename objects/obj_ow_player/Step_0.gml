scr_depth_3d_z()

prevhsp = hsp
prevvsp = vsp
prevmovespeed = movespd
onebuffer -= 1
twobuffer -= 1
threebuffer -= 1

if active
{
	switch (state)
	{
	case 0:
		scr_player_overworld()
		break;
	case 1:
		scr_player_tauntmoves()
		break;
	case 2:
		scr_player_mach()
		break;
	case 3: 
		scr_player_machcharge()
		break;
	}

	if state == 0 && jump && zspeed == 0
	{
		sprite_index = sprite[face]
		image_speed = 0.35
	}
	else if state == 0 && jump && zgrav > 0
	{	
		/*with (create_mach3effect(x, y-z, sprite_index, image_index - 1, true))
		{
			image_xscale = 2;
			image_yscale = 2;
		}*/
		sprite_index = sprite_jump[face]
		image_speed = 0.6
		if  zgrav > 11
		{
			sprite_index = sprite_fall[face]
			image_speed = 0.6
		}
	}
	else if state == 0 && !jump && zgrav > 0
	{
		sprite_index = sprite_fall[face]
		image_speed = 0.6	
	}
	else if state == 0 && move = true && global.interact == 0
	{
		sprite_index = sprite_move[face]
		image_speed = 0.35
	}
	else
	{
		sprite_index = sprite[face]
		image_speed = 0.35
	}
	
	if state == 1
		sprite_index = sprite_taunt
		
	if state == 3
	{
		sprite_index = sprite_move[face]
		image_speed = 0.5
	}
		
	if state == 2
	{
		if !audio_is_playing(sfx_mach)
			audio_play_sound(sfx_mach,1,true,0.8)
		sprite_index = sprite_dash[face]
		image_speed = 0.35
		if macheffect == 0
		{
			macheffect = true;
			toomuchalarm1 = 6;
			with create_mach3effect(x, y, sprite_index, image_index - 1)
			{
				image_xscale = 2
				image_yscale = 2
			}
		}
	}
	if toomuchalarm1 > 0
	{
		toomuchalarm1 -= 1;
		if (toomuchalarm1 <= 0 && state == 2)
		{
			with create_mach3effect(x, y, sprite_index, image_index - 1)
			{
				image_xscale = 2
				image_yscale = 2
			}
			toomuchalarm1 = 6;
		}
	}
	if state != 2
	{
		macheffect = false;
		audio_stop_sound(sfx_mach)
	}
		
	if flash == 1 && alarm[0] <= 0
		alarm[0] = 0.10 * room_speed;
}