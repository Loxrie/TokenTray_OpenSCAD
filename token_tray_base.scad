include <tray_vars.scad>

use <lib/create_tray.scad>

// Creates a tray, adds magnet holes, and cuts in divider insets.
difference() {
    create_tray([tray_internal_width,tray_internal_length,tray_internal_height], tray_wall_width, tray_base_height, false, tray_corner_radius);
    add_magnet_holes([tray_internal_width+(tray_wall_width*2),tray_internal_length+(tray_wall_width*2),tray_internal_height+tray_wall_width], [magnet_width,magnet_height], magnet_inset, fudge);
    create_divider_insets([tray_internal_width,tray_internal_length,tray_internal_height], tray_wall_width, tray_base_height, tray_divider_width, tray_horizontal_dividers                            , tray_vertical_dividers);
}
