LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.ALL;

entity hex_mux is
  port (
    bin: in std_logic_vector(11 downto 0);
    sel: in std_logic_vector(1 downto 0);
    tsseg: out std_logic_vector(20 downto 0)
  ) ;
end hex_mux;

architecture mux of hex_mux is
    signal seg1 : std_logic_vector(6 downto 0);
    signal seg2 : std_logic_vector(13 downto 7);
    signal seg3 : std_logic_vector(20 downto 14);
begin
    b2sseg1 : entity bin2sevenseg
    port map (
        bnum => bin(3 downto 0),
        sevenseg => seg1
    );

    b2sseg2 : entity bin2sevenseg
    port map (
        bnum => bin(7 downto 4),
        sevenseg => seg2
    );

    b2sseg3: entity bin2sevenseg
    port map (
        bnum => bin(11 downto 8),
        sevenseg => seg3
    );

    tsseg <= "000000111010101111111" when sel = "11" else -- "On"
             seg3 & seg2 & seg1 when sel = "10" else
             "011000011110101111010" when sel = "01" else -- "Err"
				 (others => '-');
end mux; -- mux