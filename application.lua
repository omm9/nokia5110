--[[
	Nokia 5110 LED with PCD8544
	8 November 2018 
	Author: dante@serveronthemove.com.au
	Hardware:
		nodeMCU ESP8266(EX) Devkit V3
		8 pin Nokia 5110 84x48 display w PCD8544

	Wiring:
		LED			->	NodeMCU 8266
		1 - RST		->	D0/GPIO16
		2 - CE (CS)	->	D8/GPIO15 - pull down with 10K to GND
		3 - DC		->	D4/GPIO2
		4 - DIN		->	D7/HMOSI
		5 - CLK		->	D5/HSCLK
		6 - VCC		->	3.3V
		7 - BL		->	Not used in this example
		8 - GND		->	GND

	nodeMCU Firmware Build
		built against the master branch and includes the following modules: file, gpio, i2c, net, node, spi, tmr, u8g2, uart, wifi, tls
		u8g2 - SPI - pcd8544_84x48 module
		u8g2 - fonts: 6x10_tf, 5x8)tf
--]]

-- Variables 
PIN_CS  = 8 -- GPIO15, pull-down 10k to GND
PIN_DC  = 4 -- GPIO2
PIN_RES = 0 -- GPIO16
M_BUS 	= 1

-- Initialise module
spi.setup(M_BUS, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 8, 8)
--gpio.mode(cs, gpio.INPUT, gpio.PULLUP)
disp = u8g2.pcd8544_84x48(M_BUS, PIN_CS, PIN_DC, PIN_RES)

disp:setFontRefHeightExtendedText()
disp:setContrast(125)
disp:setFontPosTop()

-- start
disp:clearBuffer() -- start with clean buffer
disp:setFont(u8g2.font_6x10_tf) -- set 6x10 font
disp:drawStr(1, 1, "Nokia 5110")
disp:drawStr(1, 9, "(PCD8544) test")
disp:drawStr(2, 17, "for nodeMCU")
disp:drawStr(2, 25, "by")
disp:setFont(u8g2.font_5x8_tf) -- switch to smaller font
disp:drawStr(1, 33, "Omkar")
disp:drawStr(48, 39, " :D ")
disp:sendBuffer() -- sent buffer to display

-- and done
