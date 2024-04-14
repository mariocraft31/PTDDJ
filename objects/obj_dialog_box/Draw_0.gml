if (active == 1)
{
	scr_dbox()
	if (!instance_exists(writer))
	        instance_destroy()

	if instance_exists(writer)
			depth = writer.depth + 1
			
	if (side == 0)
	{
		draw_set_halign(fa_left)
		draw_set_alpha(1)
		draw_set_font(global.extra_font)
		draw_text_transformed(xxx + 12, (yyy + 120),(global.name),2,2,image_angle)
	}
	else
 	{
		draw_set_halign(fa_left)
		draw_set_alpha(1)
		draw_set_font(global.extra_font)
		draw_text_transformed(xxx + 12, (yyy + 364),(global.name),2,2,image_angle)
	}
}