local speed_level = 1

-- Whether to enable global playback speed by default
local global_speed = true

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

function speedTwo()
    mp.command("set speed 2")
    displayCurrentSpeed()
end

function speedThree()
    mp.command("set speed 3")
    displayCurrentSpeed()
end

function on_file_loaded()
    if global_speed then
        mp.set_property("speed", speed_level)
    else
        mp.set_property("speed", 1)
        speed_level = 1
    end
end

function toggle_global_speed()
    setOsdConfig()
    global_speed = not global_speed
    if global_speed then
        mp.osd_message("Global Speed: ON")
    else
        mp.osd_message("Global Speed: OFF")
    end
end

mp.add_forced_key_binding("s", "stepBack", stepBack)
mp.add_forced_key_binding("d", "stepFwd", stepFwd)
mp.add_forced_key_binding("a", "speedReset", speedReset)
mp.add_forced_key_binding("g", "toggle_global_speed", toggle_global_speed)

mp.add_forced_key_binding("l", "speedTwo", speedTwo)
mp.add_forced_key_binding("m", "speedThree", speedThree)

mp.register_event("file-loaded", on_file_loaded)