path=$(dirname $(realpath "$0"))

dconf reset -f /org/mate/
sleep 1

# apariencia
gsettings set org.mate.interface gtk-theme 'MateTheme'
gsettings set org.mate.Marco.general theme 'MateTheme'
gsettings set org.mate.interface icon-theme 'WhiteSur'

# centra la ventana al inicio
# desabilitar animacion al minimizar las ventanas
gsettings set org.mate.interface enable-animations false


# desabilita el movimiento de ventanas con el modificador <Alt>
gsettings set org.mate.Marco.general mouse-button-modifier ''
gsettings set org.mate.Marco.general center-new-windows true

# layout de panel
python3 $path/panel_setup.py
gsettings set org.mate.panel default-layout $path/panels.layout
mate-panel --reset

cp ./mate_config/panels_pref.layout /tmp/pref.layout
sed -i "s|{path}|$path|g" /tmp/pref.layout

dconf load /org/mate/panel/ < /tmp/pref.layout
# ......

# WorkSpaces
gsettings set org.mate.Marco.general num-workspaces 5

gsettings set org.mate.Marco.workspace-names name-1 '.  Web  .'
gsettings set org.mate.Marco.workspace-names name-2 'Code'
gsettings set org.mate.Marco.workspace-names name-3 'VFX-1'
gsettings set org.mate.Marco.workspace-names name-4 'VFX-2'
gsettings set org.mate.Marco.workspace-names name-5 'Misc'

# Terminal
function term_set() {
    dconf write /org/mate/terminal/profiles/default/$1 \'"$2"\'
}

function term_set_bool() {
    dconf write /org/mate/terminal/profiles/default/$1 $2
}

term_set 'background-color' '#252a31'
term_set 'foreground-color' '#abb2bf'
term_set 'font' 'Cousine NF 12'
term_set 'scrollbar-position' 'hidden'
term_set_bool 'use-system-font' 'false'
term_set_bool 'default-show-menubar' 'false'


# caja
gsettings set org.mate.caja.preferences default-folder-viewer 'list-view'

# shortcuts
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-1 '<Mod4>1'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-2 '<Mod4>2'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-3 '<Mod4>3'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-4 '<Mod4>4'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-5 '<Mod4>5'

gsettings set org.mate.Marco.window-keybindings move-to-workspace-1 '<Shift><Mod4>1'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-2 '<Shift><Mod4>2'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-4 '<Shift><Mod4>4'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-3 '<Shift><Mod4>3'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-4 '<Shift><Mod4>4'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-5 '<Shift><Mod4>5'

gsettings set org.mate.Marco.window-keybindings move-to-side-e '<Alt><Mod4>l' # right
gsettings set org.mate.Marco.window-keybindings move-to-side-s '<Alt><Mod4>j' # down
gsettings set org.mate.Marco.window-keybindings move-to-side-w '<Alt><Mod4>h' # left
gsettings set org.mate.Marco.window-keybindings move-to-side-n '<Alt><Mod4>k' # up
gsettings set org.mate.Marco.window-keybindings move-to-corner-ne '<Alt><Mod4>o' # top right
gsettings set org.mate.Marco.window-keybindings move-to-corner-nw '<Alt><Mod4>y' # top left
gsettings set org.mate.Marco.window-keybindings move-to-corner-se '<Alt><Mod4>period' # bottom right
gsettings set org.mate.Marco.window-keybindings move-to-corner-sw '<Alt><Mod4>n' # bottom left
gsettings set org.mate.Marco.window-keybindings move-to-center '<Alt><Mod4>semicolon' #semicolon es ;

gsettings set org.mate.Marco.window-keybindings toggle-maximized '<Shift><Mod4>semicolon'
gsettings set org.mate.Marco.window-keybindings toggle-fullscreen '<Mod4>f'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-prev '<Mod4>z'

gsettings set org.mate.Marco.window-keybindings tile-to-corner-nw '<Shift><Mod4>y'
gsettings set org.mate.Marco.window-keybindings tile-to-corner-se '<Shift><Mod4>period'
gsettings set org.mate.Marco.window-keybindings tile-to-side-e '<Shift><Mod4>i'
gsettings set org.mate.Marco.window-keybindings tile-to-corner-ne '<Shift><Mod4>o'
gsettings set org.mate.Marco.window-keybindings tile-to-corner-sw '<Shift><Mod4>n'
gsettings set org.mate.Marco.window-keybindings tile-to-side-w '<Shift><Mod4>u'

gsettings set org.mate.Marco.window-keybindings maximize-vertically '<Shift><Mod4>k'
gsettings set org.mate.Marco.window-keybindings maximize-horizontally '<Shift><Mod4>h'

gsettings set org.mate.Marco.window-keybindings minimize '<Control><Alt>h' # hide
gsettings set org.mate.Marco.window-keybindings close '<Shift><Mod4>c'

gsettings set com.solus-project.brisk-menu hot-key '<Mod4>o'

add_custom_key() {
    dconf write /org/mate/desktop/keybindings/custom$1/name \'$2\'
    dconf write /org/mate/desktop/keybindings/custom$1/binding \'$3\'
    dconf write /org/mate/desktop/keybindings/custom$1/action \'"$4"\'
}

function action()
{
    add_custom_key $1 $2 $3 "python3 $path/../python_scripts/desktop_actions.py $4"
}

add_custom_key 1 'gnome_terminal' '<Shift><Mod4>Return' 'mate-terminal'
add_custom_key 2 'chrome' '<Mod4>g' 'google-chrome-stable'
add_custom_key 3 'caja' '<Mod4>c' 'caja /home'
add_custom_key 5 'tiling' '<Mod4>space' "python3 $path/../python_scripts/tiling.py"
add_custom_key 6 'pluma' '<Mod4>e' 'pluma'
add_custom_key 7 'session_restore' '<Shift><Mod4>r' 'session restore missing'
add_custom_key 8 'session_save' '<Shift><Mod4>s' 'session save'

action 15 'move_left' '<Control><Mod4>h' 'workspace_move_left'
action 16 'move_right' '<Control><Mod4>l' 'workspace_move_right'

action 17 'left_focus' '<Mod4>h' 'left_focus'
action 18 'right_focus' '<Mod4>l' 'right_focus'
action 19 'top_focus' '<Mod4>k' 'top_focus'
action 20 'bottom_focus' '<Mod4>j' 'bottom_focus'

action 21 'reset_window' '<Alt><Mod4>u' 'reset_window'

# Touchpad Settings
gsettings set org.mate.peripherals-touchpad natural-scroll true
gsettings set org.mate.peripherals-touchpad tap-to-click true
gsettings set org.mate.peripherals-touchpad motion-threshold 3

# Power Manager Settings
gsettings set org.mate.power-manager backlight-battery-reduce false


