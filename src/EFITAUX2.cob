      *********************************************************
      * PROGRAMME EFITAUX2                                    *
      * LANGAGE COBOL                                         *
      *                                                       *
      * CE SOUS-PROGRAMME PERMET DE RENVOYER LES PARAMETRES   *
      * DE TAXATION EN PROVENANCE DU FICHIER TAUDIS.          *
      *                                                       *
      *********************************************************

       IDENTIFICATION DIVISION.
      *----------------------------------------------------------------*
       PROGRAM-ID. EFITAUX2.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT  TAUDIS      ASSIGN  TO  TAUDIS
                               ORGANIZATION INDEXED
                               ACCESS MODE  DYNAMIC
                               RECORD  KEY  TAUDIS-CLE
                               FILE STATUS  TAUDIS-FS.

      *----------------------------------------------------------------*
       DATA DIVISION.
      *----------------------------------------------------------------*
       FILE SECTION.
       FD  TAUDIS EXTERNAL
           RECORD  CONTAINS 3000 CHARACTERS
           DATA RECORD  TAUDIS-DATA.
       01 TAUDIS-DATA .
          02 TAUDIS-CLE.
             05 T-DIR    PIC X(3).
             05 T-COM    PIC X(3).
             05 T-CCOIFP PIC X(3).
             05 T-CCPPER PIC X(3).
          02 TAUDIS-SUITE  PIC X(2988).

      *----------------------------------------------------------------*
       WORKING-STORAGE SECTION.
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***
       01  SLATVARS              PIC X(122)                 VALUE 'SLAT
      -    'VARS START: DATEUPD›TIMEUPD PROGRAMMERNAME MODNAME LVNO UPNO
      -    ' DATA-SET-NAME-FOR-THE-LIBRARIAN-MASTER-FILESLAT VARS END'.

      *--- FILE STATUS DE TAUDIS -----------------
       01  TAUDIS-FS   PIC XX EXTERNAL.

       01 TAUDIS-DIR.
         COPY  T800      REPLACING 'X' BY T-D.
         COPY  T84D      REPLACING 'X' BY T-D.

       01 TAUDIS-COM.
         COPY  T800      REPLACING 'X' BY T-C.
         COPY  T84C      REPLACING 'X' BY T-C.

       01 TAUDIS-IFP-TRESO.
         COPY  T800      REPLACING 'X' BY T-R.
         COPY  T84R      REPLACING 'X' BY T-R.

       01 AIFTRES.
          05  AIFTRES-CCOIFP   PIC X(3) VALUE SPACES.
          05  AIFTRES-CCPPER   PIC X(3) VALUE SPACES.

      *  ZES
       01 TAU-E-AN.
          COPY XBXTDAN  REPLACING 'X' BY TAU-E.
       01 TAU-D-DEP.
          COPY XBXTDDIR REPLACING 'X' BY TAU-D.
       01 TAU-C-COM.
          COPY XBXTDCOM REPLACING 'X' BY TAU-C.
       01 TAU-R-ROL.
          COPY XBXTDSR  REPLACING 'X' BY TAU-R.

      *--- LINKAGE               -----------------
       LINKAGE SECTION.
       01  ANIMP  PIC 9(4).
       01  CODDIR PIC X(3).
       01  CODCOM PIC 9(3).
       01  CCOIFP PIC X(3).
       01  CCPPER PIC X(3).
       01  CR     PIC 9(2).
       01  RC     PIC 9(2).
       01  ZES.
           05 EL-REC    PIC X(400) OCCURS 7.

      * -------------------------------------------------------------*
       PROCEDURE DIVISION USING ANIMP CODDIR CODCOM CCOIFP CCPPER
                CR RC ZES.
      *--------------------------------------------------------------*

      *---------------------------------------
       PROG.
      *---------------------------------------
            INITIALIZE ZES
            INITIALIZE AIFTRES
            MOVE CCOIFP  TO  AIFTRES-CCOIFP
            MOVE CCPPER  TO  AIFTRES-CCPPER
            MOVE ZERO        TO      CR      RC


      * EN FONCTION DES ZONES GARNIES DANS LA ZONE DE LINK, ON LIT
      * UN ARTICLE DIRECTION OU COMMUNAL OU IFP/TRESORERIE
            EVALUATE ANIMP ALSO CODDIR ALSO CODCOM ALSO AIFTRES

      * TOUTE LES ZONES D'APPEL DE LA ZONE DE LINK SONT GARNIES :
      * LECTURE ART TAUDIS DIR, COM ET IFP/TRESORERIE
              WHEN NOT 0 ALSO NOT SPACE ALSO NOT 0 ALSO NOT SPACE
                          PERFORM APPEL-DIR
                          PERFORM APPEL-COM
      * SI LA COMMUNE N'A PAS ETE VALIDEE PAR LA CHAINE DE CONTROLE
      * DES TAUX, ON SORT, SINON ON LIT L'ARTICLE IFP/TRESORERIE
                          IF T-C-GCOVEF         NOT = 'V'
                             MOVE '12'  TO      CR
                             MOVE '10'  TO      RC
                             EXIT PROGRAM
                          ELSE
                             PERFORM APPEL-AIFTRE
                          END-IF

      * LECTURE ART TAUDIS DIR ET COM CAR CODE IFP/TRESO NON GARNI
      * DANS LA ZONE DE LINK
              WHEN NOT 0 ALSO NOT SPACE ALSO NOT 0 ALSO  SPACE
                          PERFORM APPEL-DIR
                          PERFORM APPEL-COM

      * LECTURE ART DIR CAR CODE COM ET IFP/TRESO NON GARNIS
      * DANS LA ZONE DE LINK
              WHEN NOT 0 ALSO NOT SPACE ALSO     0 ALSO  SPACE
                          PERFORM APPEL-DIR

            END-EVALUATE

      *.... ON MOUVEMENTE LES ZONES LUES DU TAUDIS DANS LA ZONE
      *     DE LINK RETOUR
            PERFORM SERV-RET-LINK

            MOVE TAU-E-AN   TO EL-REC(1)
            MOVE TAU-D-DEP  TO EL-REC(2)
            MOVE TAU-C-COM  TO EL-REC(3)
            MOVE TAU-R-ROL  TO EL-REC(4)

            EXIT PROGRAM.

      *.... APPEL LECTURE TAUDIS ART IFP/TRESORERIE
       APPEL-AIFTRE.
            MOVE      CODDIR   TO T-DIR
            MOVE      CODCOM   TO T-COM
            MOVE      CCOIFP   TO T-CCOIFP
            MOVE      CCPPER   TO T-CCPPER
            READ TAUDIS INTO TAUDIS-IFP-TRESO
            IF TAUDIS-FS NOT = '00'
                  MOVE '23'       TO      CR
                  MOVE '01'       TO      RC
                  EXIT PROGRAM
            END-IF
            .

      *.... APPEL LECTURE TAUDIS ART COMMUNE
       APPEL-COM.
            MOVE      CODDIR   TO T-DIR
            MOVE      CODCOM   TO T-COM
            MOVE LOW-VALUE     TO T-CCOIFP
            MOVE LOW-VALUE     TO T-CCPPER
            READ TAUDIS INTO TAUDIS-COM
            IF TAUDIS-FS NOT = '00'
                  MOVE '21'       TO      CR
                  MOVE '01'       TO      RC
                  EXIT PROGRAM
            END-IF
            .

      *.... APPEL LECTURE TAUDIS ART DIRECTION
       APPEL-DIR.
            MOVE      CODDIR   TO T-DIR
            MOVE LOW-VALUE     TO T-COM
            MOVE LOW-VALUE     TO T-CCOIFP
            MOVE LOW-VALUE     TO T-CCPPER
            READ TAUDIS INTO TAUDIS-DIR
            IF TAUDIS-FS NOT = '00'
                  MOVE '20'       TO      CR
                  MOVE '01'       TO      RC
                  EXIT PROGRAM
            END-IF
            .



      *.... ALIMENTATION DE LA ZONE DE LINK RETOUR
       SERV-RET-LINK.
                MOVE SPACES             TO TAU-E-AIDFIC
                                           TAU-D-AIDFIC
                                           TAU-C-AIDFIC
                                           TAU-R-AIDFIC
      *
      * ZONES GENERALES
      *

      *       ANNEE D'IMPOSITION
                MOVE      ANIMP         TO TAU-E-JAN
      *       CODE COMMUNE
                MOVE ZERO               TO TAU-E-CCOCOM

      *
      * ZONES DIRECTION
      *

      *       ANNEE D'IMPOSITION
                MOVE      ANIMP         TO TAU-D-JAN
      *       CODE DIRECTION
                MOVE T-C-DEPDIR         TO TAU-D-DEPDIR
      *       TAUX DEPARTEMENT BATI
                MOVE T-D-PTBDEP         TO TAU-D-TAUDEP-B
      *       TAUX TASA BATI
                MOVE T-D-PTBTAS         TO TAU-D-PTBTAS
      *       TAUX CHAMBRE D'AGRICULTURE
                MOVE T-D-PNBAGR         TO TAU-D-TAUCHAGR-NB
      *       TAUX CHAMBRE CONSULAIRE POUR ST MARTIN (971127)
                IF T-D-PNBAGN(1:4) NOT = '9999'
                   MOVE T-D-PNBAGN      TO TAU-D-TAUSMAGR-NB
                ELSE
                   MOVE ZERO            TO TAU-D-TAUSMAGR-NB
                END-IF

      *
      * ZONES COMMUNE
      *

      *       ANNEE D'IMPOSITION
                MOVE      ANIMP         TO TAU-C-JAN
      *       CODE DIRECTION
                MOVE T-C-DEPDIR         TO TAU-C-DEPDIR
      *       CODE COMMUNE
                MOVE T-C-CCOCOM         TO TAU-C-CCOCOM
      *       DELIB EPCI DEGVT JA N-4 ANNEE INSTALLATION
                MOVE T-C-JGCIN5         TO TAU-C-JGCINS(1)
      *       DELIB EPCI DEGVT JA N-4 ANNEE RETOUR IMPOSITION
                MOVE T-C-JGCRI5         TO TAU-C-JGCRIM(1)
      *       DELIB EPCI DEGVT JA N-3 ANNEE INSTALLATION
                MOVE T-C-JGCIN4         TO TAU-C-JGCINS(2)
      *       DELIB EPCI DEGVT JA N-3 ANNEE RETOUR IMPOSITION
                MOVE T-C-JGCRI4         TO TAU-C-JGCRIM(2)
      *       DELIB EPCI DEGVT JA N-2 ANNEE INSTALLATION
                MOVE T-C-JGCIN3         TO TAU-C-JGCINS(3)
      *       DELIB EPCI DEGVT JA N-2 ANNEE RETOUR IMPOSITION
                MOVE T-C-JGCRI3         TO TAU-C-JGCRIM(3)
      *       DELIB EPCI DEGVT JA N-1 ANNEE INSTALLATION
                MOVE T-C-JGCIN2         TO TAU-C-JGCINS(4)
      *       DELIB EPCI DEGVT JA N-1 ANNEE RETOUR IMPOSITION
                MOVE T-C-JGCRI2         TO TAU-C-JGCRIM(4)
      *       DELIB EPCI DEGVT JA N   ANNEE INSTALLATION
                MOVE T-C-JGCIN1         TO TAU-C-JGCINS(5)
      *       DELIB EPCI DEGVT JA N   ANNEE RETOUR IMPOSITION
                MOVE T-C-JGCRI1         TO TAU-C-JGCRIM(5)
      *       NUMERO DE ROLE
                MOVE T-C-DNURO          TO TAU-C-DNURO
      *       NUMERO DE LOT
                MOVE T-C-DNULTF         TO TAU-C-DNULTF
      *       DATE D'HOMOLOGATION DU ROLE
                MOVE T-C-JDAHO1         TO TAU-C-JDHOMO
      *       CODE ANNULATION RECONFECTION
                MOVE T-C-GCOANU         TO TAU-C-GCOANU

      *
      * ZONES IFP TRESORERIE
      *

      *       ANNEE D'IMPOSITION
                MOVE      ANIMP         TO TAU-R-JAN
      *       CODE DIRECTION
                MOVE T-R-DEPDIR         TO TAU-R-DEPDIR
      *       CODE COMMUNE
                MOVE T-R-CCOCOM         TO TAU-R-CCOCOM
      *       CODE IFP
                MOVE T-R-CCOIFP         TO TAU-R-CCOIFP
      *       TAUX COMMUNAL BATI
                MOVE T-R-PTBCOM         TO TAU-R-TAUCOM-B
      *       TAUX COMMUNAL NON BATI
                MOVE T-R-PNBCOM         TO TAU-R-TAUCOM-NB
      *       TAUX SYNDICAT COMMUNAL BATI
                MOVE T-R-PTBSYN         TO TAU-R-TAUSYNDSFP-B
      *       TAUX SYNDICAT COMMUNAL NON BATI
                MOVE T-R-PNBSYN         TO TAU-R-TAUSYNDSFP-NB
      *       TAUX EPCI BATI
                MOVE T-R-PTBCU          TO TAU-R-TAUCUDFPVN-B
      *       TAUX EPCI NON BATI
                MOVE T-R-PNBCU          TO TAU-R-TAUCUDFPVN-NB
      *       TAUX TAXE ADDITIONNELLE NON BATI
                MOVE T-R-PNBTXA         TO TAU-R-PNBTXA
      *       TAUX TSE 1 BATI
                MOVE T-R-PTBTSN(1)      TO TAU-R-TAUTSE-B
      *       TAUX TSE 1 NON BATI
                MOVE T-R-PNBTSN(1)      TO TAU-R-TAUTSE-NB
      *       TAUX TSE 2 BATI
                MOVE T-R-PTBTSN(2)      TO TAU-R-PTBTGP
      *       TAUX TSE 2 NON BATI
                MOVE T-R-PNBTSN(2)      TO TAU-R-PNBTGP
      *       TAUX CAAA
                MOVE T-R-PNBCAA         TO TAU-R-PNBCAA
      *       TAUX GEMAPI BATI
                MOVE T-R-PTBGEM         TO TAU-R-PTBGEM
      *       TAUX GEMAPI NON BATI
                MOVE T-R-PNBGEM         TO TAU-R-PNBGEM
      *       DELIB COMMUNALE DEGVT JA N-4 ANNEE INSTALLATION
                MOVE T-R-JCOIN5         TO TAU-C-JCOINS(1)
      *       DELIB COMMUNALE DEGVT JA N-4 ANNEE RETOUR IMPOSITION
                MOVE T-R-JCORI5         TO TAU-C-JCORIM(1)
      *       DELIB COMMUNALE DEGVT JA N-3 ANNEE INSTALLATION
                MOVE T-R-JCOIN4         TO TAU-C-JCOINS(2)
      *       DELIB COMMUNALE DEGVT JA N-3 ANNEE RETOUR IMPOSITION
                MOVE T-R-JCORI4         TO TAU-C-JCORIM(2)
      *       DELIB COMMUNALE DEGVT JA N-2 ANNEE INSTALLATION
                MOVE T-R-JCOIN3         TO TAU-C-JCOINS(3)
      *       DELIB COMMUNALE DEGVT JA N-2 ANNEE RETOUR IMPOSITION
                MOVE T-R-JCORI3         TO TAU-C-JCORIM(3)
      *       DELIB COMMUNALE DEGVT JA N-1 ANNEE INSTALLATION
                MOVE T-R-JCOIN2         TO TAU-C-JCOINS(4)
      *       DELIB COMMUNALE DEGVT JA N-1 ANNEE RETOUR IMPOSITION
                MOVE T-R-JCORI2         TO TAU-C-JCORIM(4)
      *       DELIB COMMUNALE DEGVT JA N   ANNEE INSTALLATION
                MOVE T-R-JCOIN1         TO TAU-C-JCOINS(5)
      *       DELIB COMMUNALE DEGVT JA N   ANNEE RETOUR IMPOSITION
                MOVE T-R-JCORI1         TO TAU-C-JCORIM(5)
      *       NOMBRE DE ZONES DE RAMASSAGE ORDURES MENAGERES (FDL)
                MOVE T-R-NTXOM          TO TAU-C-NBTAUXOM
      *       TAUX OM ZONE RAMASSAGE TAUX PLEIN
                MOVE T-R-PBBOMP         TO TAU-C-PBBOMP
      *       TAUX OM ZONE RAMASSAGE TAUX REDUIT A
                MOVE T-R-PBBOMA         TO TAU-C-PBBOMA
      *       TAUX OM ZONE RAMASSAGE TAUX REDUIT B
                MOVE T-R-PBBOMB         TO TAU-C-PBBOMB
      *       TAUX OM ZONE RAMASSAGE TAUX REDUIT C
                MOVE T-R-PBBOMC         TO TAU-C-PBBOMC
      *       TAUX OM ZONE RAMASSAGE TAUX REDUIT D
                MOVE T-R-PBBOMD         TO TAU-C-PBBOMD
      *       TAUX OM ZONE RAMASSAGE TAUX REDUIT E
                MOVE T-R-PBBOME         TO TAU-C-PBBOME
      *       CODE BENEFICIAIRE DES ORDURES MENAGERES
      *       22 = COMMUNE, 23 = EPCI, 34 = SYND. OM
                MOVE T-R-CCOBOM         TO TAU-R-LIGBENEFOM
                  .
