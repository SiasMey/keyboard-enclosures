module rounded_square(size, round_over)
{
    width = size[0];
    height = size[1];

    square([ width - (round_over * 2), height - (round_over * 2) ], true);

    translate([ 0, height / 2 - round_over / 2 ]) square([ width - (round_over * 2), round_over ], true);
    translate([ 0, -(height / 2 - round_over / 2) ]) square([ width - (round_over * 2), round_over ], true);

    translate([ width / 2 - round_over / 2, 0 ]) square([ round_over, height - (round_over * 2) ], true);
    translate([ -(width / 2 - round_over / 2), 0 ]) square([ round_over, height - (round_over * 2) ], true);

    translate([ width / 2 - round_over, height / 2 - round_over ]) circle(round_over, true);
    translate([ -(width / 2 - round_over), height / 2 - round_over ]) circle(round_over, true);
    translate([ width / 2 - round_over, -(height / 2 - round_over) ]) circle(round_over, true);
    translate([ -(width / 2 - round_over), -(height / 2 - round_over) ]) circle(round_over, true);
}
