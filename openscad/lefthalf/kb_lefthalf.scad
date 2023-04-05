use <../primitives/key_clusters.scad>;
use <../primitives/rounded_square.scad>;

board_width = 175;
board_height = 190;

module plate_key_cutout()
{
    translate([ 20, 40, 0 ]) mirror([ 1, 0, 0 ]) hand_cluster();
}

module plate()
{
    difference()
    {
        rounded_square([ board_width, board_height ], 10);
        plate_key_cutout();
    }
}

module case_cutout()
{
    translate([ 0, 30, 0 ]) rounded_square([ 155, 110 ], 10);
    translate([ -50, -40, 0 ]) square([ 30, 30 ], true);
    translate([ 0, -70, 0 ]) rounded_square([ 155, 30 ], 10);
    translate([ 80, -70, 0 ]) square([ 15, 20 ], true);
}

module case_center()
{
    difference()
    {
        rounded_square([ board_width, board_height ], 10);
        case_cutout();
    }
}

module case_bottom()
{
    rounded_square([ board_width, board_height ], 10);
}

module top_surface_cutout()
{
    translate([ 0, 45, 0 ]) rounded_square([ 65, 80 ], 5);
    translate([ -45, 23, 0 ]) rounded_square([ 47, 45 ], 5);
    translate([ 38, 30, 0 ]) rounded_square([ 27, 80 ], 5);
    translate([ 45, -7.5, 0 ]) rounded_square([ 60, 35 ], 5);
}

module top_surface()
{
    difference()
    {
        rounded_square([ board_width, board_height ], 10);
        top_surface_cutout();
    }
}

module case_clearance_check()
{
    difference()
    {
        case_cutout();
        plate_key_cutout();
    }
}

module top_surface_clearance_check()
{
    difference()
    {
        top_surface_cutout();
        plate_key_cutout();
    }
}

/* translate([+(board_width + 10), +(board_height + 10) ,0]) case_clearance_check(); */
/* translate([-(board_width + 10), +(board_height + 10) ,0]) top_surface_clearance_check(); */

translate([ 0, +(board_height + 10), 0 ]) top_surface();
translate([ +(board_width + 10), 0, 0 ]) plate();
case_center();
translate([ -(board_width + 10), 0, 0 ]) case_bottom();
