dofile("data/scripts/lib/mod_settings.lua")

local mod_id = "MusicIntensityController" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings =
{
    {
        id = "intensity_level",
        ui_name = "Intensity",
        ui_description = "Affects how intense the ambient music is.\n0% is quiet, 20% is mild, 50% is mid, and 100% is max.",
        value_default = 0.2,
        value_min = 0,
        value_max = 1,
        value_display_multiplier = 100,
        value_display_formatting = " $0 %",
        scope = MOD_SETTING_SCOPE_RUNTIME
    },
}


function ModSettingsUpdate( init_scope )
    local old_version = mod_settings_get_version( mod_id )
    mod_settings_update( mod_id, mod_settings, init_scope )
    dofile("mods/MusicIntensityController/files/scripts/modify_energy_level.lua")
end

function ModSettingsGuiCount()
    return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
    mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end