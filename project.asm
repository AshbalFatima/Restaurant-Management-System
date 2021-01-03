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
WEL_MSG DB 10,13,10,13,'              ****MOST WELCOME TO PAKISTANI AND CONTINENTAL ****$' 
MAIN_MENU DB 10,13,10,13,'       ***CHOOSE YOUR MENU FROM MAIN MENU*** $' 
SEAT DB 10,13,10,13,'HAVE YOU RESERVED A SEAT? $'
SEAT_CHOICE1 DB 10,13,'1.YES I HAVE$'
SEAT_CHOICE2 DB 10,13,'2(OR ANYSTRING).NO I HAVE NOT$'
CHOICE DB 10,13,10,13,'ENTER YOUR CHOICE: $'
M_CHOICE DB 10,13,10,13,'        ***CHOOSE YOUR FOOD FROM THE MENU***$'
ORDER DB 10,13,10,13,'ENTER YOUR ORDER: $'
NUMBER DB 10,13,'Quantity: $'
PRICE DB 10,13,'Total Price: $'
END_CHOICE1 DB 10,13,10,13,'1.Go Back to Main Menu$'
END_CHOICE2 DB 10,13,'2(OR ANYSTRING).EXIT$'
NEWLINE DB 10,13,10,13,' $'

;MAIN MENU
M_CHOICE1 DB 10,13,'  **              1. IFTAR DINNER MENU         **$' 
M_CHOICE2 DB 10,13,'  **              2. BUFFET DISHES             **$'
M_CHOICE3 DB 10,13,'  **              3. DINNER MENU               **$'
M_CHOICE4 DB 10,13,'  **              4. SNACKS                    **$'
M_CHOICE5 DB 10,13,'  **              5. DESSERT                   **$'
M_CHOICE6 DB 10,13,'  **              6. DRINKS                    **$'  
                              
;IFTAR_DINNER  
ID_CHOICE1 DB 10,13,'  **           1.IRANIAN KHAJOOR         10/-                      **$' 
ID_CHOICE2 DB 10,13,'  **           2.DAHI BALLAY             30/-                      **$'
ID_CHOICE3 DB 10,13,'  **           3.FRUIT CHAAT             30/-                      **$'
ID_CHOICE4 DB 10,13,'  **           4.VARIETY OF CHATNI       10/-                      **$'
ID_CHOICE5 DB 10,13,'  **           5.FROSTED LEMONADES       20/-                      **$'
ID_CHOICE6 DB 10,13,'  **           6.MINT LEMONADE           20/-                      **$'
ID_CHOICE7 DB 10,13,'  **           7.PAKORAS                 60/-                      **$'
ID_CHOICE8 DB 10,13,'  **           8.SPRING LEMONS           20/-                      **$'
ID_CHOICE9 DB 10,13,'  **           9.SAMOSAS                 60/-                      **$' 
 
;BUFFET DISHES 
BD_CHOICE1 DB 10,13,'  **           1.Mutton karahi            90/-                     **$' 
BD_CHOICE2 DB 10,13,'  **           2.kaabli pulao             90/-                     **$' 
BD_CHOICE3 DB 10,13,'  **           3.Chicken Bharta           30/-                     **$' 
BD_CHOICE4 DB 10,13,'  **           4.Zeera pulao              90/-                     **$'
BD_CHOICE5 DB 10,13,'  **           5.Chicken Karahi           90/-                     **$'
BD_CHOICE6 DB 10,13,'  **           6.Plain Rice               10/-                     **$'
BD_CHOICE7 DB 10,13,'  **           7.Palak Paneer             30/-                     **$'
BD_CHOICE8 DB 10,13,'  **           8.Beef Nihari              30/-                     **$'
BD_CHOICE9 DB 10,13,'  **           9.Tawa Paratha             30/-                     **$'

