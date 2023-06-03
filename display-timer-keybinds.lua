function displayTimer()
    mp.command("set osd-scale 0.5")
    mp.command("set osd-align-y left")
    mp.command("set osd-align-y bottom")
    mp.command("set osd-level 2")
    mp.osd_message("Timer shown")
end

function hideTimer()
    mp.command("set osd-level 0")
    mp.osd_message("Timer hidden")
end

mp.add_forced_key_binding("t", "displayTimer", displayTimer)
mp.add_forced_key_binding("y", "hideTimer", hideTimer)
