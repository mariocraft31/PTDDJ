function scr_battlelist() {
	/*List all enemy types and battle positions here:

	The types of battles can be predetermined and set in the creation code in the Overworld.
	You can also set specific music and backgrounds.

	*/

	enemyid[0] = instance_create(x,y,obj_enemyallb);

	//No enemies
	if global.battletype = 0
	{
	    global.music = mus_Battle;
	    enemyid[1] = 0;
	    enemyid[2] = 0;
	    enemyid[3] = 0;
	    enemyid[4] = 0;
	    enemyid[5] = 0;
	}
	//Single Goomba
	if global.battletype = 0.5
	{
	    global.battleroom = rm_Battle; //Default Battle Room
	    global.music = mus_Battle;
	    __background_set( e__BG.Index, 0, bg_battle_grassland );
	    __background_set( e__BG.Y, 0, -475 );
	    enemyid[1] = noone;
	    enemyid[2] = noone;
	    enemyid[3] = instance_create(x-24,y,obj_forknight_B);
	    enemyid[4] = noone;
	    enemyid[5] = noone;
	}
	//Variant 1
	if global.battletype = 2
	{
	    global.battleroom = rm_Battle; //Default Battle Room
	    global.music = mus_Battle; //for now
	    __background_set( e__BG.Index, 0, bg_battle_grassland );
	    __background_set( e__BG.Y, 0, -475 );
	    enemyid[1] = instance_create(x,y-64,obj_forknight_B);
	    enemyid[2] = instance_create(x+12,y+32,obj_forknight_B);
		enemyid[3] = noone;
		enemyid[4] = noone;
	    enemyid[5] = noone;
	}
}