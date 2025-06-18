#/bin/bash
CONFIG_PATH="./config.ini"
ROOT_PATH="../"
[ $# -lt 2 ] && echo "Usage: ./chcolor.sh {primary|secondary|background etc.} {HEX color e.g. ffffff}" && exit
color_current=$(grep "$1" $CONFIG_PATH | sed -n -e "s/^$1=#//p")
[ -z "$color_current" ] && exit;
color_new=$2
[[ ! "$color_new" =~ ^[a-f]{6}$ ]] && exit;
sed -i -e "s/$color_current/$color_new/g" $(find $ROOT_PATH -type f -name "*.sh" -o -name "*.ini") 2>/dev/null
echo "Success: $color_current -> $color_new"

