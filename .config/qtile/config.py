from libqtile import bar, layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen, hook
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
import os
import subprocess

HOME = os.path.expanduser("~")
MOD = "mod4"
TERMINAL = "kitty"
DEF_BROWSER = "brave-browser"
SEC_BROWSER = "vivaldi"
FONTSIZE = 14
WIN_RESZ_PX = 50
WIN_MOVE_PX = 50
FILE_EXPLORER = "nautilus"
COLORS = {
    "white": "#f2f4f8",
    "dark": "#161616",
    "dark1": "#2a2a2a",
    "dark2": "#4a4a4a",
    "gray": "#707880",
    "yellow": "#e5c07b",
    "green": "#46c880",
    "red": "#fe6f70",
    "blue": "#78a9ff",
    "blue1": "#8cb6ff",
    "purple": "#c678dd",
    "cyan": "#56B6c2",
    "magenta": "#ee5396",
}
RECTDEC_PROPS = {
    "colour": COLORS["dark1"],
    "radius": 10,
    "filled": True,
    "padding_y": 5,
}


spacer_widget = widget.Spacer(
    length=8,
    background=COLORS["dark"],
)

layout_widget = widget.CurrentLayout(
    foreground=COLORS["white"],
    fmt="   {} ",
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
groupbox_widget = widget.GroupBox(
    fontsize=FONTSIZE,
    highlight_method="line",
    active=COLORS["blue"],
    borderwidth=2,
    block_highlight_text_color=COLORS["blue"],
    highlight_color=COLORS["dark1"],
    inactive=COLORS["gray"],
    background=COLORS["dark"],
    this_current_screen_border=COLORS["blue"],
    this_screen_border=COLORS["dark2"],
    other_current_screen_border=COLORS["blue"],
    other_screen_border=COLORS["dark2"],
    urgent_border=COLORS["red"],
    urgent_text=COLORS["dark"],
    rounded=True,
    disable_drag=True,
    font="JetBrainsMono Nerd Font, Bold",
    hide_unused=False,
)
tasklist_widget = widget.TaskList(
    background=COLORS["dark"],
    border=COLORS["dark1"],
    foreground=COLORS["white"],
    highlight_method="block",
    urgent_border=COLORS["red"],
    icon_size=16,
    font="JetBrainsMono Nerd Font, Bold",
    margin=0,
    max_title_width=200,
    mouse_callbacks={"Button2": lazy.window.kill()},
    padding_x=10,
    padding_y=5,
    txt_floating="[F] ",
    txt_maximized="[M] ",
    txt_minimized="[m] ",
)
time_widget = widget.Clock(
    format="  %d/%m/%y  %I:%M %p ",
    foreground=COLORS["cyan"],
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
stretch_spacer_widget = widget.Spacer(length=bar.STRETCH, background=COLORS["dark"])
nvidia_widget = widget.GenPollText(
    update_interval=0.02,
    func=lambda: subprocess.check_output(
        [f"{HOME}/.config/qtile/scripts/system-nvidia-smi.sh"]
    )
    .decode()
    .strip("\n"),
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    foreground=COLORS["green"],
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
ibus_widget = widget.GenPollText(
    update_interval=0.02,
    func=lambda: subprocess.check_output(
        [f"{HOME}/.config/qtile/scripts/ibus-engine.sh"]
    )
    .decode()
    .strip("\n"),
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    foreground=COLORS["yellow"],
    mouse_callbacks={"Button1": lazy.spawn(f"{HOME}/.zshrc.d/toggle_language.zsh &")},
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
volume_widget = widget.GenPollText(
    update_interval=0.02,
    func=lambda: subprocess.check_output(
        [f"{HOME}/.config/qtile/scripts/get_volume.sh"]
    )
    .decode()
    .strip("\n"),
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    foreground=COLORS["purple"],
    mouse_callbacks={
        "Button1": lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        "Button4": lazy.spawn("pactl -- set-sink-volume @DEFAULT_SINK@ +2%"),
        "Button5": lazy.spawn("pactl -- set-sink-volume @DEFAULT_SINK@ -2%"),
    },
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
brightness_widget = widget.GenPollText(
    update_interval=0.02,
    func=lambda: subprocess.check_output(
        [f"{HOME}/.config/qtile/scripts/brightnessctl.sh"]
    )
    .decode()
    .strip("\n"),
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    foreground=COLORS["magenta"],
    mouse_callbacks={
        "Button4": lazy.spawn("brightnessctl set +5%"),
        "Button5": lazy.spawn("brightnessctl set 5%-"),
    },
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
battery_widget = widget.GenPollText(
    update_interval=60,
    func=lambda: subprocess.check_output([f"{HOME}/.config/qtile/scripts/battery.sh"])
    .decode()
    .strip("\n"),
    font="JetBrainsMono Nerd Font, Bold",
    fontsize=FONTSIZE,
    foreground=COLORS["blue1"],
    decorations=[RectDecoration(**RECTDEC_PROPS)],
)
systray_widget = widget.Systray(
    background=COLORS["dark"],
    fontsize=FONTSIZE,
    padding=10,
)

def_widgets = [
    spacer_widget,
    layout_widget,
    spacer_widget,
    groupbox_widget,
    spacer_widget,
    tasklist_widget,
    stretch_spacer_widget,
    spacer_widget,
    time_widget,
    stretch_spacer_widget,
    brightness_widget,
    spacer_widget,
    nvidia_widget,
    spacer_widget,
    ibus_widget,
    spacer_widget,
    volume_widget,
    spacer_widget,
    battery_widget,
    spacer_widget,
]

main_bar = bar.Bar(
    def_widgets + [systray_widget, spacer_widget],
    size=35,
    margin=[10, 10, 0, 10],
    background=COLORS["dark"],
)


sec_bar = bar.Bar(
    def_widgets,
    size=35,
    margin=[10, 10, 0, 10],
    background=COLORS["dark"],
)


@lazy.function
def resize_floating_window(qtile, width: int = 0, height: int = 0):
    w = qtile.current_window
    w.cmd_set_size_floating(w.width + width, w.height + height)


@lazy.function
def move_floating_window(qtile, dx: int = 0, dy: int = 0):
    w = qtile.current_window
    w.move_floating(dx, dy)


def go_to_group(name: str):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.groups_map[name].toscreen()
            return

        if name in "123456789":
            qtile.focus_screen(0)
            qtile.groups_map[name].toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].toscreen()

    return _inner


def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i - 1)


def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i + 1)


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # ========================================================================#
    # Windows navigation/manipulation
    # ========================================================================#
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [MOD, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [MOD, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([MOD, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [MOD, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([MOD, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([MOD, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "shift"], "j", lazy.function(window_to_next_screen)),
    Key([MOD, "shift"], "k", lazy.function(window_to_previous_screen)),
    Key(
        [MOD, "control"],
        "j",
        lazy.function(window_to_next_screen, switch_screen=True),
    ),
    Key(
        [MOD, "control"],
        "k",
        lazy.function(window_to_previous_screen, switch_screen=True),
    ),
    Key([MOD], "period", lazy.next_screen(), desc="Next monitor"),
    # ========================================================================#
    # Floating window manipulation
    # ========================================================================#
    Key(
        [MOD, "shift", "control"],
        "l",
        resize_floating_window(width=WIN_RESZ_PX),
        desc=f"increase floating window width by {WIN_RESZ_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "h",
        resize_floating_window(width=-WIN_RESZ_PX),
        desc=f"decrease floating window width by {WIN_RESZ_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "j",
        resize_floating_window(height=WIN_RESZ_PX),
        desc=f"increase floating window height by {WIN_RESZ_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "k",
        resize_floating_window(height=-WIN_RESZ_PX),
        desc=f"decrease floating window height by {WIN_RESZ_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "Up",
        move_floating_window(dx=0, dy=-WIN_MOVE_PX),
        desc=f"Move floating window up by {WIN_MOVE_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "Down",
        move_floating_window(dx=0, dy=WIN_MOVE_PX),
        desc=f"Move floating window down by {WIN_MOVE_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "Left",
        move_floating_window(dx=-WIN_MOVE_PX, dy=0),
        desc=f"Move floating window to the left by {WIN_MOVE_PX}",
    ),
    Key(
        [MOD, "shift", "control"],
        "Right",
        move_floating_window(dx=WIN_MOVE_PX, dy=0),
        desc=f"Move floating window to the right by {WIN_MOVE_PX}",
    ),
    Key(
        [MOD],
        "m",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen",
    ),
    Key(
        [MOD],
        "g",
        lazy.window.toggle_floating(),
        desc="Toggle floating",
    ),
    # ========================================================================#
    # Qtile control
    # ========================================================================#
    Key([MOD, "shift"], "R", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "Escape", lazy.spawn("betterlockscreen -l dimblur"), desc="Lock screen"),
    # ========================================================================#
    # Programs
    # ========================================================================#
    Key(
        [MOD],
        "t",
        lazy.spawn(TERMINAL),
        lazy.function(go_to_group("1")),
        desc="Launch terminal",
    ),
    Key(
        [MOD],
        "b",
        lazy.spawn(DEF_BROWSER),
        lazy.function(go_to_group("2")),
        desc=f"Launch default browser ({DEF_BROWSER})",
    ),
    Key(
        [MOD, "shift"],
        "b",
        lazy.spawn(SEC_BROWSER),
        lazy.function(go_to_group("2")),
        desc=f"Launch secondary browser {SEC_BROWSER}",
    ),
    Key([MOD], "f", lazy.spawn(FILE_EXPLORER), desc=f"Launch {FILE_EXPLORER}"),
    Key(
        [MOD],
        "o",
        lazy.spawn("flatpak run md.obsidian.Obsidian"),
        lazy.function(go_to_group("9")),
        desc=f"Launch Obsidian",
    ),
    Key(
        [MOD],
        "d",
        lazy.spawn(f"{HOME}/.config/rofi/launchers/launcher.sh"),
        desc="Spawn application launcher",
    ),
    Key(
        [MOD, "shift"],
        "P",
        lazy.spawn(f"{HOME}/.config/rofi/powermenu/powermenu.sh"),
        desc="Spawn powermenu",
    ),
    Key(
        [MOD],
        "period",
        lazy.spawn("rofimoji"),
        desc="Spawn rofimoji",
    ),
    Key(
        [MOD, "shift"],
        "Space",
        lazy.spawn(f"{HOME}/.zshrc.d/toggle_language.zsh"),
        desc="Spawn powermenu",
    ),
    Key([], "Print", lazy.spawn("flameshot gui"), desc="Screenshot"),
    Key(
        ["shift"],
        "Print",
        lazy.spawn("flameshot screen -c"),
        desc="Screenshot fullscreen",
    ),
]

group_props_dict = {
    # fmt: off
    "1": {
        "label": " 1",
        "matches": [
            Match(wm_class="kitty"),
            Match(wm_class="Gnome-terminal")
        ],
        "layout": "monadtall",
        "screen_affinity": 0,
    },
    "2": {
        "label": " 2",
        "matches": [
            Match(wm_class="Brave-browser"),
            Match(wm_class="vivaldi-stable")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "3": {
        "label": " 3", 
        "matches": [
            Match(wm_class="Signal"),
            Match(wm_class="TelegramDesktop")
        ],
        "layout": "monadtall",
        "screen_affinity": 0,
    },
    "4": {
        "label": "󰙯 4",
        "matches": [
            Match(wm_class="discord")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "5": {
        "label": " 5",
        "matches": [
            Match(wm_class="zoom")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "6": {
        "label": " 6", 
        "matches": [
            Match(wm_class="mpv"),
            Match(wm_class="vlc")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "7": {
        "label": " 7",
        "matches": [
            Match(wm_class="Code")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "8": {
        "label": "󰏆 8",
        "matches": [
            Match(wm_class="Inkscape")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "9": {
        "label": " 9",
        "matches": [
            Match(wm_class="obsidian"), Match(wm_class="Zotero")
        ],
        "layout": "max",
        "screen_affinity": 0,
    },
    "0": {
        "label": "󰡇 0",
        "matches": [
            Match(wm_class="obs")
        ],
        "layout": "max",
        "screen_affinity": 1,
    },
}
groups = []
for group_name, group_props in group_props_dict.items():
    groups.append(
        Group(
            name=group_name,
            label=group_props["label"],
            matches=group_props["matches"],
            layout=group_props["layout"],
            screen_affinity=group_props["screen_affinity"],
        )
    )


for i in groups:
    keys.append(Key([MOD], i.name, lazy.function(go_to_group(i.name))))
    keys.append(
        Key(
            [MOD, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc=f"Switch to & move focused window to group {i.name}",
        )
    )

layout_theme = {
    "margin": 10,
    "border_focus": COLORS["white"],
    "border_normal": COLORS["dark"],
    "border_width": 3,
}

layouts = [
    layout.MonadTall(**layout_theme, name="monad"),
    layout.Max(**layout_theme, name=" max "),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(top=main_bar),
    Screen(top=sec_bar),
]

# Drag floating layouts.
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=COLORS["blue"],
    border_width=5,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="org.gnome.Nautilus"),  # nautilus
        Match(role="pop-up"),  # pop ups (bitwarden)
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


@hook.subscribe.startup_once
def autostart_once():
    subprocess.run([f"{HOME}/.local/bin/init_stuffs", "-b", "-s"])


# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
