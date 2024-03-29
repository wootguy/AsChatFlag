#include "mmlib.h"
#include <string>

// Description of plugin
plugin_info_t Plugin_info = {
	META_INTERFACE_VERSION,	// ifvers
	"AsChatFlag",	// name
	"1.0",	// version
	__DATE__,	// date
	"w00tguy",	// author
	"https://github.com/wootguy/",	// url
	"ASCHATFLAG",	// logtag, all caps please
	PT_ANYTIME,	// (when) loadable
	PT_ANYPAUSE,	// (when) unloadable
};

enum angelscript_chat_flags {
	ASCHAT_HANDLED, // a plugin handled the current chat message
	ASCHAT_UNHANDLED, // chat was not handled by any angelscript plugins
	ASCHAT_HIDDEN // a plugin wants the message to be hidden, but allowed other plugins to process the chat
};

// cvar that indicates when a chat message is handled by an angelscript plugin
cvar_t* g_angelscript_chat_flag;

void ClientCommand(edict_t* pEntity) {
	g_angelscript_chat_flag->value = ASCHAT_HANDLED;
	RETURN_META(MRES_IGNORED);
}

void PluginInit() {
	g_dll_hooks.pfnClientCommand = ClientCommand;

	// set to -1 to disable plugin
	g_angelscript_chat_flag = RegisterCVar("angelscript_chat_flag", "0", 0, 0);
}

void PluginExit() {}