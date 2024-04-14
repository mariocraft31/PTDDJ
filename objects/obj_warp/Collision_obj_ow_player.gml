other.active = false

if !instance_exists(obj_warp_transition)
{
	with instance_create(x,y,obj_warp_transition)
	{
		targetroom = other.room_go
		target_x = other.targetx;
		target_y = other.targety;	
	}
}