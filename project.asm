;code start
.MODEL LARGE
.STACK 1000H
.DATA

;_________________________________

;*********************************
;     FRONT END BY HAIDER
;*********************************
;_________________________________

QUANTITY DB ?
WEL_MSG DB 10,13,10,13,'                 ****MOST WELCOME TO PAKISTANI AND CONTINENTAL ****$',10,13 
SEAT DB 10,13,10,13,'HAVE YOU RESERVED A SEAT? $'
SEAT_CHOICE DB 10,13,10,13,'PRESS 1 FOR YES AND ANYTHING FOR NO: $'
CHOICE DB 10,13,10,13,'ENTER YOUR CHOICE: $'
M_CHOICE DB 10,13,10,13,'---CHOOSE YOUR FOOD FROM THE MENU---$'
ORDER DB 10,13,10,13,'ENTER YOUR ORDER: $'
NUMBER DB 10,13,'Quantity: $'
PRICE DB 10,13,'Total Price: $'
END_CHOICE1 DB 10,13,10,13,'1.Go Back to Main Menu$'
END_CHOICE2 DB 10,13,'2(OR ANYSTRING).EXIT$'
NEWLINE DB 10,13,10,13,' $'

;MAIN MENU

M3 DB 10,13,'  **                 1. IFTAR DINNER MENU         **$' 
M4 DB 10,13,'  **                 2. BUFFET DISHES             **$'
MS5 DB 10,13,'  **                3. Dinner Menue            **$'
M5 DB 10,13,'  **                 4. Snacks                  **$'
M6 DB 10,13,'  **                 5. DESSERT              **$'
M7 DB 10,13,'  **                 6. Drinks                  **$'  
               
               
M8 DB 10,13,10,13,'***what you want to choose from our menu:***$'
  
;IFTAR DINNER MENU 
M9 DB 10,13,'  **            1.IRANIAN KHAJOOR           30/-                      **$' ;iftari menu
M10 DB 10,13,'  **           2.DAHI BALLAY               110/-                      **$'
M11 DB 10,13,'  **           3.FRUIT CHAAT               110/-                      **$'
M12 DB 10,13,'  **           4.VARIETY OF CHATNI         60/-                      **$'
M13 DB 10,13,'  **           5.FROSTED LEMONADES         120/-                      **$'
M14 DB 10,13,'  **           6.MINT LEMONADE             120/-                      **$'
M15 DB 10,13,'  **           7.PAKORAS                   230/-                      **$'
M16 DB 10,13,'  **           8.SPRING LEMONS             120/-                      **$'
M17 DB 10,13,'  **           9.SAMOSAS                   60/-                      **$' 

 

;BUFFET DISHES

M25 DB 10,13,'  **  1.Mutton karahi              490/-                **$' 
M26 DB 10,13,'  **  2.kaabli pulao               230/-                **$' 
M27 DB 10,13,'  **  3.Chicken Bharta             130/-                **$' 
M28 DB 10,13,'  **  4.Palak Paneer               340/-                **$'
M29 DB 10,13,'  **  5.Chicken Karahi             100/-                **$'
M30 DB 10,13,'  **  6.Zeera pulao                110/-                **$'
M31 DB 10,13,'  **  7.Plain Rice                 120/-                **$'
M32 DB 10,13,'  **  8.Beef Nihari                70/-                **$'
M33 DB 10,13,'  **  9.Tawa Paratha               80/-                **$'
 

 
 
;DINNER

M18 DB 10,13,'  **  1.starters                        60/-                               **$'
M19 DB 10,13,'  **  2.Chicken Tikka Pizza             780/-                               **$'
M20 DB 10,13,'  **  3.Chicken Fajita Pizza            1080/-                               **$' 
M21 DB 10,13,'  **  4.Chicken Pizza Special           1140/-                               **$'
M22 DB 10,13,'  **  5.BBQ: Chicken Gola Kabab         950/-                               **$'
M23 DB 10,13,'  **  6.BBQ: Chicken Boneless Boti      670/-                               **$'
M34 DB 10,13,'  **  7.Chicken Cheese Kabab            160/-                               **$'
M35 DB 10,13,'  **  8.Rogni naan                      20/-                               **$'
M36 DB 10,13,'  **  9.Achari PAratha                  120/-                               **$'


;snacks

M41 DB 10,13,'  **  1.Alfredo Pasta                            380/-                  **$'
M42 DB 10,13,'  **  2.Garlic mayo Fries                        180/-                 **$'
M43 DB 10,13,'  **  3.Fries in Box coated with chicken         125/-                  **$'
M44 DB 10,13,'  **  4.Cheese Cake                              455/-                  **$'

