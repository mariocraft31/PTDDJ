if global.interact == 1
{
	image_alpha += fade_speed
	if image_alpha >= 0.5
	{
		image_alpha = 0.5
	}
}
else if global.interact == 0
{
	image_alpha -= fade_speed
	if image_alpha <= 0
		instance_destroy()
}