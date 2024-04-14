function scr_MarioLevels() {
	/*Determines Mario's stat amounts to increase based on his level

	Use this script to customize the amount of points Mario recieves upon leving up.
	You can increase HP, BP, POWER, DEFENSE, SPEED, and STACHE amounts differently
	for reaching different level achievements (I recommend not setting an amount higher than 6).

	*/

	if global.Plvl = 2
	{
	    hpamount = 2;
	    bpamount = 0;
	    powamount = 1;
	    defamount = 2;
	    spdamount = 3;
	    stacheamount = 1;
	}
	if global.Plvl = 3
	{
	    hpamount = 1;
	    bpamount = 1;
	    powamount = 2;
	    defamount = 1;
	    spdamount = 2;
	    stacheamount = 2;
	}
	if global.Plvl = 4
	{
	    hpamount = 1;
	    bpamount = 0;
	    powamount = 3;
	    defamount = 2;
	    spdamount = 3;
	    stacheamount = 0;
	}
	if global.Plvl = 5
	{
	    hpamount = 1;
	    bpamount = 1;
	    powamount = 4;
	    defamount = 2;
	    spdamount = 3;
	    stacheamount = 1;
	}
	if global.Plvl = 6
	{
	    hpamount = 2;
	    bpamount = 0;
	    powamount = 2;
	    defamount = 2;
	    spdamount = 2;
	    stacheamount = 1;
	}
	if global.Plvl = 7
	{
	    hpamount = 0;
	    bpamount = 1;
	    powamount = 3;
	    defamount = 2;
	    spdamount = 3;
	    stacheamount = 2;
	}
	if global.Plvl >= 8
	{
	    hpamount = 2;
	    bpamount = 2;
	    powamount = 2;
	    defamount = 2;
	    spdamount = 2;
	    stacheamount = 2;    
	}



}

function scr_gustavoLevels() {
	/*Determines gustavo's stat amounts to increase based on his level

	Use this script to customize the amount of points gustavo recieves upon leving up.
	You can increase HP, BP, POWER, DEFENSE, SPEED, and STACHE amounts differently
	for reaching different level achievements (I recommend not setting an amount higher than 6).

	*/

	if global.Glvl = 2
	{
	    hpamount = 2;
	    bpamount = 1;
	    powamount = 2;
	    defamount = 3;
	    spdamount = 2;
	    stacheamount = 1;
	}
	if global.Glvl = 3
	{
	    hpamount = 1;
	    bpamount = 1;
	    powamount = 2;
	    defamount = 2;
	    spdamount = 2;
	    stacheamount = 1;
	}
	if global.Glvl = 4
	{
	    hpamount = 1;
	    bpamount = 0;
	    powamount = 2;
	    defamount = 3;
	    spdamount = 1;
	    stacheamount = 1;
	}
	if global.Glvl = 5
	{
	    hpamount = 1;
	    bpamount = 1;
	    powamount = 2;
	    defamount = 2;
	    spdamount = 1;
	    stacheamount = 0;
	}
	if global.Glvl = 6
	{
	    hpamount = 2;
	    bpamount = 0;
	    powamount = 2;
	    defamount = 1;
	    spdamount = 2;
	    stacheamount = 1;
	}
	if global.Glvl = 7
	{
	    hpamount = 1;
	    bpamount = 1;
	    powamount = 2;
	    defamount = 2;
	    spdamount = 2;
	    stacheamount = 2;
	}
	if global.Glvl >= 8
	{
	    hpamount = 2;
	    bpamount = 2;
	    powamount = 2;
	    defamount = 2;
	    spdamount = 2;
	    stacheamount = 2;
	}
}

function scr_MarioNextLevel() {
	/*Determining when to level up Mario

	Use this script to set the experience points needed to level up.

	expleft = global.Pexp - [ADD THE PREVIOUS LEVEL'S EXPERIENCE NEEDED TO LEVEL UP PLUS THE PREVIOUS SUBTRACTION FROM THE TOTAL EXPERIENCE];
	global.Pexpleft = [SET AMOUNT HERE];

	*/

	if global.Plvl = 2 //Leveling up to Level 2
	{
	    expleft = global.Pexp - 7;
	    global.Pexpleft = 25; //Exp to next level
	    global.Pexpleft -= expleft;
	}
	else if global.Plvl = 3 //Leveling up to Level 3
	{
	    expleft = global.Pexp - 32;
	    global.Pexpleft = 40; //Exp to next level
	    global.Pexpleft -= expleft;
	}
	else if global.Plvl = 4 //Leveling up to Level 4
	{
	    expleft = global.Pexp - 72;
	    global.Pexpleft = 100; //Exp to next level
	    global.Pexpleft -= expleft;
	}
	else if global.Plvl = 5 //Leveling up to Level 5
	{
	    expleft = global.Pexp - 172;
	    global.Pexpleft = 9999 //125; //Exp to next level
	    global.Pexpleft -= expleft;
	}
	//Does this cause the dancing sprite glitch?
	/*else if global.Plvl = 6 //Leveling up to Level 6
	{
	    expleft = global.Pexp - global.Pexpleft;
	    global.Pexpleft = 175; //Exp to next level
	    global.Pexpleft -= expleft;
	}
	else if global.Plvl = 7 //Leveling up to Level 7
	{
	    expleft = global.Pexp - global.Pexpleft;
	    global.Pexpleft += 200; //Exp to next level
	    global.Pexpleft -= expleft;
	}
	*/
}

function scr_gustavoNextLevel() {
	/*Determining when to level up gustavo

	Use this script to set the experience points needed to level up.

	expleft = global.Gexp - [ADD THE PREVIOUS LEVEL'S EXPERIENCE NEEDED TO LEVEL UP PLUS THE PREVIOUS SUBTRACTION FROM THE TOTAL EXPERIENCE];
	global.Gexpleft = [SET AMOUNT HERE];

	*/

	if global.Glvl = 2 //Leveling up to Level 2
	{
	    expleft = global.Gexp - 7;
	    global.Gexpleft += 27; //Exp to next level
	    global.Gexpleft -= expleft;    
	}
	else if global.Glvl = 3 //Leveling up to Level 3
	{
	    expleft = global.Gexp - 34;
	    global.Gexpleft += 40; //Exp to next level
	    global.Gexpleft -= expleft;    
	}
	else if global.Glvl = 4 //Leveling up to Level 4
	{
	    expleft = global.Gexp - 74;
	    global.Gexpleft += 110; //Exp to next level
	    global.Gexpleft -= expleft;    
	}
	else if global.Glvl = 5 //Leveling up to Level 5
	{
	    expleft = global.Gexp - 184;
	    global.Gexpleft += 9999 //130; //Exp to next level
	    global.Gexpleft -= expleft;    
	}
	//Does this cause the dancing sprite glitch?
	/*else if global.Glvl = 6 //Leveling up to Level 6
	{
	    expleft = global.Gexp - 203;
	    global.Gexpleft += 130; //Exp to next level
	    global.Gexpleft -= expleft;    
	}
	else if global.Glvl = 7 //Leveling up to Level 7
	{
	    expleft = global.Gexp - 256;
	    global.Gexpleft += 130; //Exp to next level
	    global.Gexpleft -= expleft;    
	}*/
}
