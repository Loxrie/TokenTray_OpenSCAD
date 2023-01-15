// Creates the dividers for the above.
// Again the container_size provided is the internal dimensions.

function calculate_compartment_width(length, cutout_width, num)
    = (length - (num * cutout_width)) / (num+1);
    
function calculate_cutout_offset(compartment_width, cutout_width, i, padding = 0.0)
    = (compartment_width*i) + ((i-1)*cutout_width) + padding;

module create_divider(divider_length = 1.0, divider_width = 2.0, divider_height = 2.0, num = 1)
{
    difference() {
        cube([divider_length + 0.6, divider_width, divider_height + 0.5]);
        cutout_width = divider_width + 0.5;
        compartment_width = calculate_compartment_width(divider_length, cutout_width, num);
        for (i=[1:1:num]) {
            divisor_offset = calculate_cutout_offset(compartment_width, cutout_width, i, 0.3);
            translate([divisor_offset, 0, 0])
                cube([cutout_width, divider_width, (divider_height/2) + 0.25]);
        }
    }
}

module create_dividers(container_size = [1,1,1], divider_width = 2.0, num_horizontal = 2, num_vertical = 1)
{
    for (i=[1:1:num_horizontal]) {
        translate([0,((i-1) * container_size[2]) + ((i-1)*10),divider_width])
            rotate([-90,0,0])
                create_divider(container_size[0], divider_width, container_size[2], num_vertical);        
    }
    for (i=[1:1:num_vertical]) {
        translate([-0.3, ((num_horizontal + (i-1)) * container_size[2]) + ((num_horizontal + (i-1)) * 10), divider_width])
            rotate([-90,0,0])
                create_divider(container_size[1], divider_width, container_size[2], num_horizontal);

    }
}