;DINNER
D_CHOICE1 DB 10,13,'  **  1.STARTERS                         60/-                      **$'
D_CHOICE2 DB 10,13,'  **  2.Chicken Bhuna Khichuri           80/-                      **$'
D_CHOICE3 DB 10,13,'  **  3.Mutton Bhuna Khichuri            80/-                      **$' 
D_CHOICE4 DB 10,13,'  **  4.BBQ: Chicken Gola Kabab          40/-                      **$'
D_CHOICE5 DB 10,13,'  **  5.BBQ: Chicken Boneless Boti       50/-                      **$'
D_CHOICE6 DB 10,13,'  **  6.Chicken Cheese Kabab             70/-                      **$'
D_CHOICE7 DB 10,13,'  **  7.Rogni naan                       10/-                      **$'
D_CHOICE8 DB 10,13,'  **  8.Fish                             60/-                      **$'
D_CHOICE9 DB 10,13,'  **  9.Achari PAratha                   10/-                      **$'

;Snacks
SN_CHOICE1 DB 10,13,'  **  1.Sweet Potatoes   8/-                   **$'
SN_CHOICE2 DB 10,13,'  **  2.Loaded Fries     9/-                   **$'
SN_CHOICE3 DB 10,13,'  **  3.Shami/Jali Kabab 5/-                   **$'
SN_CHOICE4 DB 10,13,'  **  4.Plain Fries      5/-                   **$'

;DESSERT
DT_CHOICE1 DB 10,13,'  **  1.Gulaab Jaman     50/-                  **$' 
DT_CHOICE2 DB 10,13,'  **  2.Brownie          50/-                  **$'
DT_CHOICE3 DB 10,13,'  **  3.Plain Custard    50/-                  **$'
DT_CHOICE4 DB 10,13,'  **  4.Rus Malai        50/-                  **$'

;Drinks
DR_CHOICE1 DB 10,13,'  **  1.Coke               8/-                 **$'
DR_CHOICE2 DB 10,13,'  **  2.Sprite             6/-                 **$'
DR_CHOICE3 DB 10,13,'  **  3.Coffee             9/-                 **$'
DR_CHOICE4 DB 10,13,'  **  4.Green Tea          9/-                 **$'
DR_CHOICE5 DB 10,13,'  **  5.Black Tea          7/-                 **$'
DR_CHOICE6 DB 10,13,'  **  6.Mineral Water      5/-                 **$'

;INVALID
INVALID1 DB 10,13,10,13,'***&&INVALID ENTRY&&***$'
INVALID2 DB 10,13,'      ***&&Try Again&&***$'

;BORDER
BORDER1 DB 10,13,'  **                                           **$'
BORDER2 DB 10,13,'  ***********************************************$'
BORDER3 DB 10,13,'  **                                                               **$'
BORDER4 DB 10,13,'  *******************************************************************$'

;*********************************
;MAIN CODE BY ASHBAL
;*********************************
;_________________________________


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,WEL_MSG                       ;WELCOME MSG GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,SEAT                          ;SEAT RESERVATION MSG GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H

    LEA DX,SEAT_CHOICE1                   ;SEAT RESERVATION CHOICE MSG1 GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H

    LEA DX,SEAT_CHOICE2                   ;SEAT RESERVATION CHOICE MSG2 GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H

    LEA DX,CHOICE                        ;ASKING USER TO CHOOSE FROM THE GIVEN CHOICES
    MOV AH,9
    INT 21H

    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BH,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BH,48

    CMP BH,1                             ;IF CHOICE IS NOT 1 i.e. YES,THEN EXIT THE PROGRAM
    JNE EXIT
  
START:                                   ;MAIN MENU i.e. START OF PROGRAM
    LEA DX,MAIN_MENU                     ;MAIN MENU MSG GETS PRINTED ON SCREEN
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
    JE IFTAR_DINNER
    
    CMP BH,2
    JE BUFFET   
     
    CMP BH,3
    JE DINNER     
                                         ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR MENUS ACCORDINGLY
    CMP BH,4                             ;i.e. IF BH=1 , CONTROL WILL GO TO "IFTAR_DINNER" LABEL(MENU)
    JE SNACKS    
     
    CMP BH,5
    JE DESSERTS
    
    CMP BH,6
    JE DRINKS   
    
    JMP INVALID                          ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALID" LABEL
    
;_________________________________

;*********************************
;IFTAR DINNER BY NOSHEEN
;*********************************
;_________________________________


