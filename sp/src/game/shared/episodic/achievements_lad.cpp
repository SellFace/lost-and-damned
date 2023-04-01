//=============================================================================//
#include "cbase.h"

#ifdef GAME_DLL

#include "achievementmgr.h"
#include "baseachievement.h"
#include "iservervehicle.h"

// Ep2-specific macro that sets game dir filter.  We need this because Ep1/Ep2/... share a binary so we need runtime check against running game.
#define DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( achievementID, achievementName, iPointValue )					\
	DECLARE_MAP_EVENT_ACHIEVEMENT_( achievementID, achievementName, "lost_and_damned", iPointValue, false )

#define DECLARE_LAD_MAP_EVENT_ACHIEVEMENT_HIDDEN( achievementID, achievementName, iPointValue )					\
	DECLARE_MAP_EVENT_ACHIEVEMENT_( achievementID, achievementName, "lost_and_damned", iPointValue, true )

// achievements which are won by a map event firing once
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_BEAT_GAME, "CAMP_BEAT_GAME", 1 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_BEAT_GAMEONEHOUR, "CAMP_BEAT_GAMEONEHOUR", 2 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_BEAT_GAMEPERMADEATH, "CAMP_BEAT_GAMEPERMADEATH", 3 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_GET_SHOTGUN, "CAMP_GET_SHOTGUN", 4 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_GET_DRUNK, "CAMP_GET_DRUNK", 5 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_DRUNK_DEATH, "CAMP_DRUNK_DEATH", 6 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_BEAT_MAZE, "CAMP_BEAT_MAZE", 7 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_DMGD_BYBOSS1, "CAMP_DMGD_BYBOSS1", 8 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_DMG_BOSS2, "CAMP_DMG_BOSS2", 9 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_KILL_BOSS2, "CAMP_KILL_BOSS2", 10 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_COLLECT_AMMO, "CAMP_COLLECT_AMMO", 11 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CAMP_KILL_CROWBAR, "CAMP_KILL_CROWBAR", 12 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CHEL_BEAT_DRUNK, "CHEL_BEAT_DRUNK", 13 );

#endif // GAME_DLL