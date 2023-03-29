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
    //if (self.GetActivity().find("ACT_RUN") != null)
        //EntFire("the_player","setplaybackrate","0.75",0.00);

    return newactivity;
}