! d2z-extra: default to z (extra options)
! converts a patch created with default GUI objects into a patch using pd-alternative-themes GUI objects
! EXTRA OPTION: this program also forces changes for adc~, dac~, spigot and spigot~ (remember that the sizes of these objects are different than their z counterparts, thus potentially worsening the patch layout)

program d2zextra
implicit none

character (LEN=256) :: input, codeLine, newCodeString, codeString, codeStringP1, codeStringP2, colorCode, auxString
character (LEN=1), dimension(9999,256) :: code
integer, dimension(8) :: background, frontLabel
integer :: i, j, k, aux, counter, N, P1, P2, lineLength, option
logical :: condition

! resetting codeLine since character variables with long LEN have sometimes already have some garbage on them
input(1:256) = " "
codeLine(1:256) = " "
newCodeString(1:256) = " "
codeString(1:256) = " "
codeStringP1(1:256) = " "
codeStringP2(1:256) = " "
colorCode = " "
code(1:9999,1:256) = " "

! color codes according to the color schemes
background(1) = -262144
background(2) = -654
background(3) = -262144
background(4) = -179712
background(5) = -262009
background(6) = -200231
background(7) = -259969
background(8) = -1
frontLabel(1) = -1
frontLabel(2) = -137601
frontLabel(3) = -1
frontLabel(4) = -1
frontLabel(5) = -137601
frontLabel(6) = -1
frontLabel(7) = -1
frontLabel(8) = -262144

! ============================================================================================

write(*,*)
write(*,*) "d2z-extra: Default to Z - EXTRA"
write(*,*)
write(*,*) "PD: alternative themes converter"
write(*,*) "by Gilberto Agostinho"
write(*,*)
write(*,*) "This program will convert a pd patch containing regular pd-extended objects"
write(*,*) "(such as bng, tgl) into a patch containing zGUI objects. For more information,"
write(*,*) "read the README file"
write(*,*)
write(*,*) "Please type the name of the file you want to convert (it won't be overwritten):"
read(*,*) input
write(*,*)
write(*,*) "If you wish to change the colors of all the sliders and radio objects to match"
write(*,*) "one of the new themes, you can select it from the list below:"
write(*,*) 
write(*,*) "0: do not change the colors"
write(*,*) "1: black-on-white"
write(*,*) "2: dark-solarized"
write(*,*) "3: default"
write(*,*) "4: jMax"
write(*,*) "5: light-solarized"
write(*,*) "6: mint-x"
write(*,*) "7: ubuntu"
write(*,*) "8: white-on-black"

do
	write(*,*) 
	write(*,"(A)",advance="NO") "Please type your choice: "
	read(*,*) option
	if ((option >= 0) .AND. (option <= 8)) exit
	write(*,*) 
	write(*,*) "Error! You must type a number between 0 and 8"
enddo

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
	  			
		! bng -> B
		if ((code(i,j)=="b") .AND. (code(i,(j+1))=="n") .AND. (code(i,(j+2))=="g")) then
			newCodeString = "B;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! tgl -> T
		if ((code(i,j)=="t") .AND. (code(i,(j+1))=="g") .AND. (code(i,(j+2))=="l")) then
			newCodeString = "T;"
			call STRING_TO_CHAR(newCodeString,code,i,j)
			exit
		endif
		
		! adc~ -> zadc~
		if ((code(i,j)=="a") .AND. (code(i,(j+1))=="d") .AND. (code(i,(j+2))=="c")) then
			if (code(i,j-1)/="z") then ! avoiding to mistake it for its z counterpart
				newCodeString = "zadc~;"
				call STRING_TO_CHAR(newCodeString,code,i,j)
				exit
			endif
		endif
		
		! dac~ -> zdac~
		if ((code(i,j)=="d") .AND. (code(i,(j+1))=="a") .AND. (code(i,(j+2))=="c")) then
			if (code(i,j-1)/="z") then ! avoiding to mistake it for its z counterpart
				newCodeString = "zdac~;"
				call STRING_TO_CHAR(newCodeString,code,i,j)
				exit
			endif
		endif
		
		! spigot -> zspigot
		if ((code(i,j)=="s") .AND. (code(i,(j+1))=="p") .AND. (code(i,(j+2))=="i") .AND. (code(i,(j+6))==";")) then
			if (code(i,j-1)/="z") then ! avoiding to mistake it for its z counterpart
				newCodeString = "zspigot;"
				call STRING_TO_CHAR(newCodeString,code,i,j)
				exit
			endif
		endif
		
		! spigot~ -> zspigot~
		if ((code(i,j)=="s") .AND. (code(i,(j+1))=="p") .AND. (code(i,(j+2))=="i") .AND. (code(i,(j+7))==";")) then
			if (code(i,j-1)/="z") then ! avoiding to mistake it for its z counterpart
				newCodeString = "zspigot~;"
				call STRING_TO_CHAR(newCodeString,code,i,j)
				exit
			endif
		endif
				
	enddo
enddo

! ============================================================================================
! change of color

if (option /= 0) then ! if the user chose to change the colors of sliders and radios

	do i=1,N
		do j=1,256	 
		
			! hsl and vsl : color change
			if ( ((code(i,j)=="h") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="l")) .OR. &
		  ((code(i,j)=="v") .AND. (code(i,(j+1))=="s") .AND. (code(i,(j+2))=="l")) )then		
		  
		  	if (code(i,j-1)/="z") then ! avoiding to mistake zvslider for vsl and so on
			
					! resetting variables
					codeString(1:256) = " " 
					newCodeString(1:256) = " "
					codeStringP1(1:256) = " "
					codeStringP2(1:256) = " "
					colorCode(1:256) = " "
				
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
					write(colorCode,"(1x,I7,1x,I7,1x,I7)") background(option), frontLabel(option), frontLabel(option)
					newCodeString = TRIM(codeStringP1)//TRIM(colorCode)//TRIM(codeStringP2)
					call STRING_TO_CHAR(newCodeString,code,i,1)
					exit
					
				endif
				
			endif
			
			! hradio and vradio : color change
			if ( ((code(i,j)=="h") .AND. (code(i,(j+1))=="r") .AND. (code(i,(j+2))=="a")) .OR. &
		  ((code(i,j)=="v") .AND. (code(i,(j+1))=="r") .AND. (code(i,(j+2))=="a")) )then		
		  
		  	if (code(i,j-1)/="z") then ! avoiding to mistake hradio for zhradioN and so on
			
					! resetting variables
					codeString(1:256) = " " 
					newCodeString(1:256) = " "
					codeStringP1(1:256) = " "
					codeStringP2(1:256) = " "
					colorCode(1:256) = " "
				
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
					write(colorCode,"(1x,I7,1x,I7,1x,I7)") background(option), frontLabel(option), frontLabel(option)
					newCodeString = TRIM(codeStringP1)//TRIM(colorCode)//TRIM(codeStringP2)
					call STRING_TO_CHAR(newCodeString,code,i,1)
					exit
					
				endif
								
			endif

		enddo
	enddo
	
endif

! ============================================================================================
! writing information to a new file

open(unit=12,file=TRIM(input)//"-z-extra.pd")

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
write(*,"(A,A,A)") "Success! A file named ", TRIM(input), "-z.pd was created in this directory"

1000 end program d2zextra

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