;DESSERT
M45 DB 10,13,'  **  1.Gulaab Jaman        50/-                           **$' 
M46 DB 10,13,'  **  2.Chocolate Brownie   350/-                           **$'
M47 DB 10,13,'  **  3.Plain Custard       120/-                           **$'
M48 DB 10,13,'  **  4.Rus Malai           50/-                           **$'

;Drinks
M49 DB 10,13,'  **  1. Coke             80/-                      **$'
M50 DB 10,13,'  **  2. Sprite           80/-                      **$'
M51 DB 10,13,'  **  3. Mineral Water    50/-                      **$'
M52 DB 10,13,'  **  4. Green Tea        110/-                      **$'
M53 DB 10,13,'  **  5. Black Tea        90/-                      **$'
M54 DB 10,13,'  **  6. Coffee           135/-                      **$'



;INVALID
M55 DB 10,13,10,13,'***&&INVALID ENTRY&&***$'
M56 DB 10,13,'      ***&&Try Again&&***$'



M57 DB 10,13,10,13,'Please Enter your order here: $'
M58 DB 10,13,'How Much: $'
M59 DB 10,13,'Total Bill: $'


DRINK DB ?
QUANTITY DB ?


M60 DB 10,13,10,13,'1.Go Back to Main Menu$'
M61 DB 10,13,'2.EXIT$'

;STAR RESIZE


MR1 DB 10,13,'  **                                           **$'
MR2 DB 10,13,'  ***********************************************$'

MR3 DB 10,13,'  **                                           **$'


MR4 DB 10,13,'  **                                                               **$'
MR5 DB 10,13,'  *******************************************************************$'



MR6 DB 10,13,'  **                                          **$'
MR7 DB 10,13,'  **********************************************$'


SEJ DB 10,13,10,13,' $'


;_________________________________

;*********************************
;MAIN CODE BY ASHBAL
;*********************************
;_________________________________


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,SEAT                          ;SEAT RESERVATION MSG GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H

    LEA DX,SEAT_CHOICE                   ;SEAT RESERVATION CHOICE MSG GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H

    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BH,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BH,48

    CMP BH,1                             ;IF CHOICE IS NOT 1 i.e. YES,THEN EXIT THE PROGRAM
    JNE EXIT
  
START:                                   ;MAIN MENU i.e. START OF PROGRAM
    LEA DX,WEL_MSG                       ;WELCOME MSG GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,NEWLINE                       ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER2                           
    MOV AH,9
    INT 21H
       
    LEA DX,BORDER2
    MOV AH,9                             ; UPPER BORDER OF THE MENU
    INT 21H                                 
    
    LEA DX,BORDER1
    MOV AH,9
    INT 21H   
    
    LEA DX,M_CHOICE1                     ;CHOICE 1 OF MAIN MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,M_CHOICE2                     ;CHOICE 2 OF MAIN MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,M_CHOICE3                     ;CHOICE 3 OF MAIN MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,M_CHOICE4                     ;CHOICE 4 OF MAIN MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,M_CHOICE5                     ;CHOICE 5 OF MAIN MENU GETS PRINTED ON SCREEN 
    MOV AH,9
    INT 21H
    
    LEA DX,M_CHOICE6                     ;CHOICE 6 OF MAIN MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER1
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER2                       ;LOWER BORDER OF THE MENU
    MOV AH,9
    INT 21H
                                           
    LEA DX,BORDER2
    MOV AH,9
    INT 21H
    
    LEA DX,CHOICE                        ;ASKING USER TO CHOOSE FROM THE GIVEN CHOICES
    MOV AH,9
    INT 21H
     
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BH,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BH,48
    
    CMP BH,1
    JE BREATFAST
    
    CMP BH,2
    JE LD   
     
    CMP BH,3
    JE DINNER     
                                         ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR MENUS ACCORDINGLY
    CMP BH,4                             ;i.e. IF BH=1 , CONTROL WILL GO TO "BREAKFAST" LABEL(MENU)
    JE SNACKS    
     
    CMP BH,5
    JE SWEETMEAT
    
    CMP BH,6
    JE DRINKS   
    
    JMP INVALID                          ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALD" LABEL
  
  
 ;_________________________________

;*********************************
;BREAKFAST BY NOSHEEN
;*********************************
;_________________________________





;_________________________________

;*********************************
;LUNCH BY DAUD
;*********************************
;_________________________________



;_________________________________

;*********************************
;DINNER BY HAIDER
;*********************************
;_________________________________



;_________________________________

;*********************************
;DESSERTS BY KOMAL
;*********************************
;_________________________________



;_________________________________

;*********************************
;DRINKS AND SNACKS BY ASHBAL
;*********************************
;_________________________________




;code end
 EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
