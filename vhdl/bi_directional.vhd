LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bi_directional IS
    PORT (
        KEY : IN std_logic_vector(3 DOWNTO 2);
        SW : IN std_logic_vector(0 DOWNTO 0);
        LEDR : OUT std_logic_vector(1 DOWNTO 0);
        GPIO_1 : INOUT std_logic_vector(1 DOWNTO 0)
    );
END;

ARCHITECTURE bi_port OF bi_directional IS
BEGIN
    GPIO_1(0) <= NOT KEY(3) WHEN SW(0) = '1' ELSE
    'Z';

    GPIO_1(1) <= NOT KEY(2) WHEN NOT SW(0) = '1' ELSE
    'Z';

    LEDR(0) <= NOT KEY(3) WHEN SW(0) = '1' ELSE
    GPIO_1(0);

    LEDR(1) <= NOT KEY(2) WHEN NOT SW(0) = '1' ELSE
    GPIO_1(1);
END;