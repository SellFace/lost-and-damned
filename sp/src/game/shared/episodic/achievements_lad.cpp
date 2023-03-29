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
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CHEL_BEAT_DRUNK, "CHEL_BEAT_DRUNK", 3 );
DECLARE_LAD_MAP_EVENT_ACHIEVEMENT( ACHIEVEMENT_CHEL_BEAT_MASSACRE, "CHEL_BEAT_MASSACRE", 4 );

#endif // GAME_DLL