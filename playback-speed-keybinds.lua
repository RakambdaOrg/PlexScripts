function setOsdConfig()
    mp.command("set osd-scale 0.5")
    mp.command("set osd-align-y left")
    mp.command("set osd-align-y bottom")
end

function displayCurrentSpeed()
    setOsdConfig()
    speed_level = mp.get_property_number("speed")
    mp.osd_message(string.format("Speed: %.2f", speed_level), 0.5)
end

function stepFwd()
    mp.command("add speed 0.1")
    displayCurrentSpeed()
end

function stepBack()
    mp.command("add speed -0.1")
    displayCurrentSpeed()
end

function speedReset()
    mp.command("set speed 1")
    displayCurrentSpeed()
end

mp.add_forced_key_binding("s", "stepBack", stepBack)
mp.add_forced_key_binding("d", "stepFwd", stepFwd)
mp.add_forced_key_binding("a", "speedReset", speedReset)
