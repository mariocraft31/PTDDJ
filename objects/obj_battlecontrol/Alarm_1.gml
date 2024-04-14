audio_stop_all();
global.stunned = true; //This could be the variable to have enemies with invicibility frames in the Overworld
transition_kind = 21;
room = global.roomin;
global.outcome = 0.5;
with (obj_ow_player)
		active = true