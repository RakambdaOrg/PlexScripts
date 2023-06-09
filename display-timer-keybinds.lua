function setOsdConfig()
    mp.command("set osd-scale 0.5")
    mp.command("set osd-align-y left")
    mp.command("set osd-align-y bottom")
end

function setOsdLevel(level)
    setOsdConfig()
    current_level = mp.get_property_number("osd-level")
    diff = current_level - level
    if -0.1 < diff and diff < 0.1 then
        level = 0
    end
    mp.commandv("set", "osd-level", level)
end

function displayTimer()
    setOsdConfig()
    setOsdLevel(2)
end

function displayAllTimer()
    setOsdConfig()
    setOsdLevel(3)
end

mp.add_forced_key_binding("t", "displayTimer", displayTimer)
mp.add_forced_key_binding("y", "displayAllTimer", displayAllTimer)
