if CLIENT then return end 
local disablePrinting = CreateConVar("peplus_disable_blacklist_printing", "0", FCVAR_NONE, "\"this particle effect is blacklisted\"", 0, 1)

--uses patterns, can also just use plain text
peplus_blacklist = {
    "^unusual_mayor%w*", --(i.e unusual_mayor_balloonicorn_teamcolor_red)
    --"someothervalue",
}

hook.Add("PlayerSpawnParticle", "PEPlus_Blacklist", function(ply, name, pcf_original, path)
    for _, pattern in ipairs(peplus_blacklist) do 
        if name:match(pattern) then 
            if not disablePrinting:GetBool() then ply:ChatPrint(string.format("This particle effect is blacklisted! (%s)", name)) end
            return false 
        end 
    end
end)