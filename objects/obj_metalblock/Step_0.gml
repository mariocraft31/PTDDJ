with obj_ow_player
{
	if character == "P" && state == 2
	{
		if (place_meeting(x + mach3movespd, y + mach3movespd, other) || place_meeting(x - mach3movespd, y - mach3movespd, other))
		{
			instance_destroy(other);
		}
	}
}