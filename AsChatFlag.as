void print(string text) { g_Game.AlertMessage( at_console, text); }
void println(string text) { print(text + "\n"); }

enum angelscript_chat_flags {
	ASCHAT_HANDLED, 	// a plugin handled the current chat message (metamod sets this value before angelscript hooks run)
	ASCHAT_UNHANDLED, 	// chat was not handled by any angelscript plugins
	ASCHAT_HIDDEN 		// a plugin wants the message to be hidden, but allowed other plugins to process the chat
}

void PluginInit() {
	g_Module.ScriptInfo.SetAuthor( "w00tguy" );
	g_Module.ScriptInfo.SetContactInfo( "https://github.com/wootguy" );
	
	g_Hooks.RegisterHook( Hooks::Player::ClientSay, @ClientSay );
}

HookReturnCode ClientSay( SayParameters@ pParams ) {
	int val = pParams.ShouldHide ? ASCHAT_HIDDEN : ASCHAT_UNHANDLED;
	g_EngineFuncs.ServerCommand("angelscript_chat_flag " + val + "\n");
	g_EngineFuncs.ServerExecute();
	return HOOK_CONTINUE;
}
