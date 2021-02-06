100 '部屋の大きさを求めるアプリ
110 '2019.03.05
120 'トップ画面 2021.01.27
130 'TopScreen
140 'バージョン番号
150 VersionNo$ = "0.0.6.20210206"
160 Main_Menu:
170 cls 3:
180 '画像領域  ここから
190 line (0,0) - (800,25),rgb(0,0,255),bf
200 LINE (0,25) - (800,25*6+20),rgb(127,255,212),bf
210 line (0,25*6+20) - (800,25*8+75),rgb(0,255,0),bf
220 '画像領域  ここまで
230 talk "メインメニューです。番号を選んでエンターキーをおしてください。"
240 color rgb(255,255,255)
250 print "土地計算機 Lightメインメニュー" + chr$(13)
260 color rgb(255,0,255)
270 print "1.土地の面積または距離を求める" + chr$(13)
280 print "2.バージョン" + chr$(13)
290 print "3.プログラムの終了"+chr$(13)
300 color rgb(0,0,0)
310 print "番号を選んでください" + chr$(13)
320 INPUT "番号：",keyNo
330 If  keyNo = 1  then goto MainScreen:
340 if  keyNo = 2 then goto Version_Menu:
350 if  keyNo = 3 then color rgb(255,255,255):CLS 3:end
360 if keyNo > 3 or keyNo = 0 then ui_msg"1 〜 3で入れてください":cls:goto Main_Menu:
370 'メイン画面
380 MainScreen:
390 '描画領域 ここから
400 cls 3
410 line (0,0)-(800,25),rgb(0,0,255),bf
420 line (0,25)-(800,25+25*8+25-15),rgb(127,255,212),bf
430 line (0,25+25*8+25-15)-(800,25*12+15),rgb(0,255,0),bf
440 '描画領域 ここまで
450 talk"歩数から面積もしくは距離を求めるかを選択してください。"
460 color rgb(255,255,255)
470 print "1-1.土地または面積を求める"+chr$(13)
480 color rgb(255,0,255)
490 print "1.歩数から土地の面積を求める" + chr$(13)
500 print "2.歩数から距離を求める" + chr$(13)
510 print "3.前の画面に戻る"+ chr$(13)
520 print "4.プログラムの終了"+chr$(13)
530 color rgb(0,0,0)
540 print "番号を選んでください"+chr$(13)
550 input "番号:",keyNo
560 if keyNo = 1 then goto MensekiScreen:
570 if keyNo = 2 then goto KyoriScreen:
580 if keyNo = 3 then goto Main_Menu:
590 if keyNo = 4 then color rgb(255,255,255):cls 3:end
600 if keyNo > 4 then talk"数字を入れ直してください":ui_msg"1〜4で入れてください":goto MainScreen:
610 '面積を求める
620 MensekiScreen:
630 cls 3
640 '描画領域 ここから
650 line (0,0)-(800,25),rgb(0,0,255),bf
660 line (0,25)-(800,75),rgb(127,255,212),bf
670 line (0,75)-(800,75+50),rgb(0,255,0),bf
680 '描画領域 ここまで
690 talk "身長から歩数を入力して面積を求めます。スペースキーを押してください。"
700 color rgb(255,255,255)
710 print "土地計算機 Light面積計算" + chr$(13)
720 color rgb(255,0,255)
730 print "身長から１歩の長さを求めて歩数を入力して面積を求めます"+chr$(13)
740 color rgb(0,0,0)
750 print "スペースキーを押してください" + chr$(13)
760 key$ = input$(1)
770 '身長入力:Sinchou_Nyuryokuへ飛ぶ
780 if key$ = " " then
790 goto Sinchou_Nyuryoku:
800 else
810 ui_msg "スペースキーを押してください"
820 goto MensekiScreen:
830 endif
840 '
850 '身長入力:Sinchou_Nyuryoku:
860 Sinchou_Nyuryoku:
870 cls 3
880 '描画領域 ここから
890 line (0,0)-(800,25),rgb(0,0,255),bf
900 line (0,25)-(800,75),rgb(127,255,212),bf
910 line (0,75)-(800,125),rgb(0,255,0),bf
920 '描画領域 ここまで
930 talk "あなたの身長を入れてください"
940 color rgb(255,255,255)
950 print "身長入力" + chr$(13)
960 color rgb(255,0,255)
970 print"あなたの身長を入れてください" + chr$(13)
980 color rgb(0,0,0)
990 Input "あなたの身長(cm):" , height
1000 'walkstep:一歩の長さ
1010 walkstep = height * 0.37
1020 cls
1030 talk "縦の歩数を入れてください"
1040 color rgb(255,255,255)
1050 PRINT "縦の長さ" + chr$(13)
1060 color rgb(255,0,255)
1070 print"縦の歩数を入れてください" + chr$(13)
1080 color rgb(0,0,0)
1090 Input"縦の歩数(歩):",TateStep:TateCount = TateStep * walkstep
1100 cls
1110 talk "横の歩数を入れてください"
1120 color rgb(255,255,255)
1130 print "横の長さ" + chr$(13)
1140 color rgb(255,0,255)
1150 print"横の歩数を入れてください" + chr$(13)
1160 color rgb(0,0,0)
1170 Input"横の歩数(歩):",YokoStep:YokoCount = YokoStep * walkstep
1180 S = ((TateCount * YokoCount) / 10000)
1190 '結果表示
1200 ResultScreen:
1210 cls 3
1220 '描画領域 ここから
1230 line (0,0)-(800,25),rgb(0,0,255),bf
1240 line (0,25)-(800,25*14+20),rgb(127,255,212),bf
1250 line (0,25*14+20)-(800,(25*15+20)+60),rgb(0,255,0),bf
1260 '描画領域 ここまで
1270 talk "結果の表示です"
1280 COLOR rgb(255,255,255)
1290 print "土地計算機 Light 結果表示" + chr$(13)
1300 color rgb(255,0,255)
1310 print "あなたの身長(cm):";height;"(cm)";chr$(13)
1320 print using"@##.#@";"あなたの一歩の長さ(cm):",walkstep,"(cm)";chr$(13)
1330 print using"@##.#@";"縦の長さ:",TateCount/100,"(m)"+chr$(13)
1340 print "縦の歩数:";TateStep;"(歩)";chr$(13)
1350 print using"@##.#@";"横の長さ:",YokoCount/100,"(m)"+chr$(13)
1360 print "横の歩数:";YokoStep;"(歩)";chr$(13)
1370 print using"@##.#@";"面積は約",S,"平米(㎡)です" + chr$(13)
1380 color rgb(0,0,0)
1390 print "エンターキー:トップ画面" + chr$(13)
1400 print "スペースキー:プログラム終了" + chr$(13)
1410 key$ = input$(1)
1420 if key$ = chr$(13) then
1430 goto Main_Menu:
1440 else
1450 if key$ = " " then
1460 cls 3:color rgb(255,255,255):end
1470 else
1480 goto ResultScreen:
1490 endif
1500 endif
1510 'Version  Menu
1520 Version_Menu:
1530 cls 3
1540 '描画領域 ここから
1550 line (0,0)-(980,25),rgb(0,0,255),bf
1560 line (0,25)-(980,25*9),rgb(127,255,212),bf
1570 line (0,25*9)-(980,25*9+25*2),rgb(0,255,0),bf
1580 '描画領域 ここまで
1590 talk "土地計算機 バージョン情報です"
1600 color rgb(255,255,255)
1610 print "土地計算機   Light バージョン情報" + chr$(13)
1620 color rgb(255,0,255)
1630 print "アプリ名:土地計算機　Light" + chr$(13)
1640 print "Version:";VersionNo$;chr$(13)
1650 print "E-mail:licksjp@gmail.com" + chr$(13)
1660 print "(c)licksjp All rights reserved since 2009" + chr$(13)
1670 color rgb(0,0,0)
1680 print "エンターキーを押してください" + chr$(13)
1690 key$ = input$(1)
1700 if key$ = chr$(13) then
1710 goto Main_Menu:color rgb(255,255,255)
1720 else
1730 goto Version_Menu:
1740 endif
1750 KyoriScreen:
1760 cls 3
1770 '描画領域  ここから
1780 line (0,0)-(800,25),rgb(0,0,255),bf
1790 line (0,25)-(800,75),rgb(127,255,212),bf
1800 line (0,75)-(800,75+50),rgb(0,255,0),bf
1810 '描画領域  ここまで
1820 talk"身長から歩数を入力して距離を求めます。スペースキーを押してください。"
1830 color rgb(255,255,255)
1840 print "土地計算機 Light 距離計算 " + chr$(13)
1850 color rgb(255,0,255)
1860 print "身長から１歩の長さを求めて歩数を入力して距離を求めます。" + chr$(13)
1870 color rgb(0,0,0)
1880 print "スペースキーを押してください" + chr$(13)
1890 key$=input$(1)
1900 if key$=" " then
1910 goto depthScreen:
1920 else
1930 goto KyoriScreen:
1940 endif
1950 depthScreen:
1960 cls 3
1970 '描画領域 ここから
1980 line (0,0)-(800,25),rgb(0,0,255),bf
1990 line (0,25)-(800,75),rgb(127,255,212),bf
2000 line (0,75)-(800,125),rgb(0,255,0),bf
2010 '描画領域 ここまで
2020 talk "あなたの身長を入れてください"
2030 color rgb(255,255,255)
2040 print"身長(cm)入力"+chr$(13)
2050 color rgb(255,0,255)
2060 print"あなたの身長(cm)を入れてください"+chr$(13)
2070 color rgb(0,0,0)
2080 Input "あなたの身長(cm):",height
2090 '一歩の長さ :walkstep
2100 walkstep = height * 0.37
2110 cls
2120 talk"歩いた歩数を入れてください"
2130 color rgb(255,255,255)
2140 print "歩数を入力して距離を求める"+chr$(13)
2150 color rgb(255,0,255)
2160 print"歩いた歩数を入れてください"+chr$(13)
2170 color rgb(0,0,0)
2180 Input "歩いた歩数(歩):",hosu_count
2190 'depth:歩いた距離
2200 depth = walkstep * hosu_count
2210 ResultKyoriScreen:
2220 cls 3
2230 line (0,0)-(800,25),rgb(0,0,255),bf
2240 line (0,25)-(800,75+100),rgb(127,255,212),bf
2250 line (0,75+100)-(800,125+100),rgb(0,255,0),bf
2260 talk"歩数から歩いた距離の結果の表示です。"
2270 color rgb(255,255,255)
2280 print"歩数から歩いた距離の結果表示"+chr$(13)
2290 color rgb(255,0,255)
2300 print"一歩の歩数:";walkstep;"(cm)"+chr$(13)
2310 print"歩いた歩数:";hosu_count;"(歩)"+chr$(13)
2320 print using "@##.#@";"歩いた距離:",depth/100,"(m)";chr$(13)
2330 color rgb(0,0,0)
2340 print"エンターキーを押してください"+chr$(13)
2350 key$=input$(1)
2360 if key$=chr$(13) then
2370 'エンターキー:メイン画面に飛ぶ
2380 goto Main_Menu:
2390 else
2400 goto ResultKyoriScreen:
2410 endif
