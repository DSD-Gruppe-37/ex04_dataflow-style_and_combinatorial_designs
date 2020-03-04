LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY UnitUnderTest IS
    PORT (
        SW   : IN std_logic_vector(11 DOWNTO 0);
        KEY  : IN std_logic_vector(1 downto 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0);
        HEX1 : OUT std_logic_vector(6 DOWNTO 0);
        HEX2 : OUT std_logic_vector(6 DOWNTO 0)
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

    UUT1 : entity hex_mux
    port map
    (
        -- INPUTS
        bin => SW,
        sel => KEY,
        tsseg(6 downto 0) => HEX0,
        tsseg(13 downto 7) => HEX1,
        tsseg(20 downto 14) => HEX2
    );

END structural; -- structural