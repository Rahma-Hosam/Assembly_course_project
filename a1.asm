;=========================================
; ARCADE.ASM
;=========================================
.MODEL SMALL
.STACK 100h

.DATA
arcade_header   DB 0Dh, 0Ah, "========== MAIN MENU ==========", 0Dh, 0Ah, "$"
menu_option1    DB "[1] Scrabble", 0Dh, 0Ah, "$"
menu_option2    DB "[2] Caesar Cipher", 0Dh, 0Ah, "$"
menu_option3    DB "[3] Word Guess", 0Dh, 0Ah, "$"
menu_option4    DB "[4] Exit", 0Dh, 0Ah, "$"
menu_prompt     DB "Choose an option (1-4): $"
invalid_msg     DB 0Dh, 0Ah, "Invalid choice! Try again.", 0Dh, 0Ah, "$"
goodbye         DB 0Dh, 0Ah, "Thanks for playing Arcade!", 0Dh, 0Ah, "$"
replay_msg        DB 0Dh, 0Ah, "Play again? (Y/N): $"           ; Shared message!

arcade_header1 DB 0Dh, 0Ah, "     db    .d88b. .d88b 888 888       db                      8      ", 0Dh, 0Ah, "$"
arcade_header2 DB "    dPYb   YPwww. 8P     8   8       dPYb   8d8b .d8b .d88 .d88 .d88b", 0Dh, 0Ah, "$"
arcade_header3 DB "   dPwwYb      d8 8b     8   8      dPwwYb  8P   8    8  8 8  8 8.dP' ", 0Dh, 0Ah, "$"
arcade_header4 DB "  dP    Yb `Y88P' `Y88P 888 888    dP    Yb 8    `Y8P `Y88 `Y88 `Y88P ", 0Dh, 0Ah, "$"

arc_header_table DW arcade_header1, arcade_header2, arcade_header3, arcade_header4

;==============================
; GAME 1 - Scrabble
;==============================

scrabble_header1  DB 0Dh, 0Ah, 0Dh, 0Ah, "================================================================================", 0Dh, 0Ah, "$"
scrabble_header2  DB "   ######   ######  ########     ###    ########  ########  ##       ######## ", 0Dh, 0Ah, "$"
scrabble_header3  DB "  ##    ## ##    ## ##     ##   ## ##   ##     ## ##     ## ##       ##       ", 0Dh, 0Ah, "$"
scrabble_header4  DB "  ##       ##       ##     ##  ##   ##  ##     ## ##     ## ##       ##       ", 0Dh, 0Ah, "$"
scrabble_header5  DB "   ######  ##       ########  ##     ## ########  ########  ##       ######   ", 0Dh, 0Ah, "$"
scrabble_header6  DB "        ## ##       ##   ##   ######### ##     ## ##     ## ##       ##       ", 0Dh, 0Ah, "$"
scrabble_header7  DB "  ##    ## ##    ## ##    ##  ##     ## ##     ## ##     ## ##       ##       ", 0Dh, 0Ah, "$"
scrabble_header8  DB "   ######   ######  ##     ## ##     ## ########  ########  ######## ########", 0Dh, 0Ah, 0Dh, 0Ah, "$"
scrabble_header9  DB "================================================================================", 0Dh, 0Ah, "$"

scr_header_table    DW scrabble_header1, scrabble_header2, scrabble_header3, scrabble_header4
                    DW scrabble_header5, scrabble_header6, scrabble_header7, scrabble_header8, scrabble_header9
                    
scr_prompt1       DB 0Dh, 0Ah, "Player 1: $"
scr_prompt2       DB 0Dh, 0Ah, "Player 2: $"
scr_win1          DB 0Dh, 0Ah, "Player 1 wins", 0Dh, 0Ah, "$"
scr_win2          DB 0Dh, 0Ah, "Player 2 wins", 0Dh, 0Ah, "$"
scr_tie           DB 0Dh, 0Ah, "Tie", 0Dh, 0Ah, "$"
returning_msg     DB 0Dh, 0Ah, "Returning to main menu...", 0Dh, 0Ah, "$"

scr_buffer1       DB 40, 0, 40 DUP(?)
scr_buffer2       DB 40, 0, 40 DUP(?)
scr_score1        DW ?
scr_score2        DW ?

scr_POINTS        DB 1,3,3,2,1,4,2,4,1,8,5,1,3,1,1,3,10,1,1,1,1,4,4,8,4,10

;==============================
; GAME 2 - Caesar Cipher
;==============================

