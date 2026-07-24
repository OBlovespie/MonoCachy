
--Source = https://github.com/OBlovespie/MonoCachy


------------------
---- MONITORS ----
------------------


hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@240.00Hz",
    position = "0x0",
    scale    = "1",


})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local browser     = "helium-browser"
local launcher    = "hyprlauncher"
local text editor = "nvim"
local auth agent  = "hyprpolkitagent"
local notification daemon = "swaync"











-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
hl.exec_cmd("nm-applet")
hl.exec_cmd("waybar & hyprpaper")
hl.exec_cmd("systemctl --user start hyprpolkitagent")
hl.exec_cmd("swaync")
hl.exec_cmd("openrgb")
end)





-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")


-----------------------
----- PERMISSIONS -----
-----------------------

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,


        col = {
            active_border   = { colors = {"rgba(242, 243, 244, 1)", "rgba(242, 243, 244, 1)"}, angle = 90 },
          inactive_border = "rgba(00000000)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
          range        = 4,
          render_power = 3,
          color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
          size      = 3,
          passes    = 1,
          vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })


hl.curve("easy",           { type = "spring", mass = 1, stiffness = 180.2633, dampening = 20.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 1, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 2.6, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 1, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 1,    bezier = "easeOutQuint" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 2.7, bezier = "almostLinear", style = "slide & smoothIn & smoothOut" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.7, bezier = "almostLinear", style = "slide & smoothIn & smoothOut" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.7, bezier = "almostLinear", style = "slide & smoothIn & smoothOut" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 3,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})


hl.config({
    master = {
        new_status = "master",
    },
})


hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,
            disable_hyprland_logo   = true,
disable_splash_rendering = true,
middle_click_paste       = false



    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"


hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + A", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("helium-browser"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill waybar && hyprctl dispatch exec waybar"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("swaync"))




-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move to a different workspace with keys 0-9
-- Move a window to a different workspace with keys and shift
hl.bind(mainMod .. " +  1", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <I>"))
hl.bind(mainMod .. " +  2", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅱ>"))
hl.bind(mainMod .. " +  3", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅲ>"))
hl.bind(mainMod .. " +  4", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅳ>"))
hl.bind(mainMod .. " +  5", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅴ>"))
hl.bind(mainMod .. " +  6", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅵ>"))
hl.bind(mainMod .. " +  7", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅶ>"))
hl.bind(mainMod .. " +  8", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅷ>"))
hl.bind(mainMod .. " +  9", hl.dsp.exec_cmd("hyprctl movetoworkspacesilent <Ⅸ>"))


-- Move windows around with keyboard
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))


-- helper: float + exact resize + exact move, based on monitor fractions
local function snap(wFrac, hFrac, xFrac, yFrac)
  return function()
    local mon = hl.get_active_monitor()
    local w = math.floor(mon.width * wFrac / mon.scale)
    local h = math.floor(mon.height * hFrac / mon.scale)
    local x = mon.position.x + math.floor(mon.width * xFrac / mon.scale)
    local y = mon.position.y + math.floor(mon.height * yFrac / mon.scale)

    hl.dispatch(hl.dsp.window.float({ action = "set" }))
    hl.dispatch(hl.dsp.window.resize({ exact = true, x = w, y = h }))
    hl.dispatch(hl.dsp.window.move({ exact = true, x = x, y = y }))
  end
end

-- halves
hl.bind(mainMod .. " + ALT + h", snap(0.5, 1.0, 0.0, 0.0))   -- left half
hl.bind(mainMod .. " + ALT + l", snap(0.5, 1.0, 0.5, 0.0))   -- right half
hl.bind(mainMod .. " + ALT + k", snap(1.0, 0.5, 0.0, 0.0))   -- top half
hl.bind(mainMod .. " + ALT + j", snap(1.0, 0.5, 0.0, 0.5))   -- bottom half

-- quarters
hl.bind(mainMod .. " + ALT + u", snap(0.5, 0.5, 0.0, 0.0))   -- top-left
hl.bind(mainMod .. " + ALT + i", snap(0.5, 0.5, 0.5, 0.0))   -- top-right
hl.bind(mainMod .. " + ALT + n", snap(0.5, 0.5, 0.0, 0.5))   -- bottom-left
hl.bind(mainMod .. " + ALT + m", snap(0.5, 0.5, 0.5, 0.5))   -- bottom-right

-- full float, centered
hl.bind(mainMod .. " + ALT + f", function()
  hl.dispatch(hl.dsp.window.float({ action = "set" }))
  local mon = hl.get_active_monitor()
  hl.dispatch(hl.dsp.window.resize({ exact = true, x = math.floor(mon.width * 0.9), y = math.floor(mon.height * 0.9) }))
  hl.dispatch(hl.dsp.window.center())
end)


for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

    -- Example special workspace (scratchpad)
    hl.bind(mainMod .. " + P",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Scroll through existing workspaces with mainMod + scroll
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Laptop multimedia keys for volume and LCD brightness
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

    -- Requires playerctl
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


    --------------------------------
    ---- WINDOWS AND WORKSPACES ----
    --------------------------------

    local suppressMaximizeRule = hl.window_rule({
        -- Ignore maximize requests from all apps. You'll probably like this.
        name  = "suppress-maximize-events",
        match = { class = ".*" },

        suppress_event = "maximize",
    })


    hl.window_rule({
        name  = "fix-xwayland-drags",
        match = {
            class      = "^$",
            title      = "^$",
            xwayland   = true,
            float      = true,
            fullscreen = false,
            pin        = false,
        },

        no_focus = true,
    })

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,


})
