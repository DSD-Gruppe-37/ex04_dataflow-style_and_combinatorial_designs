LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY UnitUnderTest IS
    PORT (
        SW : IN std_logic_vector(17 DOWNTO 0);
        KEY : IN std_logic_vector(3 DOWNTO 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0);
        HEX1 : OUT std_logic_vector(6 DOWNTO 0);
        HEX2 : OUT std_logic_vector(6 DOWNTO 0);
        LEDR : OUT std_logic_vector(0 DOWNTO 0)
    );
END;
ARCHITECTURE structural OF UnitUnderTest IS

BEGIN
    -- UUT0 : ENTITY bin2sevenseg
    --     PORT MAP
    --     (
    --         -- INPUTS
    --         bin(3 DOWNTO 0) => SW(3 DOWNTO 0),
    --         -- OUTPUTS
    --         Sseg(6 DOWNTO 0) => HEX0
    --     );

    -- UUT1 : ENTITY hex_mux
    --     PORT MAP
    --     (
    --         -- INPUTS
    --         bin => SW(11 DOWNTO 0),
    --         sel => KEY(1 DOWNTO 0),
    --         -- OUTPUTS
    --         tsseg(6 DOWNTO 0) => HEX0,
    --         tsseg(13 DOWNTO 7) => HEX1,
    --         tsseg(20 DOWNTO 14) => HEX2
    --     );

    UUT2 : ENTITY table_lookup
        PORT MAP
        (
            -- INPUTS
            a => SW(2),
            b => SW(1),
            c => SW(0),
            -- OUTPUTS
            x => LEDR(0)
        );

END structural; -- structural