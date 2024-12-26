```vhdl
ENTITY shift_register IS
    GENERIC (N : INTEGER := 8);
    PORT (clk : IN STD_LOGIC;
          rst : IN STD_LOGIC;
          data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
          data_out : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF shift_register IS
    SIGNAL shift_reg : STD_LOGIC_VECTOR(N-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            shift_reg <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            shift_reg <= data_in(N-2 DOWNTO 0) & data_in(N-1);
        END IF;
    END PROCESS;
    data_out <= shift_reg;
END ARCHITECTURE;
```