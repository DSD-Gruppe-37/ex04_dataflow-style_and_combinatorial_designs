LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ALL;

ENTITY UnitUnderTest IS
    PORT (
        SW : IN std_logic_vector(3 DOWNTO 0);
        HEX0 : OUT std_logic_vector(6 DOWNTO 0)
    );
END;
ARCHITECTURE structural OF UnitUnderTest IS

BEGIN
    UUT0 : ENTITY bin2sevenseg
    PORT MAP
    (
        -- INPUTS
        bnum(3 downto 0) => SW(3 downto 0),
        -- OUTPUTS
        sevenseg(6 downto 0) => HEX0(6 downto 0)
    );

END structural; -- structural