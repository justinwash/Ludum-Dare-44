pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- set global variables --
left,right,up,down,btn1,btn2=0,1,2,3,4,5
black,dark_blue,dark_purple,dark_green,
brown,dark_gray,light_gray,white,red,
orange,yellow,green,blue,indigo,pink,peach=
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

-- lifecycle hooks --
#include main.p8
#include menu.p8
#include gameover.p8
#include buy.p8
#include yarnballs.p8

-- player --
#include player.p8

-- map --
#include map.p8

-- cart info --
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000005000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000
0000000000000000000005000000000000000500000000000000000000000000000000000000000dd10500000000000000000000000000000040000000000000
000000000500050000000550050005000000055000000000000000000000000000000000000000d1111555300000000000000000004000000044000000000000
00000000055555000000005005555500550000500000000000000000000000000000000000000d111105555f02dddddddddd2003444004400004000000000000
0000000005353500000000500535350555500050055000000000000000500000000000000000d111115555550022ddd2222200f4444044440004000000000000
00000000055f555555500550055f5555555505500055000000000000005500000000000000001111555555500022222222220044444444444044000000000000
00000000005555555555550000555555555555000005000000050000000500000005000000081155555550000022222222200004444444444440000000000000
0000000000055555555550000005555555555000000500000005553000050000000555305099855555555500002aaa22aa200000444444444400000000000000
0000000000055555555550000005555555555000005500000005555f005500000005555f55555555555550500022a22aa2200000444444444400000000000000
0000000000055566665550000005556666555000005005555505555500500555550555550a990555555050000022a2a222200000444444444400000000000000
0000000000055000005550000005500000555000000555555555555000055555555555500aa05500550000000022222222200000440000044400000000000000
000000000005500000055000000550000005500000555555555555000055555555555500a0055005500000000222222222200000440000004400000000000000
00000000000500000000500000050000000050000055555555556500055555555555650000000005000000000222222222000000400000000400000000000000
00000000000500000000500000050000000050000005556666650500050555666665005000000000000000000000000000000000400000000400000000000000
00000000000000000000000000000000000000000005050000050500500500000005000500000000000000000000000000000000000000000000000000000000
00000000000000000000005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000050000000000000000000000500000000000000055000000000000000000000000000000500000000000000000000000000000000000
00000000050005000000055000000000000000000000505000500000000555500000000000000000000000000000050000000000000000000000000000000000
00000000055555000000005000000000000000000000505555505000003555550000000000000000000005000000055000000000000000000000000000000000
000000000535350555000050000000000e2ee000000055555550500000c355550000000000000000003555005500005000000000000000000000000000000000
00000000055f555555500550000000002e22ee000000055555555000000c335000000000000000000f5555055550005000000000000000500000000000000000
0000000000555555555555000000000e22e22e200000005555555000c030cc000000000000000000055555555555055000000000000005000000000000000000
0000000000055555555550000000002ee2ee222e0000005555500000000000000000000000000000005555555555550005000500000005500000000000000000
000000000005555555555000000000e2222222ee000000555550000000000000b0b0b0b0b0bb0bbb000555555555500005555500000000500000000000000000
0000000000055566665550000000002eee222ee20000055555550000030303000000000000000000000555555555500005353505550000500000000000000000
000000000005500000555000000000e222eee22e00000555555500000b333b0000000000000000000005556666555000055f5555555005500000000000000000
0000000000055000000550000000000ee22e22e0000055055555000033b3b3300d00000000000000000550000055500000555555555555000000000000000000
00000000000500000000500000000000ee22ee0000000000500500000033300000d0000d00000000000550000005500000055555555550000000000000000000
000000000005000000005000eeeeeeeeeee22000000000005005500003b3b300000ddddddf000000000500000000500000055555555550000000000000000000
000000000000000000000000000000000000000000000000500000000b030b00000ddddddd000000000500000000500000005555555550000000000000000000
000000000000000000000000000000000000000000000000050000000000000000d000d0d0000000000000000000000000000555555500000000000000000000
00008888888800000000000004000040000000000400004000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088cc00cc880000000000000400400000000000040040000000000000000000000000000000000000000000000000000000000000000000000000000000000
0088ccccc7cc88004000000000444400004000000044440000000000000000000000000000000000000000000000000000000000000000000000000000000000
088ccccccc6cc8800400000000404000040000000040400000000000000000000000000000000000000000000000000000000000000000000000000000000000
08ccccccccc6cc8000444444444f4f0000444444444f4f0000000000000000000000000000000000000000000000000000000000000000000000000000000000
08cccccccccccc8000444444444fff0000444444444fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880044444444f0e0000044444444f0e00000000000000000000000000000000000000000000000000000000000000000000000000000000000
8899888888889988000f44fff4f00000004f44fff4f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
889a888888889a880004040004040000004004004040000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666660040040004004000040004004004000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05550000000055500d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0555000000005550d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000d000600009ddd66660dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000006d006600000dd666d666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d0066d066d00000d66666d66d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d066d66d0000000666666dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09ddd6d666d00000000666d66dd000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd66666d0000000090090666d000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00d66666d00d000009009000666d00000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0006666666d0000000000000006600000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000066666ddd000000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000900900d00000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000009000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000dddddddddddddd00ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000dddddddddddddd00d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000ddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111
dddddddddddadddd3b333b3346444464467744644446774446774464444677442677226222267722267722622226772200000000000000000000000011111111
dddddddddddadddd33b333b361111111467444644446744446744464444674442672226222267222267222622226722200000000000000000000000011111111
dddddddddddddddd3b333b3341111111666666666666666666666666666666666666666666666666666666666666666600000000000000000000000011111111
dddddddddddadddd33333333411111114444644496444464444464449644446422226222d622226222226222d622226200000000000000000000000011111111
dddddddddddaddddb333b333611111114444644496444464444464449644446422226222d622226222226222d622226200000000000000000000000011111111
dddddddddddadddd333b333b41111111666666666666666666666666666666666666666666666666666666666666666600000000000000000000000011111111
ddddddddddddddddb333b33341111111467744644446444446774464444644442677226222262222267722622226222200000000000000000000000011111111
dddddddddddadddd3333333361111111467444644446444446744464444644442672226222262222267222622226222200000000000000000000000011111111
dddddd7777ddddddcccccccc41511111666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
dddddd7777ddddddcccccccc41511111444464444644496444446444464449642222622226222d622222622226222d6200000000000000000000000000000000
dddddd7777ddddddcccccccc61511111444464444644496444446444464449642222622226222d622222622226222d6200000000000000000000000000000000
dddddd7777ddddddcccccccc41111111666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
dddddd7777ddddddcccccccc41111111467744644446774446774464444677442677226222267722267722622226772200000000000000000000000000000000
dddddd7777ddddddcccccccc61111111467444644446744446744464444674442672226222267222267222622226722200000000000000000000000000000000
dddddd7777ddddddcccccccc41111111666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
dddddd7777ddddddcccccccc61111111444467744644446444446774464444642222677226222262222267722622226700000000000000000000000000000000
44446744111111110022627626266220444467444644446444446744464444642222672226222262222267222622226700000000000000000000000000000000
66666666666666660022222222222220666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
4964d11dd11dd11d0022262662762620496444464449644449644446444964442d622226222d622226222226222d622200000000000000000000000000000000
496d11dd11dd11d10022222222222220496444464449644449644446444964442d622226222d622226222226222d622200000000000000000000000000000000
66d11dd11dd11d110022662626266220666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
44cccccccccccc110022222222222220444467744644446444446774464444642222677226222262222267722622226200000000000000000000000000000000
44ccccc77ccccc110022726262662620444467444644446444446744464444642222672226222262222267222622226200000000000000000000000000000000
66cccc7cc7cccc110022222222222220666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
49ccc7cccc7ccc110022627626266220496444464449644449644446444964442d622226222d622226222226222d622200000000000000000000000000000000
49cc7cccccc7cc110022222222222220496444464449644449644446444964442d622226222d622226222226222d622200000000000000000000000000000000
66cc77c77c77cc110022262662762620666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
44cccccccccccc110022222222222220444467744644446444446774464444642222677226222262222267722622226700000000000000000000000000000000
44cccccccccccc110022627266266220444467444644446444446744464444642222672226222262222267222622226700000000000000000000000000000000
66111111111111000022222222222220666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
44c4444464444c440022662622762620446444464444644444644446444464442262222622226222262222262222622200000000000000000000000000000000
66c6666666666c660022222222222220666666666666666666666666666666666666666666666666666666666666666600000000000000000000000000000000
__gff__
0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000000000000000010110000000000000000000000000000101000000000000000000000000000001010000000000000000000000000000
__map__
bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbf9600000000000000bfbfbfbfbfcccccccccccccccccccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbf0000000000000000bfbfbfbfbfcccccccccccccccccccccccccccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c5c6c7c4c5c6c7c4c5c6c7c4c5c6c7bf000000000000e2e3bfc8c9cacbc8c9cacbc8c9cacbc8c9cacbcccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d4d5d6d7d4d5d6d7d4d5d6d7d4d5d6d7bf000000000000f2f300d8d9dadbd8d9dadbd8d9dadbd8d9dadbcccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e4e5e6e7e4e5e6e7e4e5e6e7e4e5e6e7bfe2e300000000e2e300e8e9eaebe8e9eaebe8e9eaebe8e9eaebcccccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f4f5f6f7f4f5f6f7f4f5f6f7f4f5f6f7bff2f300e30000f2f300f8f9fafbf8f9fafbf8f9fafbf8f9fafbcc81cccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c4c5c6c7c4c5c6c7c4c5c6c7c4c5c6c7bfe2e3cff300cfe2e300c8c9cacbc8c9cacbc8c9cacbc8c9cacb8181cccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d4d5d6d7d4d5d6d7d4d5d6d7d4d5d6d7bff2f3dff3f2f3f2f300d8d9dadbd8d9dadbd8d9dadbd8d9dadb8181cccc0000000000000000000000cecf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e4e0e1e7e4c3e6e7e0e1e6e7e4e0e1e7bfe2e3efe3e2e3e2e3dde8e9eaebe8e9eaebe8e9eaebe8e9eaeb8181cccc81cdcecfcdcecfcdcecfcddedf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f4f0f1f7f4d3f6f7f0f1f6f7f4f0f1f7bff2f3eff3f2f3f2f3edf8f9fafbf8f9fafbf8f9fafbf8f9fafbcc81cccc81bfdedfdddedfdddedfddbfbf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d2d2d2d2d2d2d2d2d2d2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d2d2d2d2d2d2d2d2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d2d2d2d2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000
c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c0c0c0c0c0c0c0c0c0c0c0c0000000000000000000000000000000000000000000000000000000000000000000000000
c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2d1c0c0c1c0c0d0c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2000000000000000000000000000000000000000000000000000000000000000000000000
c30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c3c3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
