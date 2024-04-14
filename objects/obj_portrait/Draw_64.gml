if usepalette
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_palette, paletteselect, false);
}

draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,image_angle,image_blend,image_alpha);