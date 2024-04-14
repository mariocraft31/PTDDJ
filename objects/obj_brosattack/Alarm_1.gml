//Mario throws the item
if global.turn = 0
{
    //Green Shells
    if attacknum = 0
    {
        with obj_pep_battle image_index = 0;
        with obj_pep_battle image_speed = 0.35;
        with obj_pep_battle sprite_index = spr_pep_B_kick;
        //with obj_gustavob image_index = 0;
        //with obj_gustavob image_speed = 0.35;
        //with obj_gustavob sprite_index = spr_lonegustavo_idle;
        if zgravityon = 0
        {
            z = 0;
			if !instance_exists(obj_bangeffect)
	            instance_create(x,y,obj_bangeffect)
        }
		alarm[6] = 5
    }  
    //Fire Flower
    if attacknum = 1
        visible = false;
}

//gustavo throws the item
if global.turn = 1
{
    //Green Shells
    if attacknum = 0
    {
        //with obj_pep_battle image_index = 0;
        //with obj_pep_battle image_speed = 0.35;
        //with obj_pep_battle sprite_index = spr_pep_B_idle;
        with obj_gustavob image_index = 0;
        with obj_gustavob image_speed = 0.35;
        with obj_gustavob sprite_index = spr_lonegustavo_kick;
        if zgravityon = 0
        {
            z = 0;
			if !instance_exists(obj_bangeffect)
				instance_create(x,y,obj_bangeffect)
        }
		alarm[6] = 5
    }  
    //Fire Flower
    if attacknum = 1
        visible = false;
}
event_user(2)