IFTAR_DINNER:                            ;IFTAR_DINNER LABEL STARTS
    LEA DX,M_CHOICE                      ;PRINTING  STRING TO CHOOSE FOOD FROM THE MENU
    MOV AH,9
    INT 21H
    
    LEA DX,NEWLINE ;NEWLINE              ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER4
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER4                       ;UPPER BORDER OF THE MENU
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER3
    MOV AH,9
    INT 21H

    LEA DX,ID_CHOICE1                     ;CHOICE 1 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN 
    MOV AH,9
    INT 21H     
    
    LEA DX,ID_CHOICE2                     ;CHOICE 2 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,ID_CHOICE3                     ;CHOICE 3 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9            
    INT 21H 
    
    LEA DX,ID_CHOICE4                     ;CHOICE 4 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9           
    INT 21H    
    
    LEA DX,ID_CHOICE5                     ;CHOICE 5 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
        
    LEA DX,ID_CHOICE6                     ;CHOICE 6 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H            
    
    LEA DX,ID_CHOICE7                     ;CHOICE 7 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9            
    INT 21H            
            
    LEA DX,ID_CHOICE8                     ;CHOICE 8 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN 
    MOV AH,9
    INT 21H 
    
    LEA DX,ID_CHOICE9                     ;CHOICE 9 OF IFTAR_DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H       
    
    LEA DX,BORDER3
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER4                       ;LOWER BORDER OF THE MENU
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER4
    MOV AH,9
    INT 21H    
    
    LEA DX,ORDER                         ;ASKING USER TO ENTER THE ORDER           
    MOV AH,9
    INT 21H 
        
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BL,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BL,48 
    
    CMP BL,1
    JE TEN
    
    CMP BL,2
    JE THIRTY
    
    CMP BL,3
    JE THIRTY 
    
    CMP BL,4
    JE TEN
                                         ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR LABELS ON THE BASIS OF THEIR PRICES ACCORDINGLY
    CMP BL,5                             ;i.e. IF BH=1, HAVING AN ORDER OF PRICE 10 , CONTROL WILL GO TO "TEN" LABEL
    JE TWENTY
    
    CMP BL,6
    JE TWENTY
    
    CMP BL,7
    JE SIXTY
    
    CMP BL,8
    JE TWENTY
    
    CMP BL,9
    JE SIXTY
    
    JMP INVALID                          ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALID" LABEL     


;_________________________________

;*********************************
;BUFFET BY DAUD
;*********************************
;_________________________________

BUFFET:                                  ;BUFFET DISHES LABEL STARTS
    LEA DX,M_CHOICE                      ;PRINTING  STRING TO CHOOSE FOOD FROM THE MENU
    MOV AH,9
    INT 21H
        
    LEA DX,NEWLINE                       ;NEWLINE 
    MOV AH,9
    INT 21H
     
    LEA DX,BORDER4
    MOV AH,9
    INT 21H
         
    LEA DX,BORDER4                       ;UPPER BORDER OF THE MENU
    MOV AH,9
    INT 21H
                  
    LEA DX,BORDER3
    MOV AH,9
    INT 21H
    
    LEA DX,BD_CHOICE1                    ;CHOICE 1 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN 
    MOV AH,9
    INT 21H 
    
    LEA DX,BD_CHOICE2                    ;CHOICE 2 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN 
    MOV AH,9
    INT 21H
    
    LEA DX,BD_CHOICE3                    ;CHOICE 3 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H  
    
    LEA DX,BD_CHOICE4                    ;CHOICE 4 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,BD_CHOICE5                    ;CHOICE 5 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H                        
        
    LEA DX,BD_CHOICE6                    ;CHOICE 6 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,BD_CHOICE7                    ;CHOICE 7 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,BD_CHOICE8                    ;CHOICE 8 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H  
    
    LEA DX,BD_CHOICE9                    ;CHOICE 9 OF BUFFET DISHES MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H     
        
    LEA DX,BORDER3
    MOV AH,9
    INT 21H
                    
    LEA DX,BORDER4                       ;LOWER BORDER OF THE MENU
    MOV AH,9
    INT 21H
        
    LEA DX,BORDER4
    MOV AH,9
    INT 21H 
        
    LEA DX,ORDER                         ;ASKING USER TO ENTER THE ORDER       
    MOV AH,9
    INT 21H 
        
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BL,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BL,48 
    
    CMP BL,1
    JE NINETY

    CMP BL,2
    JE NINETY
    
    CMP BL,3
    JE THIRTY
    
    CMP BL,4
    JE NINETY
                                         ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR LABELS ON THE BASIS OF THEIR PRICES ACCORDINGLY
    CMP BL,5                             ;i.e. IF BH=1, HAVING AN ORDER OF PRICE 90 , CONTROL WILL GO TO "NINETY" LABEL
    JE NINETY
    
    CMP BL,6
    JE TEN
    
    CMP BL,7
    JE THIRTY
    
    CMP BL,8
    JE THIRTY 
    
    CMP BL,9
    JE THIRTY    
    
    JMP INVALID                          ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALID" LABEL

