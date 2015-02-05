! z2d-extra: z to default (extra option)
! converts a patch created with pd-alternative-themes GUI objects into a patch using default GUI objects
! EXTRA OPTION: this program also forces ALL sliders and radios to be black and white

program z2dextra
implicit none

character (LEN=256) :: input, codeLine, newCodeString, codeString, codeStringP1, codeStringP2, auxString
character (LEN=1), dimension(9999,256) :: code
integer :: i, j, k, aux, N, P1, P2, lineLength, digit, counter
logical :: condition

! resetting codeLine since character variables with long LEN have sometimes already have some garbage on them
input(1:256) = " "
codeLine(1:256) = " "
newCodeString(1:256) = " "
code(1:9999,1:256) = " "

! ============================================================================================

write(*,*)
write(*,*) "z2d-extra: Z to Default - EXTRA"
write(*,*)
write(*,*) "PD: alternative themes converter"
write(*,*) "by Gilberto Agostinho"
write(*,*)
write(*,*) "This program will convert a pd patch containing the zGUI objects into a patch "
write(*,*) "using only pd-extended objects. For more information, read the README file"
write(*,*)
write(*,*) "Please type the name of the file you want to convert (it won't be overwritten):"
read(*,*) input

aux = LEN(TRIM(input))
if ( (input(aux-2:aux)==".pd") .OR. (input(aux-2:aux)==".Pd") .OR. (input(aux-2:aux)==".PD")) input(aux-2:aux) = "   "

