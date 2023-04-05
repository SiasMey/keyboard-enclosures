switch_hole_size = 14;
switch_spacing = 19;

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