caesar_header1 DB 0Dh, 0Ah, "    .oooooo.                                                  ", 0Dh, 0Ah, "$"
caesar_header2 DB "   d8P'  `Y8b                                                 ", 0Dh, 0Ah, "$"
caesar_header3 DB "  888           .oooo.    .ooooo.   .oooo.o  .oooo.   oooo d8b", 0Dh, 0Ah, "$"
caesar_header4 DB "  888          `P  )88b  d88' `88b d88(  (8 `P  )88b  `888""8P", 0Dh, 0Ah, "$"
caesar_header5 DB "  888           .oP*888  888ooo888 `*Y88b.   .oP*888   888    ", 0Dh, 0Ah, "$"
caesar_header6 DB "  `88b    ooo  d8(  888  888    .o o.  )88b d8(  888   888    ", 0Dh, 0Ah, "$"
caesar_header7 DB "   `Y8bood8P'  `Y888""8o  `Y8bod8P'  ""888P'  `888""8P   d888b  ", 0Dh, 0Ah, "$"

csr_header_table DW caesar_header1, caesar_header2, caesar_header3, caesar_header4, caesar_header5, caesar_header6, caesar_header7

caesar_header    DB 0Dh,0Ah, 0Dh,0Ah,"------ Caesar Cipher Game ------",0Dh,0Ah,"$"
caesar_mode_menu DB 0Dh,0Ah,"[1] Encrypt",0Dh,0Ah,"[2] Decrypt",0Dh,0Ah,"Choice: $"
caesar_text_msg  DB 0Dh,0Ah,"Enter text: $"
caesar_shift_msg DB 0Dh,0Ah,"Enter shift (0-9): $"
caesar_result    DB 0Dh,0Ah,"Result: $"
caesar_back_msg  DB 0Dh,0Ah,"Press any key to return...",0Dh,0Ah,"$"

caesar_buffer    DB 100,0,100 DUP(?)

;==============================
; GAME 3 - Word Guess
;==============================

guess_header1 DB 0Dh, 0Ah, "     .aMMMMP dMP dMP dMMMMMP .dMMMb  .dMMMb", 0Dh, 0Ah,"$"
guess_header2 DB "    dMP*    dMP dMP dMP     dMP* VP dMP* VP", 0Dh, 0Ah,"$"
guess_header3 DB "   dMP MMP*dMP dMP dMMMP    VMMMb   VMMMb  ", 0Dh, 0Ah,"$"
guess_header4 DB "  dMP.dMP dMP.aMP dMP     dP .dMP dP .dMP  ", 0Dh, 0Ah,"$"
guess_header5 DB "  VMMMP*  VMMMP* dMMMMMP  VMMMP*  VMMMP*   ", 0Dh, 0Ah,"$"

gss_header_table DW guess_header1, guess_header2, guess_header3, guess_header4, guess_header5

guess_header       DB 0Dh,0Ah, 0Dh,0Ah,"------- WORD GUESS GAME -------",0Dh,0Ah,"$"
guess_p1_msg       DB 0Dh,0Ah,"Player 1: Enter a word: $"
guess_p2_msg       DB 0Dh,0Ah,"Player 2: Guess a character: $"
guess_attempts_msg DB 0Dh,0Ah,"Attempts Left: ", "$" 
guess_correct_msg  DB 0Dh,0Ah,"Correct! Attempts +1",0Dh,0Ah,"$"
guess_wrong_msg    DB 0Dh,0Ah,"Wrong! Attempts -1",0Dh,0Ah,"$"
guess_win_msg      DB 0Dh,0Ah,"Word guessed!",0Dh,0Ah,"$"
guess_lose_msg     DB 0Dh,0Ah,"No attempts left.",0Dh,0Ah,"$"
guess_back_msg     DB 0Dh,0Ah,"Returning to main menu...",0Dh,0Ah,"$"

guess_word_buffer  DB 40,0,40 DUP(?)
guess_mask_buffer  DB 40 DUP('?')
;=========================================

.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax

MAIN_MENU:
    call CLEAR_SCREEN
    
    lea si, arc_header_table
    mov cx, 4
ARC_HEADER_LOOP:
    mov dx, [si] 
    call PRINT_STR
    add si, 2
    loop ARC_HEADER_LOOP

    mov dx, OFFSET arcade_header
    call PRINT_STR
    mov dx, OFFSET menu_option1
    call PRINT_STR
    mov dx, OFFSET menu_option2
    call PRINT_STR
    mov dx, OFFSET menu_option3
    call PRINT_STR
    mov dx, OFFSET menu_option4
    call PRINT_STR
    mov dx, OFFSET menu_prompt
    call PRINT_STR

    mov ah, 01h
    int 21h

    cmp al, '1'
    je  LAUNCH_SCRABBLE
    cmp al, '2'
    je  LAUNCH_GAME2
    cmp al, '3'
    je  LAUNCH_GAME3
    cmp al, '4'
    je  EXIT_ARCADE

    mov dx, OFFSET invalid_msg
    call PRINT_STR
    jmp MAIN_MENU

