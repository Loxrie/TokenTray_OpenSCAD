include <tray_vars.scad>

use <lib/create_tray.scad>
use <lib/create_dividers.scad>
   
// Creates the dividers
create_dividers([tray_internal_width, tray_internal_length, tray_internal_height], tray_divider_width, tray_horizontal_dividers, tray_vertical_dividers);
