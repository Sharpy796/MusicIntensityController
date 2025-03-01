dofile_once( "data/scripts/lib/utilities.lua" )

function OnPlayerSpawned(player_id)
    if not GameHasFlagRun("music_intensity_controller_comp_added") then
        EntityAddComponent2(player_id, "MusicEnergyAffectorComponent", {energy_target=0.2,is_enemy=false,fog_of_war_threshold=255,trigger_danger_music=true})
        -- print("MusicEnergyAffectorComponent added to player!")
        GameAddFlagRun("music_intensity_controller_comp_added")
    end
    dofile("mods/MusicIntensityController/files/scripts/modify_energy_level.lua")
end