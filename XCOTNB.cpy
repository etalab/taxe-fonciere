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
           05 'X'-FILLER4                     PIC X(012).
      ****************************************
      ***---- TAUX  PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-TAUCOM                      PIC S9(4)V9(6).
           05 'X'-TAUDEP                      PIC S9(4)V9(6).
           05 'X'-TAUREG                      PIC S9(4)V9(6).
           05 'X'-TAUSYN                      PIC S9(4)V9(6).
           05 'X'-TAUCU                       PIC S9(4)V9(6).
           05 'X'-TAUGEM                      PIC S9(4)V9(6).
           05 'X'-TAUTSE                      PIC S9(4)V9(6).
           05 'X'-TAUTSEN                     PIC S9(4)V9(6) OCCURS 2.
           05 'X'-PNBTST                      PIC S9(4)V9(6).
           05 'X'-TAUCHAGR                    PIC S9(4)V9(6).
           05 'X'-TAUSMAGR                    PIC S9(4)V9(6).
           05 'X'-TAUBAPSA                    PIC S9(4)V9(6).
           05 'X'-TAUCAAA                     PIC S9(4)V9(6).
           05 'X'-TAUTXADD                    PIC S9(4)V9(6).
      ****************************************
      ***---- BASES PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-BNBCOM                      PIC S9(010).
           05 'X'-BNBDEP                      PIC S9(010).
           05 'X'-BNBREG                      PIC S9(010).
           05 'X'-BNBSYN                      PIC S9(010).
           05 'X'-BNBCU                       PIC S9(010).
           05 'X'-BNBGEM                      PIC S9(010).
           05 'X'-BNBTSE                      PIC S9(010).
           05 'X'-BNBTSEN                     PIC S9(010) OCCURS 2.
           05 'X'-BNBAGR                      PIC S9(010).
           05 'X'-BNBBAP                      PIC S9(010).
           05 'X'-BNBCAA                      PIC S9(010).
           05 'X'-FILLER6                     PIC X(010).
      ****************************************
      ***---- BASE DEG PRE + JA          --***
      ***---- SERVIE UNIQUEMENT SUR G JA --***
      ****************************************
           05 'X'-BNBPLJA                     PIC S9(010).
      ****************************************
      ***---- COTIS. PAR COLLECTIVITES   --***
      ****************************************
           05 'X'-COTICOM                     PIC S9(010).
           05 'X'-COTIDEP                     PIC S9(010).
           05 'X'-COTIREG                     PIC S9(010).
           05 'X'-COTISYN                     PIC S9(010).
           05 'X'-COTICU                      PIC S9(010).
           05 'X'-MCOGE3                      PIC S9(010).
           05 'X'-COTITSE                     PIC S9(010).
           05 'X'-COTITSEN                    PIC S9(010) OCCURS 2.
           05 'X'-MCNTSA                      PIC S9(010).
           05 'X'-COTIAGR                     PIC S9(010).
           05 'X'-COTISMAG                    PIC S9(010).
           05 'X'-COTIBAP                     PIC S9(010).
           05 'X'-DPROCAA                     PIC S9(010).
           05 'X'-DFIXCAA                     PIC S9(005).
      ****************************************
      ***---- FRAIS                      --***
      ****************************************
           05 'X'-FFIXCAA                     PIC S9(10).
           05 'X'-FA300                       PIC S9(10).
           05 'X'-FN300                       PIC S9(10).
           05 'X'-FARB                        PIC S9(10).
           05 'X'-FRNVB                       PIC S9(10).
           05 'X'-FARC                        PIC S9(10).
           05 'X'-FRNVC                       PIC S9(10).
           05 'X'-FA800                       PIC S9(10).
           05 'X'-FN800                       PIC S9(10).
           05 'X'-FA900                       PIC S9(10).
           05 'X'-FN900                       PIC S9(10).
      ****************************************
      ***---- BASES COTIS FRAIS JA ETAT  --***
      ***----(SERVIS UNIQUEMENT SUR G JA)--***
      ****************************************
           05 'X'-MBJECO                      PIC S9(10).
           05 'X'-MBJESY                      PIC S9(10).
           05 'X'-MBJEIC                      PIC S9(10).
           05 'X'-MCNJCO                      PIC S9(10).
           05 'X'-MCNJSY                      PIC S9(10).
           05 'X'-MCNJIC                      PIC S9(10).
           05 'X'-MCNJAE                      PIC S9(10).
           05 'X'-MFAJAE                      PIC S9(10).
           05 'X'-MFNJAE                      PIC S9(10).
      ****************************************
      ***---- FRAIS TOTAUX               --***
      ****************************************
           05 'X'-FRAIS-TOTAUX                PIC 9(12).
      ****************************************
      ***---- IFP   +   TRESORERIE       --***
      ****************************************
           05 'X'-CCOIFP                      PIC X(003).
           05 'X'-CCPPER                      PIC X(003).
           05 'X'-FILLER                      PIC X(306).