;_________________________________

;*********************************
;DINNER BY HAIDER
;*********************************
;_________________________________

DINNER:                                  ;HERE DINNER LABEL STARTS
    LEA DX,M_CHOICE                      ;PRINTING  STRING TO CHOOSE FOOD FROM THE MENU
    MOV AH,9         
    INT 21H
    
    LEA DX,NEWLINE                       ;LOAD COMMAND FOR NEWLINE 
    MOV AH,9
    INT 21H
        
    LEA DX,BORDER4
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER4                       ;DESIGNING FOR UPPER BORDER OF THE MENU
    MOV AH,9
    INT 21H      
    
    LEA DX,BORDER3
    MOV AH,9
    INT 21H
        
    LEA DX,D_CHOICE1                     ;CHOICE 1 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,D_CHOICE2                     ;CHOICE 2 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9              
    INT 21H    
    
    LEA DX,D_CHOICE3                     ;CHOICE 3 OF DINNER MENU GETS PRINTED ON SCREEN        
    MOV AH,9
    INT 21H
    
    LEA DX,D_CHOICE4                     ;CHOICE 4 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9                
    INT 21H  
        
    LEA DX,D_CHOICE5                     ;CHOICE 5 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H     
    
    LEA DX,D_CHOICE6                     ;CHOICE 6 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H    
     
    LEA DX,D_CHOICE7                     ;CHOICE 7 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,D_CHOICE8                     ;CHOICE 8 OF DINNER MENU GETS PRINTED ON SCREEN                    
    MOV AH,9
    INT 21H 
    
    LEA DX,D_CHOICE9                     ;CHOICE 9 OF DINNER MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H     
       
    LEA DX,BORDER3
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER4                       ;LOWER BORDER OF THE MENU
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER4
    MOV AH,9
    INT 21H   
        
    LEA DX,ORDER                         ;ASKING USER TO ENTER THE ORDER       
    MOV AH,9
    INT 21H     
    
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BL,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BL,48 
    
    CMP BL,1
    JE SIXTY
    
    CMP BL,2
    JE EIGHTY
    
    CMP BL,3
    JE EIGHTY
    
    CMP BL,4
    JE FORTY
                                         ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR LABELS ON THE BASIS OF THEIR PRICES ACCORDINGLY
    CMP BL,5                             ;i.e. IF BH=1, HAVING AN ORDER OF PRICE 60 , CONTROL WILL GO TO "SIXTY" LABEL
    JE FIFTY
    
    CMP BL,6
    JE SEVENTY
    
    CMP BL,7
    JE TEN
    
    CMP BL,8
    JE SIXTY
    
    CMP BL,9
    JE TEN

    JMP INVALID                          ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALID" LABEL
        
