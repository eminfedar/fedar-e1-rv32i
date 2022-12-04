start:
    nop
    addi x1, x0, 1
    addi x6, x0, 1
    addi x12, x0, 4
    sw x6, 0(x0)        # PIPELINE HAZARD: x6 -> R2 Data Dependency (WriteBack)
loop:
    # Address 0 is GPO (General Purpose Output) register.
    # So if you want to make pin 0 HIGH in GPO,
    # Just load 0x000001 to Address 0 with "sw" instruction.

    lw x6, 0(x0)        # PIPELINE HAZARD: Load Stall
    addi x6, x6, 1      # PIPELINE HAZARD: x6 -> R1 Data Dependency
    sw x6, 0(x0)
    blt x6, x12, loop   # PIPELINE HAZARD: x6 -> R1 Data Dependency (WriteBack) & Control Hazard
finish:
    nop
