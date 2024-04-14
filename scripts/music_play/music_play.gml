function music_play(argument0) {
	/*Use this script with the code bellow to play tracks.

	Use this script to customize your music loops without having to manually enter the sample length each time
	you want to play a track.

	*/

	if audio_is_playing(argument0)
	    exit;
	else
	{
	    audio_stop_all();
	    switch (argument0)
	    {
	        case mus_Battle:
	            audio_loop_sound(mus_Battle,0,2685070,44100,1);
	        break;
	        default:
	            audio_play_sound(global.music,1,1);
	    }
	}



}
