LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY table_lookup IS
    PORT (
        a, b, c : IN std_logic;
        x : OUT std_logic
    );
END table_lookup;

ARCHITECTURE lookup OF table_lookup IS
    CONSTANT table : std_logic_vector(0 TO 7) := "11010--1";
BEGIN
    x <= table(to_integer(unsigned'(a, b, c)));
END lookup;