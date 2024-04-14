if other.attacknum = 0 && sprite_index = spr_pep_B_kick && image_index > 1 && image_index < 3
{ 
	if !instance_exists(obj_bangeffect)
		instance_create(other.x,other.y-24,obj_bangeffect)
	if !audio_is_playing(snd_hit_fix)
		audio_play_sound(snd_hit_fix,0,0)
    switch (global.turn)
    {
        case 0:
            if !instance_exists(obj_battlecontrol.enemyid[targetchoose])
            {
                do
                {
                    targetchoose += 1;
                    if targetchoose > 5
                        targetchoose = 0;
                }
                until (instance_exists(obj_battlecontrol.enemyid[targetchoose]) or targetchoose = 0);
    
                if targetchoose = 0
                {
                    if instance_exists(obj_battlecontrol.enemyid[5])
                        targetchoose = 5;
                    else if instance_exists(obj_battlecontrol.enemyid[4])
                        targetchoose = 4;
                    else if instance_exists(obj_battlecontrol.enemyid[3])
                        targetchoose = 3;
                    else if instance_exists(obj_battlecontrol.enemyid[2])
                        targetchoose = 2;
                    else if instance_exists(obj_battlecontrol.enemyid[1])
                        targetchoose = 1;
                }
                
                targetx = obj_battlecontrol.enemyid[targetchoose].x;  
                targety = obj_battlecontrol.enemyid[targetchoose].y;
            }            
            break;
        case 1:
            if !instance_exists(obj_battlecontrol.enemyid[obj_gustavob.targetchoose])
            {
                do
                {
                    obj_gustavob.targetchoose += 1;
                    if obj_gustavob.targetchoose > 5
                        obj_gustavob.targetchoose = 0;
                }
                until (instance_exists(obj_battlecontrol.enemyid[obj_gustavob.targetchoose]) or obj_gustavob.targetchoose = 0);

                if obj_gustavob.targetchoose = 0
                {
                    if instance_exists(obj_battlecontrol.enemyid[5])
                        obj_gustavob.targetchoose = 5;
                    else if instance_exists(obj_battlecontrol.enemyid[4])
                        obj_gustavob.targetchoose = 4;
                    else if instance_exists(obj_battlecontrol.enemyid[3])
                        obj_gustavob.targetchoose = 3;
                    else if instance_exists(obj_battlecontrol.enemyid[2])
                        obj_gustavob.targetchoose = 2;
                    else if instance_exists(obj_battlecontrol.enemyid[1])
                        obj_gustavob.targetchoose = 1;
                }                
                                
                obj_gustavob.targetx = obj_battlecontrol.enemyid[obj_gustavob.targetchoose].x;  
                obj_gustavob.targety = obj_battlecontrol.enemyid[obj_gustavob.targetchoose].y;
            }            
            break;            
    }
    other.phase = 1;
}