Convars.RegisterConvar( "lad_flashlight" "0", "1 if player has flashlight active and 0 if not", FCVAR_NONE )

function NPC_TranslateSchedule()
{
    local newactivity = -1;

    if (schedule == "SCHED_ALERT_FACE")
        newactivity = "SCHED_IDLE_STAND";

    return newactivity;
}

function NPC_TranslateActivity()
{
    local newactivity = -1;
	//print(self.GetActivity());
    if (self.GetActivity().find("ACT_RUN") != null)
	{
        EntFire("the_player","setplaybackrate","0.75",0.00);
		ReloadRunAnimLIMP();
	}
		
    if (self.GetActivity().find("ACT_WALK") != null)
	{
		ReloadWalkAnimLIMP();
	}
    return newactivity;
}

function ReloadWalkAnim()
{
	local weapon = null;
	local drunk = Entities.FindByName(null, "drunkness_timer").GetKeyValue("StartDisabled");
	local has_flashlight = Convars.GetInt("lad_flashlight");
	
	if (self.GetActiveWeapon() != null)
	{
		weapon = self.GetActiveWeapon().GetClassname();
		
	}
	if (weapon == "weapon_crowbar") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK",0.00);
	}
	if (weapon == "weapon_pistol") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK_PISTOL_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_PISTOL_STIMULATED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
			EntFire("flashlight_light","turnon","",0.00);
			EntFire("the_player","setreadinesslow","",0.00);
			EntFire("flashlight_spritereal","showsprite","",0.00);
			EntFire("flashlight_texture","turnon","",0.00);
			EntFire("flashlight_spritereal","setparent","the_player_weapon",0.00);
			EntFire("flashlight_texture","setparent","the_player_weapon",0.00);
			EntFire("flashlight_spritereal","setparentattachment","muzzle",0.03);
			EntFire("flashlight_texture","setparentattachment","muzzle",0.03);
		}
	}
	if (weapon == "weapon_shotgun") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK_AR1_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_AR1_STIMULATED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
		}
	}
	if (weapon == "weapon_bugbait") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK",0.00);
	}
	if ((self.GetHealth() < 20) || (drunk == "0"))
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK_INJURED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_INJURED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_WALK_INJURED2",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_INJURED2",0.00);
		}
	}
}

function ReloadRunAnim()
{
	local weapon = null;
	local drunk = Entities.FindByName(null, "drunkness_timer").GetKeyValue("StartDisabled");
	local has_flashlight = Convars.GetInt("lad_flashlight");
	
	if (self.GetActiveWeapon() != null)
	{
		weapon = self.GetActiveWeapon().GetClassname();
	}
	if (weapon == "weapon_crowbar") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_PISTOL_RELAXED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_PISTOL_RELAXED",0.00);
	}
	if (weapon == "weapon_pistol") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_PISTOL_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_PISTOL_STIMULATED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("flashlight_spritereal","showsprite","",0.00);
			EntFire("flashlight_texture","turnon","",0.00);
			EntFire("flashlight_sprite","setparent","the_player_weapon",0.00);
			EntFire("flashlight_light","turnon","",0.00);
			EntFire("the_player","setreadinesslow","",0.00);
			EntFire("flashlight_spritereal","setparent","the_player_weapon",0.00);
			EntFire("flashlight_texture","setparent","the_player_weapon",0.00);
			EntFire("flashlight_sprite","setparentattachment","muzzle",0.03);
			EntFire("flashlight_spritereal","setparentattachment","muzzle",0.03);
			EntFire("flashlight_texture","setparentattachment","muzzle",0.03);
		}
	}
	if (weapon == "weapon_shotgun") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_AR1_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_AR1_STIMULATED",0.00);
	}
	if (weapon == "weapon_bugbait") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN",0.00);
	}
	if ((self.GetHealth() < 20) || (drunk == "0"))
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_INJURED2",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_INJURED2",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_RUN_INJURED",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_INJURED",0.00);
		}
	}
}

function ReloadWalkAnimLIMP()
{
	local weapon = null;
	local drunk = Entities.FindByName(null, "drunkness_timer").GetKeyValue("StartDisabled");
	local has_flashlight = Convars.GetInt("lad_flashlight");
	
	if (self.GetActiveWeapon() != null)
	{
		weapon = self.GetActiveWeapon().GetClassname();
		
	}
	if (weapon == "weapon_crowbar") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK",0.00);
	}
	if (weapon == "weapon_pistol") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK_PISTOL_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_PISTOL_STIMULATED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
		}
	}
	if (weapon == "weapon_shotgun") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK_AR1_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_AR1_STIMULATED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_PISTOL_RELAXED",0.00);
		}
	}
	if (weapon == "weapon_bugbait") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK",0.00);
	}
	if ((self.GetHealth() < 20) || (drunk == "0"))
	{
		EntFire("walk","addoutput","m_iszPlay ACT_WALK_INJURED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_INJURED",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_WALK_INJURED2",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_WALK_INJURED2",0.00);
		}
	}
}

function ReloadRunAnimLIMP()
{
	local weapon = null;
	local drunk = Entities.FindByName(null, "drunkness_timer").GetKeyValue("StartDisabled");
	local has_flashlight = Convars.GetInt("lad_flashlight");
	
	if (self.GetActiveWeapon() != null)
	{
		weapon = self.GetActiveWeapon().GetClassname();
	}
	if (weapon == "weapon_crowbar") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_PISTOL_RELAXED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_PISTOL_RELAXED",0.00);
	}
	if (weapon == "weapon_pistol") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_PISTOL_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_PISTOL_STIMULATED",0.00);
	}
	if (weapon == "weapon_shotgun") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_AR1_STIMULATED",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_AR1_STIMULATED",0.00);
	}
	if (weapon == "weapon_bugbait") 
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN",0.00);
	}
	if ((self.GetHealth() < 20) || (drunk == "0"))
	{
		EntFire("walk","addoutput","m_iszPlay ACT_RUN_INJURED2",0.00);
		EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_INJURED2",0.00);
		if (has_flashlight == 1)
		{
			EntFire("walk","addoutput","m_iszPlay ACT_RUN_INJURED",0.00);
			EntFire("walk_disabled","addoutput","m_iszPlay ACT_RUN_INJURED",0.00);
		}
	}
}

function Getwep()
{
	local weapon = self.GetActiveWeapon().GetClassname();
	print(weapon);
}

function Init()
{
	Convars.RegisterConvar( "lad_flashlight" "0", "1 if player has flashlight active and 0 if not", FCVAR_NONE )
}
Hooks.Add( this, "OnRestore", Init, "Init" );