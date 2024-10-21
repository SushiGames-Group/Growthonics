section .text
    extern event  ; Declare event as an external symbol
    extern Gameloop
    extern playerX
    extern playerY
    extern playerW
    extern playerH

    global KeyA
    global KeyB 
    global KeyC
    global KeyD
    global KeyE
    global KeyF
    global KeyG
    global KeyH
    global KeyI
    global KeyJ
    global KeyK
    global KeyL
    global KeyM
    global KeyN
    global KeyO
    global KeyP
    global KeyQ
    global KeyR
    global KeyS
    global KeyT
    global KeyU
    global KeyV
    global KeyW
    global KeyX
    global KeyY
    global KeyZ
    global HandleKeyDown

HandleKeyDown:
    ; Handle SDL_KEYDOWN event
    ; The keycode is located at event + 16 bytes (SDL_Event's key.keysym.sym)
    mov eax, [event + 16]         ; Get keycode (e.g., SDL_SCANCODE_A = 0x04)
    
    ; Compare against specific keycodes (use keycodes from SDL_scancode.h)
    cmp eax, 0x04                 ; SDL_SCANCODE_A (example)
    je KeyA                       ; If 'A' key pressed

    cmp eax, 0x05
    je KeyB

    cmp eax, 0x06
    je KeyC

    cmp eax, 0x07
    je KeyD

    ; Go back to the loop
    jmp Gameloop

KeyA:
    mov eax, [playerX]
    dec eax
    mov [playerX], eax
    jmp Gameloop

KeyB:
    ; Handle 'B' key press
    ; Add your code here
    ret

KeyC:
    ret

KeyD:
    mov eax, [playerX]
    inc eax
    mov [playerX], eax
    jmp Gameloop

KeyE:
    ret

KeyF:
    ret

KeyG:
    ret

KeyH:
    ret

KeyI:
    ret

KeyJ:
    ret

KeyK:
    ret

KeyL:
    ret

KeyM:
    ret

KeyN:
    ret

KeyO:
    ret

KeyP:
    ret

KeyQ:
    ret

KeyR:
    ret

KeyS:
    ret

KeyT:
    ret

KeyU:
    ret

KeyV:
    ret

KeyW:
    ret

KeyX:
    ret

KeyY:
    ret

KeyZ:
    ret
