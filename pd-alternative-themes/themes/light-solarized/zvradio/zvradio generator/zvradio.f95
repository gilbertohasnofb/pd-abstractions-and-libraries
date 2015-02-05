character (LEN=12) :: filename

do i=2,36

	if (i<10) then
		write(filename,"(A,I1,A)") "zvradio", i, ".pd "
		else
			write(filename,"(A,I2,A)") "zvradio", i, ".pd"
	endif

	open (unit=11,file=TRIM(filename))

	j = 15 * i + 2
	k = 206 + j
	k2 = 138 + j
	k3 = 179 + j
	
	write(11,"(A)") "#N canvas 425 466 605 321 10;"
		if (i<10) then
		write(11,"(A,I1,A)") "#X obj 301 101 vradio 15 1 0 ",i," empty empty empty 0 -8 0 10 -262009 -205958 -1 0;"
		else
			write(11,"(A,I2,A)") "#X obj 301 101 vradio 15 1 0 ",i," empty empty empty 0 -8 0 10 -262009 -205958 -1 0;"
	endif	
	write(11,"(A,I3,A)") "#X obj 233 ", k, " outlet;"
	write(11,"(A)") "#X obj 196 41 inlet;"
	write(11,"(A,I3,A)") "#X obj 233 ", k2, " * 1;"
	write(11,"(A,I3,A)") "#X obj 233 ", k3, " + 1;"
	write(11,"(A)") "#X obj 196 74 route min stepsize;"
	write(11,"(A)") "#X obj 172 118 t b;"
	write(11,"(A)") "#X connect 0 0 3 0;"
	write(11,"(A)") "#X connect 2 0 5 0;"
	write(11,"(A)") "#X connect 3 0 4 0;"
	write(11,"(A)") "#X connect 4 0 1 0;"
	write(11,"(A)") "#X connect 5 0 4 1;"
	write(11,"(A)") "#X connect 5 0 6 0;"
	write(11,"(A)") "#X connect 5 1 3 1;"
	write(11,"(A)") "#X connect 5 2 0 0;"
	write(11,"(A)") "#X connect 6 0 0 0;"
	if (j<100) then
		write(11,"(A,I2,A)") "#X coords 0 -1 1 1 17 ", j, " 2 300 100;"
		else
			write(11,"(A,I3,A)") "#X coords 0 -1 1 1 17 ", j, " 2 300 100;"
	endif
	
	close(unit=11)

enddo

end
