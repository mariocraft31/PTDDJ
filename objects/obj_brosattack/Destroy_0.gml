obj_pep_battle.targetx = 0;
obj_pep_battle.targety = 0;
obj_gustavob.targetx = 0;
obj_gustavob.targety = 0;
obj_pep_battle.moveto = 0;
obj_gustavob.moveto = 0;
obj_pep_battle.stance = 1;
obj_gustavob.stance = 1;

//Excellent Hit
if __background_get( e__BG.Visible, 7 ) = true
    __background_set( e__BG.Visible, 7, false );
    
with obj_battlecontrol alarm[2] = 40;