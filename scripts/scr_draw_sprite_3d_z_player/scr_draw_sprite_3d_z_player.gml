function scr_draw_sprite_3d_z_player(){
	var _pattern = global.palettetexture;
	var ps = paletteselect;
	var spr = spr_palette;
	
	if object_index == obj_ow_player
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, _pattern);
	
	pal_swap_set(spr, ps, false);
	draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(z,-global.z-270),y+lengthdir_y(z,-global.z-270),image_xscale,image_yscale,-global.z,image_blend,image_alpha);
	
	pattern_reset();
}