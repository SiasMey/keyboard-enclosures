shell_size_x = 18 + 5 + 5;
shell_size_y = 63;
shell_size_z = 10;

strain_relief_height = 6;
strain_relief_y = shell_size_y - 3 - 34;
strain_relief_x = 12;

module kb2040()
{
    translate([ 0, 0, 1.25 ]) cube(size = [ 33, 18, 2.5 ], center = true);
}

module mcu_base()
{

    mcu_base_x = 12;
    mcu_base_z = (shell_size_z - strain_relief_height) / 2;
    mcu_retainer_y = 3;

    translate([ -mcu_base_x / 2, 0, 0 ]) cube(size = [ mcu_base_x, shell_size_y, mcu_base_z ]);

    translate([ -mcu_base_x / 2, shell_size_y - mcu_retainer_y, mcu_base_z ])
        cube(size = [ mcu_base_x, mcu_retainer_y, shell_size_z / 2 - mcu_base_z ]);
}

module strain_relief()
{
    mcu_base_z = (shell_size_z - strain_relief_height) / 2;
    connector_shell_y = 20;
    cable_strain_relief_y = 7;
    cable_strain_relief_x = 7;
    difference()
    {
        translate([ -shell_size_x / 2, 0, 0 ]) cube(size = [ shell_size_x, strain_relief_y, shell_size_z ]);

        translate([ -strain_relief_x / 2, strain_relief_y - connector_shell_y, mcu_base_z ])
            cube(size = [ strain_relief_x, connector_shell_y, shell_size_z ]);

        translate([ -cable_strain_relief_x / 2, 0, mcu_base_z ])
            cube(size = [ cable_strain_relief_x, cable_strain_relief_y, shell_size_z ]);
    }
}

strain_relief();
mcu_base();
