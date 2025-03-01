local intensity_level = ModSettingGetNextValue("MusicIntensityController.intensity_level")
local player_id = EntityGetWithTag("player_unit")[1]
local music_comp_id

if player_id then
    music_comp_id = EntityGetComponent(player_id, "MusicEnergyAffectorComponent")[1]
end
-- 0.2 seems to be okay intense
-- 0.5 seems to be kind of intense
-- 1.0 seems to be very intense
if intensity_level then
    ComponentSetValue2(music_comp_id, "energy_target", intensity_level)
end