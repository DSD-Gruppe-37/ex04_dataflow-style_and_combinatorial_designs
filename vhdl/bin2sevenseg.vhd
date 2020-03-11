LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bin2sevenseg IS
    PORT (
        bin : IN std_logic_vector(3 DOWNTO 0);
        Sseg : OUT std_logic_vector(6 DOWNTO 0)
    );
END bin2sevenseg;

ARCHITECTURE sevenseg OF bin2sevenseg IS

BEGIN
    WITH bin SELECT
        Sseg <= "0000001" WHEN "0000",
        "1111001" WHEN "0001",
        "0010010" WHEN "0010",
        "0110000" WHEN "0011",
        "1001100" WHEN "0100",
        "0100100" WHEN "0101",
        "0100000" WHEN "0110",
        "0001111" WHEN "0111",
        "0000000" WHEN "1000",
        "0001100" WHEN "1001",
        "0001000" WHEN "1010",
        "1100000" WHEN "1011",
        "0110000" WHEN "1100",
        "1000010" WHEN "1101",
        "0110000" WHEN "1110",
        "0111000" WHEN "1111",
        "-------" WHEN OTHERS;
    END sevenseg;