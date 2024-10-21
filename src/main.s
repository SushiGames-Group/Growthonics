; nasm -f elf64 -o sdl_example.o sdl_example.asm
; gcc -no-pie -o sdl_example sdl_example.o -lSDL2

section .data
    title db "My SDL Window", 0   ; Title of the window (null-terminated)
    playerX dd 100
    playerY dd 100
    playerW dd 25
    playerH dd 50

section .bss
    window resq 1                 ; Space for SDL_Window pointer
    renderer resq 1               ; Space for SDL_Renderer pointer
    event resb 56                 ; Space for SDL_Event structure (use resb for byte alignment)
    player resb 16

section .text
    ; DECLARE SDL FUNCTIONS
    extern SDL_Init
    extern SDL_CreateWindow
    extern SDL_Quit
    extern SDL_Delay
    extern SDL_CreateRenderer
    extern SDL_PollEvent
    extern SDL_RenderFillRect
    extern SDL_DestroyRenderer
    extern SDL_DestroyWindow
    extern SDL_RenderClear
    extern SDL_RenderPresent
    extern SDL_SetRenderDrawColor

    ; DECLARE INPUT FUNCTIONS
    extern KeyA
    extern KeyB
    extern KeyC
    extern KeyD
    extern KeyE
    extern KeyF
    extern KeyG
    extern KeyH
    extern KeyI
    extern KeyJ
    extern KeyK
    extern KeyL
    extern KeyM
    extern KeyN
    extern KeyO
    extern KeyP
    extern KeyQ
    extern KeyR
    extern KeyS
    extern KeyT
    extern KeyU
    extern KeyV
    extern KeyW
    extern KeyX
    extern KeyY
    extern KeyZ

    extern HandleKeyDown

    global _start
    global Gameloop
    global event  ; Make event global so it can be accessed from inputs.s
    global playerX
    global playerY
    global playerW
    global playerH

_start:
    ; SDL_Init(SDL_INIT_VIDEO)
    mov edi, 0x00000020           ; SDL_INIT_VIDEO flag
    call SDL_Init

    ; SDL_CreateWindow("My SDL Window", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, 0)
    mov rdi, title                ; Window title
    mov esi, -1                   ; SDL_WINDOWPOS_CENTERED
    mov edx, -1                   ; SDL_WINDOWPOS_CENTERED
    mov ecx, 640                  ; Width
    mov r8d, 480                  ; Height
    mov r9d, 0                    ; No window flags
    call SDL_CreateWindow

    ; Store the window pointer
    mov [window], rax

    ; Create renderer
    mov rdi, [window]             ; Pass window pointer
    mov rsi, -1                   ; Use default driver
    mov rdx, 0                    ; No flags
    call SDL_CreateRenderer

    ; Store renderer pointer
    mov [renderer], rax

    ; Initialize player
    mov eax, [playerX]
    mov [player], eax
    mov eax, [playerY]
    mov [player + 4], eax
    mov eax, [playerW]
    mov [player + 8], eax
    mov eax, [playerH]
    mov [player + 12], eax


    ; RBX for running condition 
    mov rbx, 1

Gameloop:
    ; Events polling
    lea rdi, [event]              ; Load address of event
    call SDL_PollEvent            ; Call SDL_PollEvent

    ; Check for quit event
    mov eax, [event]              ; Load event type into EAX
    cmp eax, 0x100                ; Compare with SDL_QUIT
    je Quit                       ; If equal, jump to Quit

    ; Check for key down event
    cmp eax, 0x300                ; Compare with SDL_KEYDOWN
    je HandleKeyDown              ; If equal, jump to HandleKeyDown

    ; Set background color
    mov rdi, [renderer]
    mov rsi, 0
    mov rdx, 0
    mov rcx, 0
    mov r8, 0
    call SDL_SetRenderDrawColor

    ; Before drawing
    mov rdi, [renderer]
    call SDL_RenderClear

    ; Set renderer color
    mov rdi, [renderer]
    mov rsi, 0
    mov rdx, 255
    mov rcx, 255
    mov r8, 255
    call SDL_SetRenderDrawColor

    ; Update player pos
    mov eax, [playerX]
    mov [player], eax
    mov eax, [playerY]
    mov [player + 4], eax


    ; Set up SDL_Rect for player
    mov rdi, [renderer]
    lea rsi, [player]  ; player should be an SDL_Rect structure
    call SDL_RenderFillRect

    ; After drawing
    mov rdi, [renderer]
    call SDL_RenderPresent

    ; Go back to the loop
    jmp Gameloop

Quit:
    ; Destroy renderer
    mov rdi, [renderer]
    call SDL_DestroyRenderer

    ; Destroy window
    mov rdi, [window]
    call SDL_DestroyWindow

    ; SDL_Quit() - Clean up SDL
    call SDL_Quit

    ; Exit the program
    mov eax, 60                   ; Exit system call number
    xor edi, edi                  ; Return code 0
    syscall
