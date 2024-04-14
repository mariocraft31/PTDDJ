if (active == 0)
{
	cam_x = __view_get(0, camera)
    cam_y = __view_get(1, camera)
	
	if shake_mag != 0 && (global.screenshakeoff == 0)
			{
				cam_x += irandom_range(-shake_mag, shake_mag);
				cam_y += irandom_range(-shake_mag, shake_mag);
			}

    beenset = 1
    if (global.screenshakeoff == 0)
    {
        __view_set((0), camera, (cam_x + shakex))
        __view_set((1), camera, (cam_y + shakey))
    }
    shakesign = (-shakesign)
    active = 1
    alarm[0] = shakespeed
}

if shake_mag > 0
	{
		shake_mag -= shake_mag_acc;
		if shake_mag < 0
			shake_mag = 0;
	}