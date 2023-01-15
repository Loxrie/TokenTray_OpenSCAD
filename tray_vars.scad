// These two values set the accuracy of the rendered output.  The below takes a while
// but is more than good enough for FDM printers.
$fa=1;
$fs=0.2;

// $fa = 1 render time 2m 1s 006
// $fa = 2 render time 1m 48s 067

fudge= $preview ? 0.01 : 0;

tray_internal_width = 120;
tray_internal_length = 200;
tray_internal_height = 40;

tray_divider_width = 2.0;

tray_vertical_dividers = 1;
tray_horizontal_dividers = 2;

tray_corner_radius = 3.0;

tray_wall_width = 3.6;
tray_base_height = 3.2;

tray_lid_height = tray_wall_width + tray_base_height;

// Add 0.5 to width and layer_height to height.
magnet_width = 3.5;
magnet_height = 2.2;
magnet_inset = 1.0;