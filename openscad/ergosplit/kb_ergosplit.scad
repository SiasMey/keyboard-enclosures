use <../primitives/rounded_square.scad>;

border_size = 10;
switch_hole_size = 14;
switch_spacing = 19;
corner_round = 10;

board_height = 180;
board_width = 600;
center_cluster_offset = 200;
cluster_rotation = 3;

keywell_width = 140;
keywell_height = 120;
electronicwell_height = 70;
electronic_connection_height = 30;

electronicwell_width = board_width - (border_size * 4) - (keywell_width * 2);

module key_column()
{
    square(switch_hole_size, true);
    translate([ 0, +switch_spacing, 0 ]) square(switch_hole_size, true);
    translate([ 0, -switch_spacing, 0 ]) square(switch_hole_size, true);
}

module ring_column()
{
    square(switch_hole_size, true);
    translate([ switch_spacing * 0.1, switch_spacing, 0 ]) square(switch_hole_size, true);
    translate([ 0, -switch_spacing, 0 ]) square(switch_hole_size, true);
}

module pinky_column()
{
    square(switch_hole_size, true);
    translate([ switch_spacing, switch_spacing * -0.1, 0 ]) square(switch_hole_size, true);
    translate([ 0, -switch_spacing, 0 ]) square(switch_hole_size, true);
}

module key_matrix()
{
    center_offset = -0.25;
    index_offset = 0;
    middle_offset = 0.75;
    ring_offset = 0.15;
    pinky_offset = -0.40;

    translate([ switch_spacing * -1, switch_spacing * (center_offset), 0 ]) key_column();
    translate([ switch_spacing * 0, switch_spacing * (index_offset), 0 ]) key_column();
    translate([ switch_spacing * 1, switch_spacing * (middle_offset), 0 ]) key_column();
    translate([ switch_spacing * 2, switch_spacing * (ring_offset), 0 ]) ring_column();
    translate([ switch_spacing * 3, switch_spacing * (pinky_offset), 0 ]) pinky_column();
}

module hand_cluster()
{
    translate([ switch_spacing * 0, 0, 0 ]) key_matrix();
    translate([ switch_spacing * -2.0, switch_spacing * -2.5, 0 ]) square(switch_hole_size, true);
    translate([ switch_spacing * -0.7, switch_spacing * -2.5, 0 ]) square(switch_hole_size, true);
}

module plate_key_cutout()
{
    translate([ +center_cluster_offset, 30 ]) rotate(cluster_rotation) hand_cluster();

    translate([ -center_cluster_offset, 30 ]) rotate(-cluster_rotation) mirror([ 1, 0, 0 ]) hand_cluster();
}

module keywell_cluster()
{
    translate([ (board_width / 2) - (keywell_width / 2) - border_size, 20 ])
        rounded_square([ keywell_width, keywell_height ], corner_round);

    translate([ (board_width / 2) - (border_size + corner_round) - keywell_width, 25 ])
        square([ border_size + corner_round, electronic_connection_height ], true);
}

module keywell_cutout()
{
    translate([ 0, (board_height / 2 - electronicwell_height / 2) - border_size ])
        rounded_square([ electronicwell_width, electronicwell_height ], corner_round);

    keywell_cluster();

    mirror([ 1, 0, 0 ]) keywell_cluster();
}

module plate()
{
    difference()
    {
        rounded_square([ board_width, board_height ], corner_round);
        plate_key_cutout();
    }
}

module case_center()
{
    difference()
    {
        rounded_square([ board_width, board_height ], corner_round);
        keywell_cutout();
    }
}

module base()
{
    rounded_square([ board_width, board_height ], corner_round);
}

module keywell_clearance_check()
{
    difference()
    {
        keywell_cutout();
        plate_key_cutout();
    }
}

module keyboard_case_plates()
{
    translate([ 0, (board_height + 20) ]) plate();
    case_center();
    translate([ 0, -(board_height + 20) ]) base();
}

/* keywell_clearance_check(); */
keyboard_case_plates();
