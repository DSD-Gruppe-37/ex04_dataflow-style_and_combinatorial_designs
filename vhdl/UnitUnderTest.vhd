LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY UnitUnderTest IS
    PORT (
        SW : IN std_logic_vector(2 DOWNTO 0);
        LEDR : OUT std_logic_vector(0 DOWNTO 0)
    );
END;
ARCHITECTURE structural OF UnitUnderTest IS

BEGIN
    -- UUT0 : ENTITY bin2sevenseg
    -- PORT MAP
    -- (
    -- INPUTS
    -- bnum(3 downto 0) => SW(3 downto 0),
    -- OUTPUTS
    -- sevenseg(6 downto 0) => HEX0(6 downto 0)
    -- );

    -- UUT1 : entity hex_mux
    -- port map
    -- (
    -- INPUTS
    -- bin => SW,
    -- sel => KEY,
    -- tsseg(6 downto 0) => HEX0,
    -- tsseg(13 downto 7) => HEX1,
    -- tsseg(20 downto 14) => HEX2
    -- );

    UUT2 : ENTITY table_lookup
        PORT MAP
        (
            a => SW(2),
            b => SW(1),
            c => SW(0),
            x => LEDR(0)
        );

END structural; -- structural