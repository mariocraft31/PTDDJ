if dead = 0
{
    dead = 1;
    sprite_index = spr_forknight_dead;
    
	instance_destroy()
	with instance_create(x,y,obj_enemydead)
		other.sprite_index = sprite_index
}