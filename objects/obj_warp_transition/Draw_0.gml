if (ready > 0)
{
	if !surface_exists(surface)
		surface = surface_create(view_wport[0],view_hport[0])
	surface_set_target(surface)
	draw_clear_alpha(c_black, 0)
	var cx = camerawidth()/2
	var cy = cameraheight()/2
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_rectangle(0,0,camerawidth(),cameraheight(),false)
	gpu_set_blendmode(bm_subtract)
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_sprite_ext(spr_transition,0,cx,cy,scale,scale,image_angle,c_white,1)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
	draw_surface(surface,0,0)
}