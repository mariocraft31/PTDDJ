for (var i = 0; i < array_length(particles); i++)
{
	with particles[i]
	{
		image_index += image_speed;
		if (image_index > image_number - 1)
			array_delete(other.particles, i--, 1);
		else
		{
		}
	}
}