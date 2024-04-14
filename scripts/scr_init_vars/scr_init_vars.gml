function scr_init_vars(){ // gml_Script_scr_gamestar
	draw_set_color(c_white)
	global.keyB = ord("X");
	global.keyA = ord("Z");
	global.keyY = ord("A");
	global.keyX = ord("S");
	global.keyUp = vk_up;
	global.keyDown = vk_down;
	global.keyLeft = vk_left;
	global.keyRight = vk_right;
	global.keyTriggerL = ord("Q");
	global.keyTriggerR = ord("W");
	global.keyStart = vk_enter;
	global.keySelect = vk_space;
	global.taunt_key= ord("C");
	
	global.screenshakeoff = 0;
	
	global.mach_color1 = make_colour_rgb(96, 208, 72)
	global.mach_color2 = make_colour_rgb(248, 0, 0)
	global.afterimage_color1 = make_colour_rgb(255, 0, 0)
	global.afterimage_color2 = make_colour_rgb(0, 255, 0)
	
	//Items
	global.mushrooms = 0;	
	global.supermushrooms = 0;
	global.ultramushrooms = 0;
	global.maxmushrooms = 0;
	global.nuts = 0;
	global.supernuts = 0;
	global.ultranuts = 0;
	global.maxnuts = 0;
	global.starcandies = 0;
	global.syrups = 0;
	global.supersyrups = 0;
	global.ultrasyrups = 0;
	global.maxsyrups = 0;
	global.oneups = 0;
	global.oneupsupers = 0;
	global.herbs = -0;
	global.redpeppers = 0;
	global.greenpeppers = 0;
	global.boobiscuits = 0;
	global.retryclocks = 0;

	//Bros Attacks
	global.brosattacks = 1;
	
	global.experience = 0;
	global.coins = 0;
	global.coinsearned = 0;
	
	global.Pdead = 0;
	global.Gdead = 0;
	
	global.Plvl = 1; //peppino's level
	global.Pexpleft = 7; //Experience points left until next level up
	global.Plastbonus = -1; //Whether or not to increase level up bonus chances
	global.Pexp = 0; //peppino's experience points (exp)
	global.PHP = 20; //peppino's health (HP)
	global.maxPHP = global.PHP; //peppino's maximum health
	global.PBP = 10; //peppino's bro points (BP)
	global.maxPBP = global.PBP; //peppino's maximum bro points
	global.Ppow = 2; //peppino's offensive strength (POW)
	global.Pdef = 10; //peppino's defensive strength (DEF)
	global.Pspd = 13; //peppino's speed for turns
	global.Pstache = 1; //peppino's chance of getting lucky hits (stache)
	
	global.Glvl = 1; //player2 level
	global.Gexpleft = 7; //Experience points left until next level up
	global.Glastbonus = -1; //Whether or not to increase level up bonus chances
	global.Gexp = 0; //player2 experience points (exp)
	global.GHP = 20; //player2 health (HP)
	global.maxGHP = global.GHP; //player2 maximum health
	global.GBP = 10; //player2 bro points (BP)
	global.maxGBP = global.GBP; //player2 maximum bro points
	global.Gpow = 2; //player2 offensive strength (POW)
	global.Gdef = 10; //player2 defensive strength (DEF)
	global.Gspd = 13; //player2 speed for turns
	global.Gstache = 1; //player2 chance of getting lucky hits (stache)
	
	global.turn = 0;
	global.solo = 0;
	global.lvuppow = 0;
	global.damage = 0;
	global.totaldamage = 0;
	global.hurt = 0;
	global.stunned = false;
	global.luckyhit = 0;
	global.luck = 0;
	global.criticalhit = false;
	global.takedamage = 0; //0 is none, 1 is peppino, 2 is player2
	global.strike = 0; //0 is neutral, 1 is jump, 2 is punch, 3 is enemy first strike
	global.posx = 0;
	global.posy = 0;
	global.outcome = 0;
	global.battleroom = rm_Battle; //Room to initiate battles in (rm_Battle is the default)
	global.runaway = 1; //Whether or not the Run Block is enabled
	global.hitrank = 0; //0 is Ok, 1 is Good, 2 is Great, 3 is Excellent
	global.music = 0;
	global.musicOverworld = 0;
	global.GameOver = false;
	global.finalboss = false;
	global.file = 1; //File Number where 0 is Null, 1 is Slot A, 2 is Slot B
	global.saveMessage = -1;
	global.flag = 0;
	
	global.roomin = room
	global.rm_name = ""
	global.prog = 0
	global.z = 0;
	global.name = ""
    global.portrait = 0
	global.talker = 0
    global.fe = 0
    global.typer = 5
    global.msg = " "
    global.msc = 0
    global.msgno = 0
    for (i = 0; i < 10; i += 1)
    {
        global.writersnd[i] = 65
        global.writerimg[i] = 2237
        global.smdir[i] = 90
        global.smspeed[i] = 2
        global.smsprite[i] = 638
        global.smalarm[i] = 20
        global.smtype[i] = 0
        global.smxx[i] = 100
        global.smyy[i] = 110
        global.smimage[i] = 0
        global.smimagespeed[i] = 0
        global.sminstance[i] = 4384738473
        global.smcolor[i] = 16777215
        global.smstring[i] = stringset(" ")
    }
	    global.smalarm[1] = 15
    global.smyy[1] = 70
    global.smxx[1] = 700
    global.smdir[1] = 180
    global.smspeed[1] = 40
    global.smtype[1] = 3
    global.smsprite[1] = 637
    global.smcolor[1] = 16777215
    global.smstring[1] = stringset(" ")
    for (i = 0; i < 100; i += 1)
        global.msg[i] = stringset("%%")
    global.msg[0] = stringset(" ")
    global.msg[1] = stringset(" ")
    global.msg[2] = stringset(" ")
    global.msg[3] = stringset(" ")
    global.msg[4] = stringset(" ")
	global.interact = 0
	global.extra_font = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!.,1234567890:?", true, 2)
}

function __init_background() {
	enum e__BG
	{
		Visible,
		Foreground,
		Index,
		X,
		Y,
		Width,
		Height,
		HTiled,
		VTiled,
		XScale,
		YScale,
		HSpeed,
		VSpeed,
		Blend,
		Alpha,
	}
}