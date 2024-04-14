draw_set_color(c_white);
shader_set(global.Pal_Shader)
pal_swap_set(spr_peppalette, 0, false);

for (i = 0; i < array_length(particles); i++)
{
	with particles[i]
		draw_sprite(sprite_index, image_index, x, y);
}