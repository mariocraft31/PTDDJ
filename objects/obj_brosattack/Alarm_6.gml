alarm[6] = 5;
if (instance_exists(obj_drawcontroller))
{
	array_push(obj_drawcontroller.particles, 
	{
		x: x,
		y: y-6,
		sprite_index: spr_cloudeffect,
		image_number: sprite_get_number(spr_cloudeffect),
		image_index: 0,
		image_speed: 0.35
	});
}