! checking if file exists
inquire(file=TRIM(input)//".pd",exist=condition)
if (.NOT.	 condition) then
	write(*,*)
	write(*,*) "Error! The file ", TRIM(input), ".pd does not exist!"
	goto 1000 ! go to the end of this program
endif

! ============================================================================================
! opening the file to be converted and reading it

open(unit=11,file=TRIM(input)//".pd")

N = 1

do

	codeLine(1:256) = " " 	! resetting codeLine for the loop
	counter = 1 ! used to identify how many lines are being read until a ";" appears
	
	do while (INDEX(codeLine,";") == 0) ! i.e., if this line does NOT contain a ;
		read(11,"(A)",end=10) auxString
		if (counter == 1) then
			codeLine = TRIM(auxString)
			else
				codeLine = TRIM(codeLine)//" "//TRIM(auxString)
		endif
		counter = counter + 1
	enddo
	
	! converting it into a matrix of character (easier to deal with it this way)
	aux = LEN(TRIM(codeLine))
	do j = 1, aux
		code(N,j) = codeLine(j:j)
	enddo
	
	N = N + 1
	
enddo

10 continue

! ============================================================================================
! converting the code

do i=1,N
	do j=1,256	 
	  			
		! B -> bng
		if ((code(i,j)=="B") .AND. (code(i,(j+1))==";")) then
			newCodeString = "bng;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! BL -> bng
		if ((code(i,j)=="B") .AND. (code(i,(j+1))=="L") .AND. (code(i,(j+2))==";")) then
			newCodeString = "bng;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! BXL -> bng
		if ((code(i,j)=="B") .AND. (code(i,(j+1))=="X") .AND. (code(i,(j+2))=="L") .AND. (code(i,(j+3))==";")) then
			newCodeString = "bng;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! N -> t a
		if ((code(i,j)=="N") .AND. (code(i,(j+1))==";")) then
			newCodeString = "t a;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! N~ -> *~ 1
		if ((code(i,j)=="N") .AND. (code(i,(j+1))=="~") .AND. (code(i,(j+2))==";")) then
			newCodeString = "*~ 1;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! T -> tgl
		if ((code(i,j)=="T") .AND. (code(i,(j+1))==";")) then
			newCodeString = "tgl;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! TL -> tgl
		if ((code(i,j)=="T") .AND. (code(i,(j+1))=="L") .AND. (code(i,(j+2))==";")) then
			newCodeString = "tgl;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! TXL -> tgl
		if ((code(i,j)=="T") .AND. (code(i,(j+1))=="X") .AND. (code(i,(j+2))=="L") .AND. (code(i,(j+3))==";")) then
			newCodeString = "tgl;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zadc~ -> adc~
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="a") .AND. (code(i,(j+2))=="d") .AND. (code(i,(j+3))=="c")) then
			newCodeString = "adc~;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zdac~ -> dac~
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="d") .AND. (code(i,(j+2))=="a") .AND. (code(i,(j+3))=="c")) then
			newCodeString = "dac~;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zhradio ->
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="h") .AND. (code(i,(j+2))=="r") .AND. (code(i,(j+3))=="a")) then ! "zhra..." must be zhradioN
			if ( (IACHAR(code(i,j+7)) >= 48) .AND. (IACHAR(code(i,j+7)) <= 57) ) aux = IACHAR(code(i,j+7)) - 48 ! if ASCII between 48-57 then it represents a digit between 0-9
			if ( (IACHAR(code(i,j+8)) >= 48) .AND. (IACHAR(code(i,j+8)) <= 57) ) aux = 10 * aux + ( IACHAR(code(i,j+8)) - 48 ) ! if the next character is also a number, the first one was 10x its digit
			if (aux<10) then
				write(newCodeString,"(A,I1,A)") "hradio 15 1 0 ", aux, " empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
				else
					write(newCodeString,"(A,I2,A)") "hradio 15 1 0 ", aux, " empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
			endif
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zhslider ->
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="h") .AND. (code(i,(j+2))=="s") .AND. (code(i,(j+3))=="l")) then
			newCodeString = "hsl 128 15 0 1 0 0 empty empty empty -2 -8 0 10 -262144 -1 -1 0 1;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zled -> tgl
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="l") .AND. (code(i,(j+2))=="e") .AND. (code(i,(j+3))=="d")) then
			newCodeString = "tgl;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zspigot -> spigot
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="p") .AND. (code(i,(j+3))=="i") &
		.AND. (code(i,(j+7))==";")) then ! i.e., if "zspi---;", where - is not checked. This can only be zspigot;
			newCodeString = "spigot;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zspigot~ -> spigot~
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="p") .AND. (code(i,(j+3))=="i") &
		.AND. (code(i,(j+8))==";")) then ! i.e., if "zspi----;", where - is not checked. This can only be zspigot~;
			newCodeString = "spigot~;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zswitch2 and zswitch2color -> tgl
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="w") .AND. (code(i,(j+3))=="i") &
		.AND. (code(i,(j+7))=="2")) then ! i.e., if "zswi---2", where - is not checked. This can be zswitch2; or zswitch2color;
			newCodeString = "tgl;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zswitch3 and zswitch3color ->
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="w") .AND. (code(i,(j+3))=="i") &
		.AND. (code(i,(j+7))=="3")) then ! i.e., if "zswi---3", where - is not checked. This can be zswitch3; or zswitch3color;
			newCodeString = "hradio 15 1 0 3 empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zvradio ->
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="v") .AND. (code(i,(j+2))=="r") .AND. (code(i,(j+3))=="a")) then ! "zvra..." must be zvradioN
			if ( (IACHAR(code(i,j+7)) >= 48) .AND. (IACHAR(code(i,j+7)) <= 57) ) aux = IACHAR(code(i,j+7)) - 48 ! if ASCII between 48-57 then it represents a digit between 0-9
			if ( (IACHAR(code(i,j+8)) >= 48) .AND. (IACHAR(code(i,j+8)) <= 57) ) aux = 10 * aux + ( IACHAR(code(i,j+8)) - 48 ) ! if the next character is also a number, the first one was 10x its digit
			if (aux<10) then
				write(newCodeString,"(A,I1,A)") "vradio 15 1 0 ", aux, " empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
				else
					write(newCodeString,"(A,I2,A)") "vradio 15 1 0 ", aux, " empty empty empty 0 -8 0 10 -262144 -1 -1 0;"
			endif
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! zvslider ->
		if ((code(i,j)=="z") .AND. (code(i,(j+1))=="v") .AND. (code(i,(j+2))=="s") .AND. (code(i,(j+3))=="l")) then
			newCodeString = "vsl 15 128 0 1 0 0 empty empty empty 0 -9 0 10 -262144 -1 -1 0 1;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
	enddo
enddo

! ============================================================================================

