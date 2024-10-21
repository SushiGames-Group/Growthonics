REGISTER	TYPE	USAGE
RAX	General Purpose	Return value from functions; also used for calculations.
RBX	General Purpose	Callee-saved; preserved across function calls.
RCX	General Purpose	4th argument (System V) / 1st argument (Microsoft); can also be used in calculations.
RDX	General Purpose	3rd argument (System V) / 2nd argument (Microsoft); used in multiplication/division.
RSI	General Purpose	2nd argument (System V); can be used as a source index for string operations.
RDI	General Purpose	1st argument (System V); can be used as a destination index for string operations.
RBP	General Purpose	Base pointer for stack frames; callee-saved.
RSP	Stack Pointer	Points to the current top of the stack; must be properly managed.
R8	General Purpose	5th argument (System V) / 3rd argument (Microsoft).
R9	General Purpose	6th argument (System V) / 4th argument (Microsoft).
R10	General Purpose	Scratch register; caller-saved.
R11	General Purpose	Scratch register; caller-saved.
R12	General Purpose	Callee-saved; preserved across function calls.
R13	General Purpose	Callee-saved; preserved across function calls.
R14	General Purpose	Callee-saved; preserved across function calls.
R15	General Purpose	Callee-saved; preserved across function calls.
