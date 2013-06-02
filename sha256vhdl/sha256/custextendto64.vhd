----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:05 06/01/2013 
-- Design Name: 
-- Module Name:    extendto64 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.array64.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity custextendto64 is
	
		Port(	clk: in STD_LOGIC;
				chunk32_2,chunk32_3,chunk32_4,chunk32_5,chunk32_6,chunk32_7,chunk32_8,chunk32_9,chunk32_10,chunk32_11,chunk32_12,chunk32_13,chunk32_14,chunk32_15,chunk32_16,chunk32_17: in STD_LOGIC_VECTOR(31 downto 0);
				extpart : out arrayofvectors61 := (others=> (others=> '0')));
end custextendto64;

architecture Behavioral of custextendto64 is
		signal wordsext_out : arrayofvectors61;

begin
	wordsext_out(2) <= chunk32_2;
	wordsext_out(3) <= chunk32_3;
	wordsext_out(4) <= chunk32_4;
	wordsext_out(5) <= chunk32_5;
   wordsext_out(6) <= chunk32_6;
   wordsext_out(7) <= chunk32_7;
  	wordsext_out(8) <=	chunk32_8;
	wordsext_out(9) <= chunk32_9;
	wordsext_out(10) <= chunk32_10;
	wordsext_out(11) <= chunk32_11;
	wordsext_out(12) <= chunk32_12;
   wordsext_out(13) <= chunk32_13;
   wordsext_out(14) <= chunk32_14;
  	wordsext_out(15) <= chunk32_15;
   wordsext_out(16) <= chunk32_16;
  	wordsext_out(17) <= chunk32_17;
	
	process(clk)
	variable vwords : arrayofvectors61 := wordsext_out;
	variable s0,s1  	: std_logic_vector (31 downto 0);
	begin
		if (clk'event and clk = '1') then
			vwords := wordsext_out;
			for i in 18 to 63 loop
				s0 := (vwords(i-15)(6 downto 0)&vwords(i-15)(31 downto 7)) xor (vwords(i-15)(17 downto 0)&vwords(i-15)(31 downto 18)) xor ("000"&vwords(i-15)(31 downto 3));
				s1 := (vwords(i-2)(16 downto 0)&vwords(i-2)(31 downto 17)) xor (vwords(i-2)(18 downto 0)&vwords(i-2)(31 downto 19)) xor ("0000000000"&vwords(i-2)(31 downto 10));
				vwords(i):=vwords(i-16)+s0+vwords(i-7)+s1;
			end loop;
			extpart<=vwords;
		end if;
	end process;
end Behavioral;

