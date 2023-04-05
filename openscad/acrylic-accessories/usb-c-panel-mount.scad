shell_size_x = 30;
shell_size_y = 10;
shell_size_z = 26;
strain_z = 7;
body_z = 19;
mount_z = 4;

height_overlap = 2;

module centered_rounded_cube(size, round_over)
{
    cube(size = [ size[0] - round_over * 2, size[1], size[2] ], center = true);
    cube(size = [ size[0], size[1] - round_over * 2, size[2] ], center = true);

    translate([ size[0] / 2 - round_over, size[1] / 2 - round_over, 0 ])
        cylinder(size[2], round_over, round_over, center = true);
    translate([ (size[0] / 2 - round_over) * -1, size[1] / 2 - round_over, 0 ])
        cylinder(size[2], round_over, round_over, center = true);
    translate([ (size[0] / 2 - round_over) * -1, (size[1] / 2 - round_over) * -1, 0 ])
        cylinder(size[2], round_over, round_over, center = true);
    translate([ size[0] / 2 - round_over, (size[1] / 2 - round_over) * -1, 0 ])
        cylinder(size[2], round_over, round_over, center = true);
}

module offset_rounded_cube(size, round_over)
{
    translate([ size[0] / 2, size[1] / 2, size[2] / 2 ]) centered_rounded_cube(size, round_over);
}

module shell()
{
    translate([ 0, 0, shell_size_z / 2 ]) cube(size = [ shell_size_x, shell_size_y, shell_size_z ], center = true);
}

module strain_relief()
{
    strain_r = 4;
    translate([ 0, 0, strain_z / 2 ]) cylinder(strain_z + height_overlap, strain_r, strain_r, center = true);
}

module body()
{
    body_x = 12;
    body_y = 10;
    body_round_radius = 2;

    translate([ 0, 0, body_z / 2 ]) centered_rounded_cube([ body_x, body_y, body_z + height_overlap ], 2);
}

module mount()
{
    mount_x = 25;
    mount_y = 8;

    translate([ 0, 0, mount_z / 2 ]) centered_rounded_cube([ mount_x, mount_y, mount_z + height_overlap ], 4);
}

module hole()
{
    translate([ 0, 0, strain_z + body_z - mount_z ]) mount();
    translate([ 0, 0, strain_z ]) body();
    translate([ 0, 0, 0 ]) strain_relief();
}

$fa = 1;
$fs = 0.4;
difference()
{
    difference()
    {
        shell();
        hole();
    }
    translate([ -shell_size_x / 2, 0, 0 ])
        cube([ shell_size_x + height_overlap, shell_size_y / 2, shell_size_z + height_overlap ]);
}