SNACKS:                                  ;SNACKS LABEL STARTS
    LEA DX,M_CHOICE                      ;PRINTING  STRING TO CHOOSE FOOD FROM THE MENU
    MOV AH,9         
    INT 21H
    
    LEA DX,NEWLINE                       ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER2
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER2                       ;UPPER BORDER OF THE MENU
    MOV AH,9
    INT 21H     
    
    LEA DX,BORDER1
    MOV AH,9
    INT 21H
    
    LEA DX,SN_CHOICE1                    ;CHOICE 1 OF SNACKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,SN_CHOICE2                    ;CHOICE 2 OF SNACKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H                         
    
    LEA DX,SN_CHOICE3                    ;CHOICE 3 OF SNACKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,SN_CHOICE4                    ;CHOICE 4 OF SNACKS MENU GETS PRINTED ON SCREEN
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
    
    LEA DX,ORDER                         ;ASKING USER TO ENTER THE ORDER         
    MOV AH,9
    INT 21H     
    
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BL,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BL,48 
    
    CMP BL,1
    JE EIGHT
    
    CMP BL,2
    JE NINE
                                         ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR LABELS ON THE BASIS OF THEIR PRICES ACCORDINGLY
    CMP BL,3                             ;i.e. IF BH=1, HAVING AN ORDER OF PRICE 8 , CONTROL WILL GO TO "EIGHT" LABEL
    JE FIVE
    
    CMP BL,4
    JE FIVE
    
    JMP INVALID                          ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALID" LABEL

;_________________________________

;*********************************
;DESSERTS BY KOMAL
;*********************************
;_________________________________

DESSERTS:                                ;DESSERTS LABEL STARTS
    LEA DX,M_CHOICE                      ;PRINTING  STRING TO CHOOSE FOOD FROM THE MENU
    MOV AH,9        
    INT 21H 
    
    LEA DX,NEWLINE                       ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER2
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER2                       ;UPPER BORDER OF THE MENU
    MOV AH,9
    INT 21H     
    
    LEA DX,BORDER1
    MOV AH,9
    INT 21H

    LEA DX,DT_CHOICE1                    ;CHOICE 1 OF DESSERTS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,DT_CHOICE2                    ;CHOICE 2 OF DESSERTS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H                         
    
    LEA DX,DT_CHOICE3                    ;CHOICE 3 OF DESSERTS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,DT_CHOICE4                    ;CHOICE 4 OF DESSERTS MENU GETS PRINTED ON SCREEN
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
    
    LEA DX,ORDER                         ;ASKING USER TO ENTER THE ORDER         
    MOV AH,9
    INT 21H     
    
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BL,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BL,48
     
    CMP BL,4                             ;IF CHOICE>4 , GO TO INVALID LABEL
    JG INVALID 

    JMP FIFTY                            ;ELSE GO TO FIFTY LABEL, BECAUSE ALL THESE ORDERS HAVE PRICE=50


;_________________________________

;*********************************
;DRINKS AND SNACKS BY ASHBAL
;*********************************
;_________________________________


DRINKS:                                  ;DRINKS LABEL STARTS
    LEA DX,M_CHOICE                      ;PRINTING  STRING TO CHOOSE FOOD FROM THE MENU
    MOV AH,9            
    INT 21H 
    
    LEA DX,NEWLINE                       ;NEWLINE
    MOV AH,9
    INT 21H
    
    LEA DX,BORDER2
    MOV AH,9
    INT 21H    
    
    LEA DX,BORDER2                       ;UPPER BORDER OF THE MENU
    MOV AH,9
    INT 21H     
    
    LEA DX,BORDER1
    MOV AH,9
    INT 21H

    LEA DX,DR_CHOICE1                    ;CHOICE 1 OF DRINKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,DR_CHOICE2                    ;CHOICE 2 OF DRINKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H                         
    
    LEA DX,DR_CHOICE3                    ;CHOICE 3 OF DRINKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,DR_CHOICE4                    ;CHOICE 4 OF DRINKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H 
    
    LEA DX,DR_CHOICE5                    ;CHOICE 5 OF DRINKS MENU GETS PRINTED ON SCREEN
    MOV AH,9
    INT 21H
    
    LEA DX,DR_CHOICE6                    ;CHOICE 6 OF DRINKS MENU GETS PRINTED ON SCREEN
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
    
    LEA DX,ORDER                         ;ASKING USER TO ENTER THE ORDER              
    MOV AH,9
    INT 21H 
        
    MOV AH,1                             ;READ A CHARACTER i.e. CHOICE
    INT 21H
    MOV BL,AL                            ;CONVERT IT TO HEXADECIMAL
    SUB BL,48 
    
    CMP BL,1
    JE EIGHT
    
    CMP BL,2
    JE SIX
    
    CMP BL,3                             ;COMARING ALL VALUES WITH HEX VALUE AND GO TO FURTHUR LABELS ON THE BASIS OF THEIR PRICES ACCORDINGLY
    JE NINE                              ;i.e. IF BH=1, HAVING AN ORDER OF PRICE 8 , CONTROL WILL GO TO "EIGHT" LABEL
    
    CMP BL,4
    JE NINE
    
    CMP BL,5
    JE SEVEN 
    
    CMP BL,6
    JE FIVE    
    
    JMP INVALID                           ;IF NO CHOICE MATCHES, CONTROL GOES TO "INVALID" LABEL    
