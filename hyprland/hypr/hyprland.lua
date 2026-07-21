----------------------
---- SYSTEM SETUP ----
----------------------

hl.monitor({
    output   = "DP-1",
    mode     = "3840x2160",
    position = "1080x0",
    scale    = 1,
})
hl.monitor({
    output   = "DP-2",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = 1,
    transform = 3,
})

hl.on("hyprland.start", function () 
  hl.exec_cmd("awww-daemon & eww daemon")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 2,
        border_size = 0,
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
    },
    animations = {
        enabled = true,
    },
    master = {
        mfact = 0.4,
        new_status = "slave",
        new_on_top = true,
        orientation = "center",
        slave_count_for_center_master = 0,
        smart_resizing = true,
    },
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 2,
        sensitivity = 0,
    },
    cursor = {
      inactive_timeout = 10,
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

local mainMod = "SUPER"
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + semicolon", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + apostrophe", hl.dsp.exec_cmd(terminal .. " -e pulsemixer"))

-- Power options
hl.bind(mainMod .. " + CONTROL + P", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown -P 0'"))
hl.bind(mainMod .. " + CONTROL + R", hl.dsp.exec_cmd("hyprshutdown -t 'Restarting...' --post-cmd 'reboot'"))
hl.bind(mainMod .. " + CONTROL + S", hl.dsp.exec_cmd("systemctl suspend"))

-- Layouts
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = toggle }))
hl.bind(mainMod .. " + ALT + M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = toggle }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + J",  hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K",  hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + ALT + J",  hl.dsp.layout("swapnext"))
hl.bind(mainMod .. " + ALT + K",  hl.dsp.layout("swapprev"))
hl.bind(mainMod .. " + BRACKETLEFT",  hl.dsp.layout("mfact -0.1"))
hl.bind(mainMod .. " + BRACKETRIGHT",  hl.dsp.layout("mfact +0.1"))

hl.bind(mainMod .. " + H",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + L",  hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + ALT + H",  hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + ALT + L",  hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CONTROL + H",  hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + CONTROL + L",  hl.dsp.window.move({ workspace = "r+1" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.on("hyprland.start", function () 
  hl.exec_cmd("awww img ~/.config/wallpapers/wallhaven-rdozdj.jpg & eww open bar")
end)

hl.config({
    decoration = {
        rounding       = 10,
        rounding_power = 2,
        glow = {
            enabled = true,
            range = 8,
            render_power = 3,
            color = "rgba(b03f16aa)",
            color_inactive = "rgba(00000000)"
        }
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeOutBack", { type = "bezier", points = { {0.34, 1.56}, {0.64, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOutBack", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
