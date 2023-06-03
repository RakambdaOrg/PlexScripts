function displayCurrentSpeed()
    speed_level = mp.get_property("speed")
    mp.osd_message(string.format("Speed: %.2f", speed_level), 0.5)
end

function increaseSpeed()
    mp.command("add speed 0.1")
    displayCurrentSpeed()
end

function decreaseSpeed()
    mp.command("add speed -0.1")
    displayCurrentSpeed()
end

function resetSpeed()
    mp.command("set speed 1")
    displayCurrentSpeed()
end

mp.add_forced_key_binding("s", "increaseSpeed", increaseSpeed)
mp.add_forced_key_binding("d", "decreaseSpeed", decreaseSpeed)
mp.add_forced_key_binding("a", "resetSpeed", resetSpeed)
