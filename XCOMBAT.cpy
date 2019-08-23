      * NOM COPY            *  XCOMBAT                    *
      *****************************************************
           03 GS12.
              10 'X'-CCOBNB           PIC X.
              10 'X'-AIDFIC.
                 15 'X'-DAN              PIC 9(4).
                 15 'X'-AC3DIR.
                    20 'X'-CC2DEP           PIC X(2).
                    20 'X'-CCODIR           PIC X.
                 15 'X'-CCOCOM           PIC X(3).
                 15 'X'-DSRPAR           PIC X.
              10 'X'-ANUPRO.
                 15 'X'-CGROUP           PIC X.
                 15 'X'-NNUPRO           PIC 9(5).
              10 'X'-A0008.
                 15 'X'-GTOTAU           PIC X OCCURS 8.
              10 'X'-MBABA.
                 15 'X'-MBACOM           PIC S9(10).
                 15 'X'-MBADEP           PIC S9(10).
                 15 'X'-MBAREG           PIC S9(10).
                 15 'X'-MBASYN           PIC S9(10).
                 15 'X'-MBACU            PIC S9(10).
                 15 'X'-MBATSE           PIC S9(10).
                 15 'X'-MBBT13           PIC S9(10) OCCURS 2.
                 15 'X'-FILLER           PIC X(20).
              10 'X'-ABAOM OCCURS 6.
                 15 'X'-GTAUOM           PIC X(2).
      ****************************************************************
      *****  LES DEUX LIGNE SUIVANTES SONT A AJOUTER MANUELLEMENT ****
                       88 'X'-GTAUOM-OK VALUE
                              '  ' ' P' 'P ' 'RA' 'RB' 'RC' 'RD' 'RE'.
      ****************************************************************
                 15 'X'-MBAOM            PIC S9(10).
              10 'X'-FILLER           PIC 9(10) OCCURS 12.
              10 'X'-MVLTIM           PIC S9(10).
              10 'X'-PVLTOM           PIC 9V9(15).
              10 'X'-MBAGE3           PIC S9(10).
              10 'X'-MBATA3           PIC S9(10).
              10 'X'-CCOIFP           PIC X(3).
              10 'X'-CCPPER           PIC X(3).
              10 'X'-FILLER           PIC X(230).
