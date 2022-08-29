%% Precedence rules

% Add as many simple bracket as possible so that the result of the given operation is unchanged

% 2+4*-1/3/4
(2 + 4 * -1 / 3 / 4) == (2 + ((4 * (-1)) / 3) / 4)

% 2+4==5|3+5^-1&2
(2 + 4 == 5 | 3 + 5 ^ -1 & 2) == ((((2 + 4) == 5) | (3 + (5 ^ -1))) & 2)

% -3 < 7 < 5
((-3 < 7) < 5)
