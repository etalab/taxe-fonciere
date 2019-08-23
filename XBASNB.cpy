      *******************************************************
      **   FICHIER BASES ET COTISATIONS NON-BATI           **
      *******************************************************
           05  'X'-CLE.
             10 'X'-JANIPT                    PIC 9(004).
             10 'X'-ACODIR.
               20 'X'-CCODEP                  PIC X(002).
               20 'X'-CCODIR                  PIC X(001).
             10 'X'-CCOCOM                    PIC 9(003).
             10 'X'-DLETSR                    PIC X(001).
           05 'X'-FILLER1                     PIC X(001).
      ****************************************
      ***---- DESCRIPTIF PROPRIETAIRE    --***
      ****************************************
           05 'X'-ANUPRO.
               10 'X'-CGROUP                  PIC X(001).
               10 'X'-DNUMCP                  PIC 9(005).
           05 'X'-FILLER2                     PIC X(002).
      ****************************************
      ***---- CODE TYPE ARTICLE          --***
      ****************************************
           05 'X'-ACODNB                      PIC 9(001).
           05 'X'-FILLER3                     PIC X(009).
      ****************************************
      ***---- IMPOSITION                 --***
      ****************************************
           05 'X'-IMPOT                       PIC X(001).
           05 'X'-GNEXPS                      PIC X(002).
      ****************************************
      ***---- TAUX  PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-TOT-TAUX.
               10 'X'-TAUCOM                      PIC S9(4)V9(6).
               10 'X'-TAUDEP                      PIC S9(4)V9(6).
               10 'X'-TAUREG                      PIC S9(4)V9(6).
               10 'X'-TAUSYN                      PIC S9(4)V9(6).
               10 'X'-TAUCU                       PIC S9(4)V9(6).
               10 'X'-TAUGEM                      PIC S9(4)V9(6).
               10 'X'-TAUTSE                      PIC S9(4)V9(6).
               10 'X'-TAUTSEN            PIC S9(4)V9(6) OCCURS 2.
               10 'X'-TAUCHAGR                    PIC S9(4)V9(6).
               10 'X'-TAUSMAGR                    PIC S9(4)V9(6).
               10 'X'-TAUBAPSA                    PIC S9(4)V9(6).
               10 'X'-TAUCAAA                     PIC S9(4)V9(6).
               10 'X'-TAUTXADD                    PIC S9(4)V9(6).
           05 'X'-PNBTST                      PIC S9(4)V9(6).
           05 'X'-FILLER4                     PIC X(235).
      ****************************************
      ***---- BASES PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-BNBCOM                      PIC S9(010).
           05 'X'-REDCOM  REDEFINES 'X'-BNBCOM.
             10 'X'-COMFRS                    PIC 9(007).
             10 'X'-COMCTS                    PIC S9(003).
           05 'X'-BNBDEP                      PIC S9(010).
           05 'X'-REDDEP  REDEFINES 'X'-BNBDEP.
             10 'X'-DEPFRS                    PIC 9(007).
             10 'X'-DEPCTS                    PIC S9(003).
           05 'X'-BNBREG                      PIC S9(010).
           05 'X'-REDREG  REDEFINES 'X'-BNBREG.
             10 'X'-REGFRS                    PIC 9(007).
             10 'X'-REGCTS                    PIC S9(003).
           05 'X'-BNBSYN                      PIC S9(010).
           05 'X'-REDSYN  REDEFINES 'X'-BNBSYN.
             10 'X'-SYNFRS                    PIC 9(007).
             10 'X'-SYNCTS                    PIC S9(003).
           05 'X'-BNBCU                       PIC S9(010).
           05 'X'-REDCU   REDEFINES 'X'-BNBCU.
             10 'X'-CUFRS                     PIC 9(007).
             10 'X'-CUCTS                     PIC S9(003).
           05 'X'-BNBGEM                      PIC S9(010).
           05 'X'-REDGEM  REDEFINES 'X'-BNBGEM.
             10 'X'-GEMFRS                     PIC 9(007).
             10 'X'-GEMCTS                     PIC S9(003).
           05 'X'-BNBTSE                      PIC S9(010).
           05 'X'-REDTSE  REDEFINES 'X'-BNBTSE.
             10 'X'-TSEFRS                    PIC 9(007).
             10 'X'-TSECTS                    PIC S9(003).
           05 'X'-TAB-BNBTSEN OCCURS 2.
             10 'X'-BNBTSEN                   PIC S9(010).
             10 'X'-REDTSEN REDEFINES 'X'-BNBTSEN.
               20 'X'-TSENFRS                   PIC 9(007).
               20 'X'-TSENCTS                   PIC S9(003).
           05 'X'-BNBAGR                      PIC S9(010).
           05 'X'-REDAGR  REDEFINES 'X'-BNBAGR.
             10 'X'-AGRFRS                    PIC 9(007).
             10 'X'-AGRCTS                    PIC S9(003).
           05 'X'-BNBBAP                      PIC S9(010).
           05 'X'-REDBAP  REDEFINES 'X'-BNBBAP.
             10 'X'-BAPFRS                    PIC 9(007).
             10 'X'-BAPCTS                    PIC S9(003).
           05 'X'-FILLER6                     PIC S9(10).
           05 'X'-BNBCAA                      PIC S9(010).
           05 'X'-REDCAA  REDEFINES 'X'-BNBCAA.
             10 'X'-CAAFRS                    PIC 9(007).
             10 'X'-CAACTS                    PIC S9(003).
           05 'X'-FILLER                      PIC 9(10).
           05 'X'-BNBPLJA                     PIC S9(10).
           05 'X'-REDPLJA REDEFINES 'X'-BNBPLJA.
             10 'X'-PLJAFRS                    PIC 9(007).
             10 'X'-PLJACTS                    PIC S9(003).
    *******    NOUVELLES BASES JA-ETAT
           05 'X'-MBJECO                       PIC S9(10).
           05 'X'-REDJECO REDEFINES 'X'-MBJECO.
              10 'X'-JECOFRS                   PIC 9(007).
              10 'X'-JECOCTS                   PIC S9(003).
           05 'X'-MBJESY                       PIC S9(10).
           05 'X'-REDJESY REDEFINES 'X'-MBJESY.
              10 'X'-JESYFRS                   PIC 9(007).
              10 'X'-JESYCTS                   PIC S9(003).
           05 'X'-MBJEIC                       PIC S9(10).
           05 'X'-REDJEIC REDEFINES 'X'-MBJEIC.
              10 'X'-JEICFRS                   PIC 9(007).
              10 'X'-JEICCTS                   PIC S9(003).
           05 'X'-CCOIFP                       PIC X(003).
           05 'X'-CCPPER                       PIC X(003).
           05 'X'-FILLER                      PIC X(226).