LAUNCH_SCRABBLE:
    call CLEAR_SCREEN
    call SCRABBLE_GAME
    jmp MAIN_MENU

LAUNCH_GAME2:
    call CLEAR_SCREEN
    call CAESAR_GAME
    jmp MAIN_MENU

LAUNCH_GAME3:
    call CLEAR_SCREEN
    call GUESS_GAME
    jmp MAIN_MENU

EXIT_ARCADE:
    call CLEAR_SCREEN
    mov dx, OFFSET goodbye
    call PRINT_STR
    mov ax, 4C00h
    int 21h
MAIN ENDP

;=========================================
; Shared Procedures
;=========================================
PRINT_STR PROC
    mov ah, 09h
    int 21h
    ret
PRINT_STR ENDP

CLEAR_SCREEN PROC
    mov ax, 0003h
    int 10h
    ret
CLEAR_SCREEN ENDP

REPLAY PROC
    mov dx, OFFSET replay_msg
    call PRINT_STR

    mov ah, 01h
    int 21h

    cmp al, 'Y'
    je  REPLAY_YES
    cmp al, 'y'
    je  REPLAY_YES
    cmp al, 'N'
    je  REPLAY_NO
    cmp al, 'n'
    je  REPLAY_NO

    jmp REPLAY               ; Invalid input ? ask again

REPLAY_YES:
    ret                      ; Return to caller ? game restarts

REPLAY_NO:
    mov dx, OFFSET returning_msg
    call PRINT_STR
    jmp MAIN_MENU            ; DIRECT JUMP TO MAIN MENU ? skips the restart!
REPLAY ENDP

;=========================================
; SCRABBLE_GAME
;=========================================
SCRABBLE_GAME PROC

    lea si, scr_header_table
    mov cx, 9
SCR_HEADER_LOOP:
    mov dx, [si]
    call PRINT_STR
    add si, 2
    loop SCR_HEADER_LOOP

SCR_ROUND_START:
    mov dx, OFFSET scr_prompt1
    call PRINT_STR
    mov dx, OFFSET scr_buffer1 ; DX register must point to the starting address of input buffer before invoking int21h, 0Ah
    mov ah, 0Ah                ; take input string
    int 21h

    mov dx, OFFSET scr_prompt2
    call PRINT_STR
    mov dx, OFFSET scr_buffer2 ; DX register must point to the starting address of input buffer before invoking int21h, 0Ah
    mov ah, 0Ah                ; take input string
    int 21h

    lea bx, scr_buffer1+2   ; BX = pointer to characters taken from user
    mov al, [scr_buffer1+1] ; AL = actual chars length
    xor ah, ah              ; Set AH to 0 (any value XOR with itself = 0)
    mov cx, ax              ; CX = chars length
    call SCR_COMPUTE_SCORE
    mov scr_score1, ax      ; load score1 into AX

    lea bx, scr_buffer2+2
    mov al, [scr_buffer2+1]
    xor ah, ah
    mov cx, ax
    call SCR_COMPUTE_SCORE
    mov scr_score2, ax

    mov ax, scr_score1
    cmp ax, scr_score2
    jg SCR_PLAYER1_WIN ; if score1 > score2, player1 wins
    jl SCR_PLAYER2_WIN ; if score1 < score2, player2 wins
    ; else tie:
    mov dx, OFFSET scr_tie
    call PRINT_STR
    jmp ASK_REPLAY_NOW

SCR_PLAYER1_WIN:
    mov dx, OFFSET scr_win1
    call PRINT_STR
    jmp ASK_REPLAY_NOW

SCR_PLAYER2_WIN:
    mov dx, OFFSET scr_win2
    call PRINT_STR

ASK_REPLAY_NOW:
    call REPLAY
    jmp SCR_ROUND_START          ; If Y/y --> restart SCRABBLE | If N/n --> REPLAY will jump to MAIN_MENU
    
SCRABBLE_GAME ENDP

