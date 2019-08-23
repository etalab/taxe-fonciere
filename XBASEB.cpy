      *******************************************************
      **   FICHIER BASES ET COTISATIONS BATI               **
      **===================================================**
      **  NOM DU COPY        : XBASEB                      **
      **==================================================***
      *******************************************************
           05 'X'-CLE.
              10 'X'-JANIPT                  PIC 9(4).
              10 'X'-ACODIR.
                 20 'X'-CCODEP               PIC X(2).
                 20 'X'-CCODIR               PIC X.
              10 'X'-CCOCOM                  PIC 9(3).
              10 'X'-DLETSR                  PIC X.
           05 'X'-FILLER1                    PIC X(3).
      ****************************************
      ***---- DESCRIPTIF PROPRIETAIRE    --***
      ****************************************
           05 'X'-ANUPRO.
              10 'X'-CGROUP                  PIC X.
              10 'X'-DNUMCP                  PIC 9(5).
           05 'X'-FILLER2                    PIC X(2).
      ****************************************
      ***---- CODE TYPE ARTICLE          --***
      ****************************************
           05 'X'-ACODB                      PIC 9.
      ****************************************
      ***---- IMPOSITION                 --***
      ****************************************
           05 'X'-IMPOT                      PIC X.
           05 'X'-GNEXPL                     PIC X(2).
      ****************************************
      ***---- TAUX PAR COLLECTIVITE      --***
      ****************************************
           05 'X'-TOT-TAUX.
              10 'X'-TAUCOM                  PIC S9(4)V9(6).
              10 'X'-TAUDEP                  PIC S9(4)V9(6).
              10 'X'-TAUREG                  PIC S9(4)V9(6).
              10 'X'-TAUSYN                  PIC S9(4)V9(6).
              10 'X'-TAUCU                   PIC S9(4)V9(6).
              10 'X'-TAUGEM                  PIC S9(4)V9(6).
              10 'X'-TAUTAS                  PIC S9(4)V9(6).
              10 'X'-TAUTSE                  PIC S9(4)V9(6).
              10 'X'-TAUTSEN                 PIC S9(4)V9(6) OCCURS 2.
              10 'X'-TABTAUOM.
                 20 'X'-TAUOM1               PIC S9(4)V9(6) OCCURS 6.
           05 'X'-TAUOMI                     PIC 9(12)V9(6).
           05 'X'-PTBTST                     PIC S9(4)V9(6).
      ****************************************
      ***---- BASES PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-BBCOM                      PIC S9(10).
           05 'X'-REDCOM REDEFINES 'X'-BBCOM.
              10 'X'-COMDIZ                  PIC 9(9).
              10 'X'-COMFRS                  PIC S9.
           05 'X'-BBDEP                      PIC S9(10).
           05 'X'-REDDEP  REDEFINES 'X'-BBDEP.
              10 'X'-DEPDIZ                  PIC 9(9).
              10 'X'-DEPFRS                  PIC S9.
           05 'X'-BBREG                      PIC S9(10).
           05 'X'-REDREG  REDEFINES 'X'-BBREG.
              10 'X'-REGDIZ                  PIC 9(9).
              10 'X'-REGFRS                  PIC S9.
           05 'X'-BBSYN                      PIC S9(10).
           05 'X'-REDSYN  REDEFINES 'X'-BBSYN.
              10 'X'-SYNDIZ                  PIC 9(9).
              10 'X'-SYNFRS                  PIC S9.
           05 'X'-BBCU                       PIC S9(10).
           05 'X'-REDCU   REDEFINES 'X'-BBCU.
              10 'X'-CUDIZ                   PIC 9(9).
              10 'X'-CUFRS                   PIC S9.
           05 'X'-BBTAS                      PIC S9(10).
           05 'X'-REDTAS  REDEFINES 'X'-BBTAS.
              10 'X'-TASDIZ                  PIC 9(9).
              10 'X'-TASFRS                  PIC S9.
           05 'X'-BBGEM                      PIC S9(10).
           05 'X'-REDGEM  REDEFINES 'X'-BBGEM.
              10 'X'-GEMDIZ                  PIC 9(9).
              10 'X'-GEMFRS                  PIC S9.
           05 'X'-BBTSE                      PIC S9(10).
           05 'X'-REDTSE  REDEFINES 'X'-BBTSE.
              10 'X'-TSEDIZ                  PIC 9(9).
              10 'X'-TSEFRS                  PIC S9.
           05 'X'-TAB-BBTSEN OCCURS 2.
              10 'X'-BBTSEN                  PIC S9(10).
              10 'X'-REDTSEN REDEFINES 'X'-BBTSEN.
                 20 'X'-TSENDIZ              PIC 9(9).
                 20 'X'-TSENFRS              PIC S9.
           05 'X'-FILLER                     PIC 9(10).
           05 'X'-FILLER                     PIC 9(10).
      * CODE TAUX OM
           05 'X'-TAB-OM OCCURS 6.
              10 'X'-GTAUOM                  PIC X(2).
              10 'X'-BBTEOM                  PIC S9(10).
              10 'X'-REDTEOM REDEFINES 'X'-BBTEOM.
                 20 'X'-TEOMDIZ              PIC 9(9).
                 20 'X'-TEOMFRS              PIC S9.
           05 'X'-FILLER                     PIC 9V9(15).
           05 'X'-BBASEUN OCCURS 2.
              10 'X'-BBCUN                   PIC S9(10).
              10 'X'-REDCUN REDEFINES 'X'-BBCUN.
                  20 'X'-CUNDIZ              PIC 9(9).
                  20 'X'-CUNFRS              PIC S9.
              10 'X'-BBDUN                   PIC S9(10).
              10 'X'-REDDUN REDEFINES 'X'-BBDUN.
                  20 'X'-DUNDIZ              PIC 9(9).
                  20 'X'-DUNFRS              PIC S9.
              10 'X'-BBRUN                   PIC S9(10).
              10 'X'-REDRUN REDEFINES 'X'-BBRUN.
                  20 'X'-RUNDIZ              PIC 9(9).
                  20 'X'-RUNFRS              PIC S9.
              10 'X'-BBSUN                   PIC S9(10).
              10 'X'-REDSUN REDEFINES 'X'-BBSUN.
                  20 'X'-SUNDIZ              PIC 9(9).
                  20 'X'-SUNFRS              PIC S9.
              10 'X'-BBUUN                   PIC S9(10).
              10 'X'-REDUUN REDEFINES 'X'-BBUUN.
                 20 'X'-UUNDIZ               PIC 9(9).
                 20 'X'-UUNFRS               PIC S9.
              10 'X'-BBTUN                   PIC S9(10).
              10 'X'-REDTUN REDEFINES 'X'-BBTUN.
                 20 'X'-TUNDIZ               PIC 9(9).
                 20 'X'-TUNFRS               PIC S9.
              10 'X'-CCOIFP                  PIC X(3).
              10 'X'-CCPPER                  PIC X(3).
           05 'X'-FILLER                     PIC X(127).
