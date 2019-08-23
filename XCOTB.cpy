      *******************************************************
      **   FICHIER BASES ET COTISATIONS BATI               **
      **===================================================**
      **  NOM DU COPY        : XCOTB                       **
      **===================================================**
      *******************************************************
           05 'X'-CLE.
              10 'X'-JANIPT        PIC 9(4).
              10 'X'-ACODIR.
                 20 'X'-CCODEP        PIC X(2).
                 20 'X'-CCODIR        PIC X.
              10 'X'-CCOCOM        PIC 9(3).
              10 'X'-DLETSR        PIC X.
           05 'X'-FILLER1       PIC X.
      ****************************************
      ***---- DESCRIPTIF PROPRIETAIRE    --***
      ****************************************
           05 'X'-ANUPRO.
              10 'X'-CGROUP        PIC X.
              10 'X'-DNUMCP        PIC 9(5).
           05 'X'-FILLER2       PIC X(2).
      ****************************************
      ***---- CODE TYPE ARTICLE          --***
      ****************************************
           05 'X'-ACODB         PIC 9.
           05 'X'-FILLER3       PIC X(9).
      ****************************************
      ***---- IMPOSITION                 --***
      ****************************************
           05 'X'-IMPOT         PIC X.
           05 'X'-GNEXPL        PIC X(2).
      ****************************************
      ***---- TAUX  PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-TOT-TAUX.
              10 'X'-TAUCOM        PIC S9(4)V9(6).
              10 'X'-TAUDEP        PIC S9(4)V9(6).
              10 'X'-TAUREG        PIC S9(4)V9(6).
              10 'X'-TAUSYN        PIC S9(4)V9(6).
              10 'X'-TAUCU         PIC S9(4)V9(6).
              10 'X'-TAUTAS        PIC S9(4)V9(6).
              10 'X'-TAUGEM        PIC S9(4)V9(6).
              10 'X'-TAUTSE        PIC S9(4)V9(6).
              10 'X'-TAUTSEN       PIC S9(4)V9(6) OCCURS 2.
           05 'X'-PTBTST        PIC S9(4)V9(6).
           05 'X'-TABTAUOM.
              20 'X'-TAUOM1        PIC S9(4)V9(6) OCCURS 6.
           05 'X'-TAUOMI        PIC 9(12)V9(6).
           05 'X'-FILLER        PIC X(2).
      ****************************************
      ***---- BASES PAR COLLECTIVITES    --***
      ****************************************
           05 'X'-BBCOM         PIC S9(10).
           05 'X'-BBDEP         PIC S9(10).
           05 'X'-BBREG         PIC S9(10).
           05 'X'-BBSYN         PIC S9(10).
           05 'X'-BBCU          PIC S9(10).
           05 'X'-BBTAS         PIC S9(10).
           05 'X'-BBGEM         PIC S9(10).
           05 'X'-BBTSE         PIC S9(10).
           05 'X'-BBTSEN        PIC S9(10) OCCURS 2.
           05 'X'-TAB-OM OCCURS 6.
              10 'X'-GTAUOM        PIC X(2).
              10 'X'-BBTEOM        PIC S9(10).
           05 'X'-BBTEIOM       PIC 9V9(15).
           05 'X'-FILLER5       PIC X(114).
      ****************************************
      ***---- COTIS. PAR COLLECTIVITES   --***
      ****************************************
           05 'X'-COTICOM       PIC S9(10).
           05 'X'-COTIDEP       PIC S9(10).
           05 'X'-COTIREG       PIC S9(10).
           05 'X'-COTISYN       PIC S9(10).
           05 'X'-COTICU        PIC S9(10).
           05 'X'-MCOTA3        PIC S9(10).
           05 'X'-MCOGE3        PIC S9(10).
           05 'X'-COTITSE       PIC S9(10).
           05 'X'-COTITSEN      PIC S9(10) OCCURS 2.
           05 'X'-MCBTSA        PIC S9(10).
           05 'X'-FILLER7       PIC X(124).
           05 'X'-COTIS-OMI     PIC S9(10).
           05 'X'-TAB-COTIS-OM.
              10 'X'-COTIS-OM      PIC S9(10) OCCURS 6.
      ****************************************
      ***----     FRAIS                  --***
      ****************************************
           05 'X'-FA300         PIC S9(10).
           05 'X'-FN300         PIC S9(10).
           05 'X'-FA800         PIC S9(10).
           05 'X'-FN800         PIC S9(10).
           05 'X'-FA900         PIC S9(10).
           05 'X'-FN900         PIC S9(10).
      ****************************************
      ***---- IFP  +  TRESORERIE         --***
      ****************************************
           05 'X'-CCOIFP        PIC X(3).
           05 'X'-CCPPER        PIC X(3).
