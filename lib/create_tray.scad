use <roundedcube_simple.scad>
use <create_dividers.scad>

module create_tray(size = [1,1,1], wall = 3.5, base = 3.2, center = false, radius = 0.5) {
    x = size[0];
    y = size[1];
    z = size[2];
    difference() {
        difference() {
            translate([(x/2)+wall,(y/2)+wall,(z/2)+wall])
                roundedcube_simple([x+(wall*2),y+(wall*2),z+(base*2)],true,radius);
            translate([wall,wall,base])
                roundedcube_simple([x,y,z+base],false,3.0);
        }
        translate([-1,0,z+wall])
            cube([x+(wall*2)+2,y+(wall*2)+2,z+base]);
    }   
}

// Removes small circles to slot magnets into from the corners.  magnet size is diameter not radius.
module add_magnet_holes(container_size = [1,1,1], magnet_size = [1,1], inset = 1, fudge = 0.0) {
    // Force render resolution high for these and there's likely not much tolerance.  Even at 3.5mm some came out <2mm in a couple of orientations around the hole..
    $fs=0.1;
    br=magnet_size[0]/2;
    bh=magnet_size[1];
    // Bottom LEft
    translate([inset+br,inset+br, container_size[2] - magnet_size[1] + fudge])
        color("pink") cylinder(h=bh, r=br, center=false);
    // Bottom right
    translate([container_size[0]-br-inset,inset+br, container_size[2] - magnet_size[1] + fudge])
        color("pink") cylinder(h=bh, r=br, center=false);
    // Top Left
    translate([inset+br,container_size[1]-br-inset, container_size[2] - magnet_size[1] + fudge])
        color("pink") cylinder(h=bh, r=br, center=false);
    // Top Right
    translate([container_size[0]-br-inset,container_size[1]-br-inset, container_size[2] - magnet_size[1] + fudge])
        color("pink") cylinder(h=bh, r=br, center=false);
}

// Cuts slots into the tray for the dividers, with a 0.5mm tolerence added.
module create_divider_insets(container_size = [1,1,1], wall_width = 1.0, base_height = 1.0, divider_width = 2.0, num_horizontal = 1.0, num_vertical = 1.0) {
    cutout_width = divider_width + 0.5;
    short_divider_compartment_length = calculate_compartment_width(container_size[1], cutout_width, num_horizontal);
    
    for (i=[1:1:num_horizontal]) {
        short_divider_offset = calculate_cutout_offset(short_divider_compartment_length, cutout_width, i);
        translate([wall_width - 0.5, short_divider_offset + wall_width, base_height - 0.5])
        cube([container_size[0] + 1.0, divider_width + 0.5, container_size[2] + 1.0]);
    }
    
    long_divider_compartment_length = calculate_compartment_width(container_size[0], cutout_width, num_vertical);
    for (i=[1:1:num_vertical]) {
        long_divider_offset = calculate_cutout_offset(long_divider_compartment_length, cutout_width, i);
        translate([long_divider_offset + wall_width, wall_width - 0.5, base_height - 0.5])
        cube([divider_width + 0.5, container_size[1] + 1.0, container_size[2] + 1.0]);
    }
}
