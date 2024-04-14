scr_draw_sprite_3d_z_player()

shader_set(shd_hit);
if (visible && flash)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();

if (global.keyB) && (debug = true)
{
	switch(face)
	{
		case 0: draw_rectangle((x), ((y + sprite_height) - 112), ((x + sprite_width)) - 24, (y - 56),false)
		break;
		case 1: draw_rectangle((x - 32), (y)-32, ((x + sprite_width)) - 64, ((y - sprite_height) + 56),false)
		break;
		case 2: draw_rectangle((x), ((y + sprite_height) - 112), ((x - sprite_width)) + 24, (y - 56),false)
		break;
		case 3: draw_rectangle((x - 32), (y), ((x + sprite_width)) - 64, ((y + sprite_height) - 72),false)
		break;
	}
}