;_________________________________

;*********************************
;COMMON CODING FOR WHOLE PROGRAMS BY KOMAL
;*********************************
;_________________________________

COMMON:                                   ;COMMON LABEL STARTS
    LEA DX,NUMBER                         ;ASKING USER FOR THE QUANTITY OF ORDER ENTERED           
    MOV AH,9
    INT 21H
    
    MOV AH,1                             ;READS A CHARACTER i.e. QUANTITY OF ORDER
    INT 21H
    SUB AL,48                            ;CONVERTING IT TO HEXADECIMAL
    
    MUL BL                               ;AX=BL*AL i.e. TOTAL PRICE=ORDER PRICE x ORDER QUANTITY
    AAM                                  ;ASCII ADJUSTMENT
    
    MOV CX,AX                            ;CX=AX
    ADD CH,48                            ;CONVERTING AGAIN IN ASCII i.e. CHARACTER
    ADD CL,48                            ;CONVERTING AGAIN IN ASCII i.e. CHARACTER

    LEA DX,PRICE                         ;DISPLAYING STRING OF PRICE    
    MOV AH,9
    INT 21H

    MOV AH,2                             ;DISPLAYING THE FOUND CHARACTER i.e. TOTAL PRICE
    MOV DL,CH
    INT 21H

    MOV DL,CL                            ;MOVING THE LAST CHARACTER OF TOTAL PRICE TO DL
    INT 21H 
        
    MOV DL,47
    INT 21H
    MOV DL,45                            ;FOR /- SYMBOL PRINT
    INT 21H
    
    LEA DX,END_CHOICE1                   ;STRING WITH OPTION TO REVISIT THE MAIN MENU WILL APPEAR
    MOV AH,9
    INT 21H
    
    LEA DX,END_CHOICE2                   ;STRING WITH OPTION TO EXIT PROGRAM WILL APPEAR
    MOV AH,9
    INT 21H
    
    LEA DX,CHOICE                        ;ASKING USER TO MAKE A CHOICE
    MOV AH,9 
    INT 21H 
    
    MOV AH,1                             ;READ THE CHARACTER i.e. CHOICE
    INT 21H
    SUB AL,48                            ;CONVERTING IT TO HEXADECIMAL
    
    CMP AL,1                             ;IF CHOICE=1
    JE START                               ;CONTROL WILL GO BACK TO START LABEL, i.e. MAIN MENU
    
    JMP EXIT                             ;ELSE CONTROL WILL GO TO EXIT LABEL

