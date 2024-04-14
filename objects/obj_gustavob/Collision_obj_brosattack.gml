if other.attacknum = 0 && sprite_index = spr_lonegustavo_kick && image_index > 1 && image_index < 3
{ 
	if !instance_exists(obj_bangeffect)
		instance_create(other.x,other.y-24,obj_bangeffect)
	if !audio_is_playing(snd_hit_fix)
		audio_play_sound(snd_hit_fix,0,0)
    switch (global.turn)
    {
        case 0:
            if !instance_exists(obj_battlecontrol.enemyid[obj_pep_battle.targetchoose])
            {
                do
                {
                    obj_pep_battle.targetchoose += 1;
                    if obj_pep_battle.targetchoose > 5
                        obj_pep_battle.targetchoose = 0;
                }
                until (instance_exists(obj_battlecontrol.enemyid[obj_pep_battle.targetchoose]) or obj_pep_battle.targetchoose = 0);

                if obj_pep_battle.targetchoose = 0
                {
                    if instance_exists(obj_battlecontrol.enemyid[5])
                        obj_pep_battle.targetchoose = 5;
                    else if instance_exists(obj_battlecontrol.enemyid[4])
                        obj_pep_battle.targetchoose = 4;
                    else if instance_exists(obj_battlecontrol.enemyid[3])
                        obj_pep_battle.targetchoose = 3;
                    else if instance_exists(obj_battlecontrol.enemyid[2])
                        obj_pep_battle.targetchoose = 2;
                    else if instance_exists(obj_battlecontrol.enemyid[1])
                        obj_pep_battle.targetchoose = 1;
                }                 
                                
                obj_pep_battle.targetx = obj_battlecontrol.enemyid[obj_pep_battle.targetchoose].x;  
                obj_pep_battle.targety = obj_battlecontrol.enemyid[obj_pep_battle.targetchoose].y;
            }            
            break;
        case 1:
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
    }
    other.phase = 3;
}