do i=1,N
	do j=1,256	 
	
		! hsl and vsl : color change
		if ( ((code(i,j)=="h") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="l")) .OR. &
	  ((code(i,j)=="v") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="l")) )then		
		
			! resetting variables
			codeString(1:256) = " " 
			newCodeString(1:256) = " "
			codeStringP1(1:256) = " "
			codeStringP2(1:256) = " "
			
			! making codeString to be equal to the whole line
			k = 1
			do while (code(i,k)/=";")
				codeString(k:k) = code(i,k)
				k = k + 1					
			enddo
			codeString(k:k) = ";"
			
			! breaking codeString into two parts, omitting the color numbers that will be changed
			k = 1
			counter = 0
      do 
      	if (codeString(k:k)==" ") counter = counter + 1
      	if (counter == 17) P1 = k
      	if (counter == 21	) then
      		P2 = k
        	exit
      	endif
      	k = k + 1
			enddo
			
			! putting all three parts together with the new color information
			codeStringP1 = codeString(1:P1)
			codeStringP2 = codeString(P2:256)
			newCodeString = TRIM(codeStringP1)//" -262144 -1 -1"//TRIM(codeStringP2)
			call STRING_TO_CHAR(newCodeString,code,i,1)
			exit
			
		endif
		
		! hradio and vradio : color change
		if ( ((code(i,j)=="h") .AND. (code(i,(j+1))=="r") .AND. (code(i,(j+2))=="a")) .OR. &
	  ((code(i,j)=="v") .AND. (code(i,(j+1))=="r") .AND. (code(i,(j+2))=="a")) )then		
		
			! resetting variables
			codeString(1:256) = " " 
			newCodeString(1:256) = " "
			codeStringP1(1:256) = " "
			codeStringP2(1:256) = " "
			
			! making codeString to be equal to the whole line
			k = 1
			do while (code(i,k)/=";")
				codeString(k:k) = code(i,k)
				k = k + 1					
			enddo
			codeString(k:k) = ";"
			
			! breaking codeString into two parts, omitting the color numbers that will be changed
			k = 1
			counter = 0
      do 
      	if (codeString(k:k)==" ") counter = counter + 1
      	if (counter == 15) P1 = k
      	if (counter == 19	) then
      		P2 = k
        	exit
      	endif
      	k = k + 1
			enddo
			
			! putting all three parts together with the new color information
			codeStringP1 = codeString(1:P1)
			codeStringP2 = codeString(P2:256)
			newCodeString = TRIM(codeStringP1)//" -262144 -1 -1"//TRIM(codeStringP2)
			call STRING_TO_CHAR(newCodeString,code,i,1)
			exit
							
		endif

	enddo
enddo

! ============================================================================================
! writing information to a new file

open(unit=12,file=TRIM(input)//"-d-extra.pd")

do i=1,N
	do j=1,256

	do aux=256,1,-1 ! calculating the length of the i-th line
		if (code(i,aux)/=" ") exit
	enddo
	lineLength = aux

	if (j>lineLength) then
		if ((j>1) .AND. (code(i,j-1) /= ";")) write(12,"(A)",advance="NO") " " ! adding a space that may be necessary sometimes 
		exit ! if two spaces in a row, skip to the next line
	endif

	if (code(i,j) /= ";") then ! searching for the ;
		write(12,"(A)",advance="NO") code(i,j)
		else
			write(12,"(A)") code(i,j)
			cycle
	endif	

	enddo
enddo	

! ============================================================================================

write(*,*) 
write(*,"(A,A,A)") "Success! A file named ", TRIM(input), "-d-extra.pd was created in this directory"

1000 end program z2dextra

! ============================================================================================
! ============================================================================================
! ============================================================================================

subroutine STRING_TO_CHAR(newCodeString,code,i,j)
implicit none

character (LEN=256), intent(IN) :: newCodeString
character (LEN=1), dimension(9999,256), intent(INOUT) :: code
integer, intent(IN) :: i, j
integer :: length, aux

length = LEN(TRIM(newCodeString))

! writing this string as an array of char
do aux=1,length
  code(i,j+(aux-1)) = newCodeString(aux:aux)
enddo

! filling the rest of the line with blank spaces
do aux=(j+length),256
	code(i,aux) = " "
enddo

end subroutine STRING_TO_CHAR
