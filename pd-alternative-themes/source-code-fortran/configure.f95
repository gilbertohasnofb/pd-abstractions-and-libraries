program configure
implicit none

integer :: length, i, n_themes
character (LEN=256) :: path, folder
character (LEN=17), allocatable :: theme(:)
logical :: condition

! ============== Number of themes ==============
n_themes = 8
! ==============================================

allocate(theme(1:n_themes))

! ============= Theme folder names =============
theme(1) = "/black-on-white/ "
theme(2) = "/white-on-black/ "
theme(3) = "/jMax/           "
theme(4) = "/dark-solarized/ "
theme(5) = "/light-solarized/"
theme(6) = "/mint-x/         "
theme(7) = "/ubuntu/         "
theme(8) = "/default/        "
! ==============================================

call GETCWD(path) ! getting current path

write(*,*)
write(*,*) "PD: alternative themes installer"
write(*,*) "by Gilberto Agostinho"
write(*,*)
write(*,*) "The new themes will be installed at:"
write(*,*) path
write(*,*) 

! main loop, will configure one theme at a time
do i=1,n_themes

	! ****************************************************************************************************************************************************************
	! B.pd

	folder = "B/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"B.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"B.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"B.pd")
		write(11,"(A)") "#N canvas 1132 501 619 385 10;"
		write(11,"(A)") "#X obj 223 119 loadbang;"
		write(11,"(A)") "#X obj 101 66 inlet;"
		write(11,"(A)") "#X obj 101 164 outlet;"
		write(11,"(A)") "#X obj 286 117 delay 250;"
		write(11,"(A)") "#X obj 101 101 bng 13 250 50 0 empty empty empty 17 7 0 10 -262144 -1 -1;"
		write(11,"(A,A,A,A,A)") "#X msg 286 64 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "1.gif;"
		write(11,"(A,A,A,A,A)") "#X msg 286 147 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A,A,A,A,A)") "#X obj 108 108 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 286 91 t b;"
		write(11,"(A)") "#X msg 185 51 size 0 0;"
		write(11,"(A)") "#X obj 185 24 loadbang;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 4 0;"
		write(11,"(A)") "#X connect 3 0 6 0;"
		write(11,"(A)") "#X connect 4 0 5 0;"
		write(11,"(A)") "#X connect 4 0 2 0;"
		write(11,"(A)") "#X connect 5 0 7 0;"
		write(11,"(A)") "#X connect 5 0 8 0;"
		write(11,"(A)") "#X connect 6 0 7 0;"
		write(11,"(A)") "#X connect 8 0 3 0;"
		write(11,"(A)") "#X connect 9 0 7 0;"
		write(11,"(A)") "#X connect 10 0 9 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 15 15 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! BL.pd

	folder = "BL/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"BL.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"BL.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"BL.pd")
		write(11,"(A)") "#N canvas 670 431 619 385 10;"
		write(11,"(A)") "#X obj 223 119 loadbang;"
		write(11,"(A)") "#X obj 101 67 inlet;"
		write(11,"(A)") "#X obj 101 165 outlet;"
		write(11,"(A)") "#X obj 286 117 delay 250;"
		write(11,"(A)") "#X obj 101 101 bng 42 250 50 0 empty empty empty 17 7 0 10 -262144 -1 -1;"
		write(11,"(A,A,A,A,A)") "#X msg 286 64 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "1.gif;"
		write(11,"(A,A,A,A,A)") "#X msg 286 147 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 286 91 t b;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 4 0;"
		write(11,"(A)") "#X connect 3 0 6 0;"
		write(11,"(A)") "#X connect 4 0 5 0;"
		write(11,"(A)") "#X connect 4 0 2 0;"
		write(11,"(A)") "#X connect 5 0 7 0;"
		write(11,"(A)") "#X connect 5 0 8 0;"
		write(11,"(A)") "#X connect 6 0 7 0;"
		write(11,"(A)") "#X connect 8 0 3 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 45 45 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! BXL.pd

	folder = "BXL/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"BXL.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"BXL.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"BXL.pd")
		write(11,"(A)") "#N canvas 670 431 619 385 10;"
		write(11,"(A)") "#X obj 223 119 loadbang;"
		write(11,"(A)") "#X obj 102 67 inlet;"
		write(11,"(A)") "#X obj 102 205 outlet;"
		write(11,"(A)") "#X obj 286 117 delay 250;"
		write(11,"(A)") "#X obj 102 102 bng 86 250 50 0 empty empty empty 17 7 0 10 -262144 -1 -1;"
		write(11,"(A,A,A,A,A)") "#X msg 286 64 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "1.gif;"
		write(11,"(A,A,A,A,A)") "#X msg 286 147 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A,A,A,A,A)") "#X obj 145 145 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 286 91 t b;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 4 0;"
		write(11,"(A)") "#X connect 3 0 6 0;"
		write(11,"(A)") "#X connect 4 0 5 0;"
		write(11,"(A)") "#X connect 4 0 2 0;"
		write(11,"(A)") "#X connect 5 0 7 0;"
		write(11,"(A)") "#X connect 5 0 8 0;"
		write(11,"(A)") "#X connect 6 0 7 0;"
		write(11,"(A)") "#X connect 8 0 3 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 89 89 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! N.pd

	folder = "N/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"N.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"N.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"N.pd")
		write(11,"(A)") "#N canvas 650 401 449 382 10;"
		write(11,"(A)") "#X obj 218 107 outlet;"
		write(11,"(A)") "#X obj 218 83 inlet;"
		write(11,"(A)") "#X obj 103 16 loadbang;"
		write(11,"(A,A,A,A,A)") "#X obj 103 101 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A,A,A,A,A)") "#X msg 103 53 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X msg 192 53 size 2 2;"
		write(11,"(A)") "#X connect 1 0 0 0;"
		write(11,"(A)") "#X connect 2 0 4 0;"
		write(11,"(A)") "#X connect 2 0 5 0;"
		write(11,"(A)") "#X connect 4 0 3 0;"
		write(11,"(A)") "#X connect 5 0 3 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 6 3 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! N~.pd

	folder = "N~/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"N~.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"N~.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"N~.pd")
		write(11,"(A)") "#N canvas 648 402 449 382 10;"
		write(11,"(A)") "#X obj 103 16 loadbang;"
		write(11,"(A,A,A,A,A)") "#X obj 103 101 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A,A,A,A,A)") "#X msg 103 53 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X msg 192 53 size 2 2;"
		write(11,"(A)") "#X obj 218 83 inlet~;"
		write(11,"(A)") "#X obj 218 107 outlet~;"
		write(11,"(A)") "#X connect 0 0 2 0;"
		write(11,"(A)") "#X connect 0 0 3 0;"
		write(11,"(A)") "#X connect 2 0 1 0;"
		write(11,"(A)") "#X connect 3 0 1 0;"
		write(11,"(A)") "#X connect 4 0 5 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 6 3 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! T.pd

	folder = "T/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"T.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"T.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"T.pd")
		write(11,"(A)") "#N canvas 666 433 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 13 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 159 160 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X obj 151 16 loadbang;"
		write(11,"(A)") "#X obj 101 54 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 108 108 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 101 207 outlet;"
		write(11,"(A)") "#X msg 190 55 size 0 0;"
		write(11,"(A)") "#X msg 151 54 0;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 5 0;"
		write(11,"(A)") "#X connect 1 0 4 0;"
		write(11,"(A)") "#X connect 2 0 7 0;"
		write(11,"(A)") "#X connect 2 0 6 0;"
		write(11,"(A)") "#X connect 3 0 0 0;"
		write(11,"(A)") "#X connect 6 0 4 0;"
		write(11,"(A)") "#X connect 7 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 15 15 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! TL.pd

	folder = "TL/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"TL.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"TL.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"TL.pd")
		write(11,"(A)") "#N canvas 676 428 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 43 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 159 160 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 101 54 0;"
		write(11,"(A)") "#X obj 101 16 loadbang;"
		write(11,"(A)") "#X obj 140 55 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 101 207 outlet;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 3 0 2 0;"
		write(11,"(A)") "#X connect 4 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 45 45 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! TXL.pd

	folder = "TXL/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"TXL.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"TXL.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"TXL.pd")
		write(11,"(A)") "#N canvas 674 429 619 385 10;"
		write(11,"(A)") "#X obj 102 102 tgl 86 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 239 160 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 102 54 0;"
		write(11,"(A)") "#X obj 102 16 loadbang;"
		write(11,"(A)") "#X obj 140 55 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 145 145 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 102 207 outlet;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 3 0 2 0;"
		write(11,"(A)") "#X connect 4 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 89 89 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zadc~.pd

	folder = "zadc~/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zadc~.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zadc~.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zadc~.pd")
		write(11,"(A)") "#N canvas 727 425 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 44 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 261 106 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 62 34 0;"
		write(11,"(A)") "#X obj 62 187 dsp dsp~;"
		write(11,"(A)") "#X obj 62 -4 loadbang;"
		write(11,"(A)") "#X obj 101 35 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 261 40 r pd;"
		write(11,"(A)") "#X obj 261 74 route dsp;"
		write(11,"(A)") "#X obj -77 104 adc~;"
		write(11,"(A)") "#X obj -76 160 outlet~;"
		write(11,"(A)") "#X obj -22 160 outlet~;"
		write(11,"(A)") "#X connect 0 0 3 0;"
		write(11,"(A)") "#X connect 1 0 6 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 2 0 3 0;"
		write(11,"(A)") "#X connect 4 0 2 0;"
		write(11,"(A)") "#X connect 5 0 0 0;"
		write(11,"(A)") "#X connect 7 0 8 0;"
		write(11,"(A)") "#X connect 8 0 1 0;"
		write(11,"(A)") "#X connect 9 0 10 0;"
		write(11,"(A)") "#X connect 9 1 11 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 46 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zdac~.pd

	folder = "zdac~/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zdac~.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zdac~.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zdac~.pd")
		write(11,"(A)") "#N canvas 682 425 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 44 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 261 106 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 62 34 0;"
		write(11,"(A)") "#X obj 62 187 dsp dsp~;"
		write(11,"(A)") "#X obj 62 -4 loadbang;"
		write(11,"(A)") "#X obj -86 33 inlet~;"
		write(11,"(A)") "#X obj -29 34 inlet~;"
		write(11,"(A)") "#X obj -87 104 dac~;"
		write(11,"(A)") "#X obj 101 35 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 261 40 r pd;"
		write(11,"(A)") "#X obj 261 74 route dsp;"
		write(11,"(A)") "#X connect 0 0 3 0;"
		write(11,"(A)") "#X connect 1 0 9 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 2 0 3 0;"
		write(11,"(A)") "#X connect 4 0 2 0;"
		write(11,"(A)") "#X connect 5 0 7 0;"
		write(11,"(A)") "#X connect 6 0 7 1;"
		write(11,"(A)") "#X connect 8 0 0 0;"
		write(11,"(A)") "#X connect 10 0 11 0;"
		write(11,"(A)") "#X connect 11 0 1 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 46 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zled.pd

	folder = "zled/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zled.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zled.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zled.pd")
		write(11,"(A)") "#N canvas 680 426 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 44 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 261 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 101 34 0;"
		write(11,"(A)") "#X obj 101 -4 loadbang;"
		write(11,"(A)") "#X obj 140 35 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 101 187 outlet;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 3 0 2 0;"
		write(11,"(A)") "#X connect 4 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 46 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zspigot.pd

	folder = "zspigot/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zspigot.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zspigot.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zspigot.pd")
		write(11,"(A)") "#N canvas 829 431 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 44 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 201 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X obj 329 15 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 329 255 outlet;"
		write(11,"(A)") "#X obj 329 215 spigot;"
		write(11,"(A)") "#X obj 463 15 inlet;"
		write(11,"(A)") "#X obj 101 68 expr if ($f1==0 \, 0 \, 1);"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 5 1;"
		write(11,"(A)") "#X connect 1 0 3 0;"
		write(11,"(A)") "#X connect 2 0 5 0;"
		write(11,"(A)") "#X connect 5 0 4 0;"
		write(11,"(A)") "#X connect 6 0 5 1;"
		write(11,"(A)") "#X connect 6 0 7 0;"
		write(11,"(A)") "#X connect 7 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 46 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zspigot~.pd

	folder = "zspigot~/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zspigot~.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zspigot~.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zspigot~.pd")
		write(11,"(A)") "#N canvas 827 432 619 385 10;"
		write(11,"(A)") "#X obj 101 101 tgl 44 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 201 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A,A,A,A,A)") "#X obj 123 123 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 463 15 inlet;"
		write(11,"(A)") "#X obj 101 68 expr if ($f1==0 \, 0 \, 1);"
		write(11,"(A)") "#X obj 329 215 spigot~;"
		write(11,"(A)") "#X obj 329 255 outlet~;"
		write(11,"(A)") "#X obj 386 255 outlet~;"
		write(11,"(A)") "#X obj 329 15 inlet~;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 5 1;"
		write(11,"(A)") "#X connect 1 0 2 0;"
		write(11,"(A)") "#X connect 3 0 4 0;"
		write(11,"(A)") "#X connect 3 0 5 1;"
		write(11,"(A)") "#X connect 4 0 0 0;"
		write(11,"(A)") "#X connect 5 0 6 0;"
		write(11,"(A)") "#X connect 5 1 7 0;"
		write(11,"(A)") "#X connect 8 0 5 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 46 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zswitch2.pd

	folder = "zswitch2/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch2.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch2.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch2.pd")
		write(11,"(A)") "#N canvas 678 427 619 385 10;"
		write(11,"(A)") "#X obj 105 101 tgl 34 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 261 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 105 44 0;"
		write(11,"(A)") "#X obj 105 6 loadbang;"
		write(11,"(A)") "#X obj 144 45 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 118 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 105 187 outlet;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 3 0 2 0;"
		write(11,"(A)") "#X connect 4 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 36 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zswitch2color.pd

	folder = "zswitch2color/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch2color.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch2color.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch2color.pd")
		write(11,"(A)") "#N canvas 678 427 619 385 10;"
		write(11,"(A)") "#X obj 105 101 tgl 34 0 empty empty empty 17 7 0 10 -262144 -1 -1 0 1;"
		write(11,"(A,A,A,A,A)") "#X msg 261 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 105 44 0;"
		write(11,"(A)") "#X obj 105 6 loadbang;"
		write(11,"(A)") "#X obj 144 45 inlet;"
		write(11,"(A,A,A,A,A)") "#X obj 123 118 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X obj 105 187 outlet;"
		write(11,"(A)") "#X connect 0 0 1 0;"
		write(11,"(A)") "#X connect 0 0 6 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 0 0;"
		write(11,"(A)") "#X connect 3 0 2 0;"
		write(11,"(A)") "#X connect 4 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 36 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zswitch3.pd

	folder = "zswitch3/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch3.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch3.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch3.pd")
		write(11,"(A)") "#N canvas 674 429 619 385 10;"
		write(11,"(A,A,A,A,A)") "#X msg 261 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 102 65 0;"
		write(11,"(A)") "#X obj 102 37 loadbang;"
		write(11,"(A)") "#X obj 141 66 inlet;"
		write(11,"(A)") "#X obj 102 147 outlet;"
		write(11,"(A)") "#X obj 102 103 hradio 14 1 0 3 empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
		write(11,"(A)") "#X obj 102 118 hradio 14 1 0 3 empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
		write(11,"(A,A,A,A,A)") "#X obj 123 118 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X connect 0 0 7 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 1 0;"
		write(11,"(A)") "#X connect 3 0 5 0;"
		write(11,"(A)") "#X connect 5 0 6 0;"
		write(11,"(A)") "#X connect 6 0 4 0;"
		write(11,"(A)") "#X connect 6 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 36 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	! zswitch3color.pd

	folder = "zswitch3color/"
	inquire (file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch3color.pd",exist=condition)
	if (condition) call SYSTEM("rm "//TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch3color.pd")

	open(unit=11,file=TRIM(path)//TRIM(theme(i))//TRIM(folder)//"zswitch3color.pd")
		write(11,"(A)") "#N canvas 674 429 619 385 10;"
		write(11,"(A,A,A,A,A)") "#X msg 261 122 open ", TRIM(path), TRIM(theme(i)), TRIM(folder), "\$1.gif;"
		write(11,"(A)") "#X msg 102 65 0;"
		write(11,"(A)") "#X obj 102 37 loadbang;"
		write(11,"(A)") "#X obj 141 66 inlet;"
		write(11,"(A)") "#X obj 102 147 outlet;"
		write(11,"(A)") "#X obj 102 103 hradio 14 1 0 3 empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
		write(11,"(A)") "#X obj 102 118 hradio 14 1 0 3 empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
		write(11,"(A,A,A,A,A)") "#X obj 123 118 image ", TRIM(path), TRIM(theme(i)), TRIM(folder), "0.gif;"
		write(11,"(A)") "#X connect 0 0 7 0;"
		write(11,"(A)") "#X connect 1 0 5 0;"
		write(11,"(A)") "#X connect 2 0 1 0;"
		write(11,"(A)") "#X connect 3 0 5 0;"
		write(11,"(A)") "#X connect 5 0 6 0;"
		write(11,"(A)") "#X connect 6 0 4 0;"
		write(11,"(A)") "#X connect 6 0 0 0;"
		write(11,"(A)") "#X coords 0 -1 1 1 46 36 2 100 100;"
	close(unit=11)

	! ****************************************************************************************************************************************************************
	
enddo

end program configure
