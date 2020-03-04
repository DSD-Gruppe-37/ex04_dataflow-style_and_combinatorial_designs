LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY hex_mux IS
    PORT (
        bin : IN std_logic_vector(11 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0);
        tsseg : OUT std_logic_vector(20 DOWNTO 0)
    );
END hex_mux;

ARCHITECTURE mux OF hex_mux IS
    SIGNAL seg1 : std_logic_vector(6 DOWNTO 0);
    SIGNAL seg2 : std_logic_vector(13 DOWNTO 7);
    SIGNAL seg3 : std_logic_vector(20 DOWNTO 14);
BEGIN
    b2sseg1 : ENTITY bin2sevenseg
        PORT MAP(
            bnum => bin(3 DOWNTO 0),
            sevenseg => seg1
        );

    b2sseg2 : ENTITY bin2sevenseg
        PORT MAP(
            bnum => bin(7 DOWNTO 4),
            sevenseg => seg2
        );

    b2sseg3 : ENTITY bin2sevenseg
        PORT MAP(
            bnum => bin(11 DOWNTO 8),
            sevenseg => seg3
        );

    tsseg <= "000000111010101111111" WHEN sel = "11" ELSE -- "On"
        seg3 & seg2 & seg1 WHEN sel = "10" ELSE
        "011000011110101111010" WHEN sel = "01" ELSE -- "Err"
        (OTHERS => '-');
END mux; -- mux