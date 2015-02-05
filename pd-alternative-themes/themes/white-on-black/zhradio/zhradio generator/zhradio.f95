character (LEN=12) :: filename

do i=2,36

	if (i<10) then
		write(filename,"(A,I1,A)") "zhradio", i, ".pd "
		else
			write(filename,"(A,I2,A)") "zhradio", i, ".pd"
	endif

	open (unit=11,file=TRIM(filename))

	j = 15 * i + 2
	
	
	write(11,"(A)") "#N canvas 456 323 605 300 10;"
	write(11,"(A)") "#X obj 301 215 outlet;"
	if (i<10) then
		write(11,"(A,I1,A)") "#X obj 301 101 hradio 15 1 0 ", i, " empty empty empty 0 -8 0 10 -1 -262144 -1 0;"
		else
			write(11,"(A,I2,A)") "#X obj 301 101 hradio 15 1 0 ", i, " empty empty empty 0 -8 0 10 -1 -262144 -1 0;"
	endif
	write(11,"(A)") "#X obj 196 23 inlet;"
	write(11,"(A)") "#X obj 301 188 + 0;"
	write(11,"(A)") "#X obj 301 147 * 1;"
	write(11,"(A)") "#X obj 196 56 route min stepsize;"
	write(11,"(A)") "#X obj 167 84 t b;"
	write(11,"(A)") "#X connect 1 0 4 0;"
	write(11,"(A)") "#X connect 2 0 5 0;"
	write(11,"(A)") "#X connect 3 0 0 0;"
	write(11,"(A)") "#X connect 4 0 3 0;"
	write(11,"(A)") "#X connect 5 0 3 1;"
	write(11,"(A)") "#X connect 5 0 6 0;"
	write(11,"(A)") "#X connect 5 1 4 1;"
	write(11,"(A)") "#X connect 5 2 1 0;"
	write(11,"(A)") "#X connect 6 0 1 0;"
	if (j<100) then	
		write(11,"(A,I2,A)") "#X coords 0 -1 1 1 ",j," 17 2 300 100;"
		else
			write(11,"(A,I3,A)") "#X coords 0 -1 1 1 ",j," 17 2 300 100;"
	endif
	
	close(unit=11)

enddo

end