SCR_COMPUTE_SCORE PROC

    xor ax, ax ; Set AX to 0 (any value XOR with itself = 0
               ; we've already set:
               ; BX = pointer to characters, CX = string length
SCR_NEXT_CHAR:
    cmp cx, 0
    je SCR_FINISH ; exit loop when counter = 0 --> SCR_FINISH exists the COMPUTE_SCORE procedure
    
    mov dl, [bx] ; load one byte from memory at address BX, this is word[i] (we've taken 1 letter to process)
                 ; BX = current character
                 
    ; ASCII range for uppercase: 'A' = 41h to 'Z' = 5Ah
    cmp dl, 'A'
    jl  SCR_CHECK_LOWER ; if char < 'A', it's not uppercase
    cmp dl, 'Z'
    jg  SCR_CHECK_LOWER ; if char > 'Z', it's not uppercase
    sub dl, 'A'         ; else: convert letter to index (A=0, B=1, ..., etc), DL = letter score index
    jmp SCR_POINT_LOOKUP
    
SCR_CHECK_LOWER:
    cmp dl, 'a'
    jl  SCR_SKIP_CHAR ; if char < 'a' --> char out of ascii range (neither upper nor lower) --> skip
    cmp dl, 'z'
    jg  SCR_SKIP_CHAR ; if char > 'z' -->  char out of ascii range (neither upper nor lower) --> skip
    sub dl, 'a'       ; else: convert letter to index (A=0, B=1, ..., etc), DL = letter score index

SCR_POINT_LOOKUP:
    mov si, OFFSET scr_POINTS ; load address of POINTS array into SI
    add si, dx                ; add index to get address of POINTS[index]
    mov dl, [si]              ; load point value into dl
    xor dh, dh                ; clear DH so CX = only has point value
    add ax, dx                ; add points to score (AX)--> score += POINTS[index]
    
SCR_SKIP_CHAR:
    inc bx  ; move to next char
    dec cx  ; loop i++
    jmp SCR_NEXT_CHAR
    
SCR_FINISH:
    ret
    
SCR_COMPUTE_SCORE ENDP

;=========================================
; CAESAR_GAME
;=========================================
CAESAR_GAME PROC

    lea si, csr_header_table
    mov cx, 7
CSR_HEADER_LOOP:
    mov dx, [si]
    call PRINT_STR
    add si, 2
    loop CSR_HEADER_LOOP
    
CAESAR_ROUND_START:                 ; <-- new label to allow replay to restart the round

    mov dx, OFFSET caesar_header
    call PRINT_STR

CHOOSE_MODE:
    mov dx, OFFSET caesar_mode_menu
    call PRINT_STR
    mov ah, 01h
    int 21h
    mov bl, al

    cmp bl, '1'
    je GET_CAESAR_INPUT
    cmp bl, '2'
    je GET_CAESAR_INPUT
    jmp CHOOSE_MODE

GET_CAESAR_INPUT:
    mov dx, OFFSET caesar_text_msg
    call PRINT_STR
    mov dx, OFFSET caesar_buffer
    mov ah, 0Ah
    int 21h

    lea si, caesar_buffer+2
    mov cl, [caesar_buffer+1]       

    mov dx, OFFSET caesar_shift_msg
    call PRINT_STR
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, al                       

PROCESS_CAESAR:
    cmp cl, 0
    je DONE_CAESAR
    mov dl, [si]

    cmp dl, 'A'
    jl CHECK_LOWER
    cmp dl, 'Z'
    jg CHECK_LOWER

    sub dl, 'A'                      
    cmp bl, '1'
    je ENC_UPPER

    sub dl, bh
    jc  U_ADD26                      
    jmp U_MOD_DONE
U_ADD26:
    add dl, 26
U_MOD_DONE:
    jmp STORE_UPPER

ENC_UPPER:
    add dl, bh
    cmp dl, 26
    jl NO_WRAP_UPPER
    sub dl, 26
NO_WRAP_UPPER:
STORE_UPPER:
    add dl, 'A'
    mov [si], dl
    jmp NEXT_CAESAR_CHAR

CHECK_LOWER:
    cmp dl, 'a'
    jl NEXT_CAESAR_CHAR
    cmp dl, 'z'
    jg NEXT_CAESAR_CHAR

    sub dl, 'a'                     
    cmp bl, '1'
    je ENC_LOWER
    sub dl, bh
    jc  L_ADD26                     
    jmp L_MOD_DONE
L_ADD26:
    add dl, 26
L_MOD_DONE:
    jmp STORE_LOWER

ENC_LOWER:
    add dl, bh
    cmp dl, 26
    jl NO_WRAP_LOWER
    sub dl, 26
NO_WRAP_LOWER:
STORE_LOWER:
    add dl, 'a'
    mov [si], dl

NEXT_CAESAR_CHAR:
    inc si
    dec cl
    jmp PROCESS_CAESAR

DONE_CAESAR:
    mov dx, OFFSET caesar_result
    call PRINT_STR
    lea si, caesar_buffer+2
    mov cl, [caesar_buffer+1]
    lea di, caesar_buffer+2
    add di, cx
    mov byte ptr [di], '$'

    lea dx, caesar_buffer+2
    mov ah, 09h
    int 21h

    ; === NOW USE SHARED REPLAY ===
    call REPLAY
    jmp CAESAR_ROUND_START              ; If Y/y ? restart Caesar
    ; If N/n ? REPLAY already printed "Returning..." and returned
CAESAR_GAME ENDP

;=========================================
; GUESS_GAME
;=========================================
GUESS_GAME PROC

    lea si, gss_header_table
    mov cx, 5
GSS_HEADER_LOOP:
    mov dx, [si] 
    call PRINT_STR
    add si, 2
    loop GSS_HEADER_LOOP
    
GUESS_ROUND_START:                 ; <-- new label to allow replay to restart the round
    
    mov dx, OFFSET guess_header
    call PRINT_STR

    ; ===== Player 1 enters the word =====
    mov dx, OFFSET guess_p1_msg
    call PRINT_STR
  

    mov dx, OFFSET guess_word_buffer
    mov ah, 0Ah
    int 21h

    ; --- hide what Player1 typed so Player2 can't see it ---
    call CLEAR_SCREEN

    ; Prepare mask (____)
    mov cl, [guess_word_buffer+1]
    lea si, guess_mask_buffer

FILL_MASK:
    mov byte ptr [si], '_'
    inc si
    loop FILL_MASK
    
    mov byte ptr [si], '$'
    ; attempts = 5
    mov bl, 5   ; attempts left

GAME_LOOP:
    mov dx, OFFSET guess_attempts_msg
    call PRINT_STR
    mov bl, bl      ; bl is the attempts count
    call PRINT_DIGIT_BL
    
    mov dl, 0Dh     ; ASCII for Carriage Return
    mov ah, 02h
    int 21h
    mov dl, 0Ah     ; ASCII for Line Feed
    mov ah, 02h
    int 21h
    
    ; Show masked word
    lea dx, guess_mask_buffer
    call PRINT_STR

    ; Ask for guess
    mov dx, OFFSET guess_p2_msg
    call PRINT_STR

    mov ah, 01h
    int 21h
    mov dl, al       

    ; Check char in word
    lea si, guess_word_buffer+2
    lea di, guess_mask_buffer
    mov cl, [guess_word_buffer+1]
    mov bh, 0       

CHECK_CHAR_LOOP:
    cmp dl, [si]
    jne NO_MATCH
    mov bh, 1
    mov [di], dl

NO_MATCH:
    inc si
    inc di
    loop CHECK_CHAR_LOOP

    cmp bh, 1
    je CORRECT_GUESS

    ; wrong guess
    dec bl
    mov dx, OFFSET guess_wrong_msg
    call PRINT_STR
    jmp CHECK_LOSE

CORRECT_GUESS:
    inc bl
    mov dx, OFFSET guess_correct_msg
    call PRINT_STR

CHECK_WIN:
    lea si, guess_mask_buffer
    lea di, guess_word_buffer+2
    mov cl, [guess_word_buffer+1]

CHECK_WIN_LOOP:
    mov al, [si]
    cmp al, [di]
    jne NOT_WIN
    inc si
    inc di
    loop CHECK_WIN_LOOP
    

    mov dx, OFFSET guess_win_msg
    call PRINT_STR
    jmp END_GUESS

NOT_WIN:
CHECK_LOSE:
    cmp bl, 0
    jne GAME_LOOP

    mov dx, OFFSET guess_lose_msg
    call PRINT_STR
    jmp END_GUESS
    
END_GUESS:
    mov dx, OFFSET guess_back_msg
    call PRINT_STR

    ; === NOW USE SHARED REPLAY ===
    call REPLAY
    jmp GUESS_ROUND_START     ; If Y/y ? restart GUESS; If N/n ? REPLAY will jump to MAIN_MENU
GUESS_GAME ENDP

; Convert single digit in BL (0-9) to ASCII and print it
PRINT_DIGIT_BL PROC
    push ax
    push dx
    
    mov dl, bl        ; Move digit to DL
    add dl, '0'       ; Convert digit to ASCII character
    mov ah, 02h       ; Function to display a character
    int 21h
    
    pop dx
    pop ax
    ret
PRINT_DIGIT_BL ENDP

END MAIN