COMMON1:                                 ;COMMON1 LABEL STARTS  
    LEA DX,NUMBER                        ;ASKING USER FOR THE QUANTITY OF ORDER ENTERED            
    MOV AH,9
    INT 21H 
        
    MOV AH,1                             ;READS A CHARACTER i.e. QUANTITY OF ORDER
    INT 21H
    SUB AL,48                            ;CONVERTING IT TO HEXADECIMAL
         
    MUL BL                               ;AX=BL*AL i.e. TOTAL PRICE=ORDER PRICE x ORDER QUANTITY
    AAM                                  ;ASCII ADJUSTMENT
 
    MOV CX,AX                            ;CX=AX
    ADD CH,48                            ;CONVERTING AGAIN IN ASCII i.e. CHARACTER
    ADD CL,48                            ;CONVERTING AGAIN IN ASCII i.e. CHARACTER
    
    LEA DX,PRICE                         ;DISPLAYING STRING OF PRICE       
    MOV AH,9
    INT 21H
    
    MOV AH,2                             
    MOV DL,CH                            ;DISPLAYING THE FOUND CHARACTER i.e. TOTAL PRICE
    INT 21H    
    
    MOV DL,CL                            ;MOVING THE LAST CHARACTER OF TOTAL PRICE TO DX
    INT 21H
    
    MOV DL,'0'                           ;PLACING '0' AT THE END OF TOTAL PRICE
    INT 21H
    
    MOV DL,47
    INT 21H                              ;FOR /- SYMBOL PRINT
    MOV DL,45
    INT 21H
    
    LEA DX,END_CHOICE1                   ;STRING WITH OPTION TO REVISIT THE MAIN MENU WILL APPEAR
    MOV AH,9
    INT 21H
    
    LEA DX,END_CHOICE2                  ;STRING WITH OPTION TO EXIT PROGRAM WILL APPEAR
    MOV AH,9
    INT 21H
    
    LEA DX,CHOICE                       ;ASKING USER TO MAKE A CHOICE
    MOV AH,9
    INT 21H 
    
    MOV AH,1                            ;READ THE CHARACTER i.e. CHOICE
    INT 21H
    SUB AL,48                           ;CONVERTING IT TO HEXADECIMAL
    
    CMP AL,1                            ;IF CHOICE=1
    JE START                              ;CONTROL WILL GO BACK TO START LABEL, i.e. MAIN MENU
    
    JMP EXIT                            ;ELSE CONTROL WILL GO TO EXIT LABEL

; ALL LABELS JUMPS UNCONDITIONALLY TO LABEL COMMON
FIVE:                                    ;LABEL FOR PRICE=5 ORDERS
    MOV BL,5                             ;BL=5
    JMP COMMON                           

SIX:                                     ;LABEL FOR PRICE=6 ORDERS
    MOV BL,6                             ;BL=6
    JMP COMMON                           

SEVEN:                                   ;LABEL FOR PRICE=7 ORDERS
    MOV BL,7                             ;BL=7
    JMP COMMON                           

EIGHT:                                   ;LABEL FOR PRICE=8 ORDERS
    MOV BL,8                             ;BL=8
    JMP COMMON                          

NINE:                                    ;LABEL FOR PRICE=9 ORDERS
    MOV BL,9                             ;BL=9
    JMP COMMON        
                  
; ALL LABELS JUMPS UNCONDITIONALLY TO LABEL COMMON1
TEN:                                     ;LABEL FOR PRICE=10 ORDERS
    MOV BL,1                             ;BL=1
    JMP COMMON1

TWENTY:                                  ;LABEL FOR PRICE=20 ORDERS
    MOV BL,2                             ;BL=2
    JMP COMMON1

THIRTY:                                  ;LABEL FOR PRICE=30 ORDERS
    MOV BL,3                             ;BL=3
    JMP COMMON1

FORTY:                                   ;LABEL FOR PRICE=40 ORDERS
    MOV BL,4                             ;BL=4
    JMP COMMON1

FIFTY:                                   ;LABEL FOR PRICE=50 ORDERS
    MOV BL,5                             ;BL=5
    JMP COMMON1

SIXTY:                                   ;LABEL FOR PRICE=60 ORDERS
    MOV BL,6                             ;BL=6
    JMP COMMON1

SEVENTY:                                 ;LABEL FOR PRICE=70 ORDERS
    MOV BL,7                             ;BL=7
    JMP COMMON1

EIGHTY:                                  ;LABEL FOR PRICE=80 ORDERS
    MOV BL,8                             ;BL=8
    JMP COMMON1

NINETY:                                  ;LABEL FOR PRICE=90 ORDERS
    MOV BL,9                             ;BL=9
    JMP COMMON1 
     
INVALID:                                 ;INVALID LABEL STARTS
    LEA DX,INVALID1                      ;PRINTS CHOICE IS INVALID
    MOV AH,9
    INT 21H 
     
    LEA DX,INVALID2                      ;PRINTS TRY AGAIN
    MOV AH,9
    INT 21H 
  
    JMP START                              ;GO BACK TO LABEL START, i.e. MAIN MENU

;code end
EXIT:                                    ;EXIT LABEL STARTS
    MOV AH,4CH
    INT 21H                              ;PROGRAM ENDS
    MAIN ENDP
END MAIN
