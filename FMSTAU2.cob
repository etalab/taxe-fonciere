       ID DIVISION.
       PROGRAM-ID. FMSTAU2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***
       01  SLATVARS              PIC X(122)                 VALUE 'SLAT
      -    'VARS START: DATEUPD TIMEUPD PROGRAMMERNAME MODNAME LVNO UPNO
      -    ' DATA-SET-NAME-FOR-THE-LIBRARIAN-MASTER-FILESLAT VARS END'.

      * PARAMETRES D ACCES A LA BASE TAUX (DLI)
       77  GU                           PIC X(04).
       01  SSAQ-GEN.
           05  SSA-SEG PIC X(11) value 'XEXTDXTD*C('.
           05  SSAQ-CLE                 PIC X(13).
           05  SSA-F3                   PIC X(01) value ')'.
      * DETAIL CLE
       01 W-TAU-CLE.
           05  W-TAU-AN PIC 9(4).
           05  W-TAU-DIR PIC X(3).
           05  W-TAU-COM PIC 9(3).
           05  W-TAU-IFP PIC X(3).
       01 W-ORI-CLE.
           05  W-ORI-AN PIC 9(4).
           05  W-ORI-DIR PIC X(3).
           05  W-ORI-COM PIC 9(3).
           05  W-ORI-IFP PIC X(3).

      * DETAIL CLE POUR RECHERCHE DES ARTICLES LIBELLES
       01 W-LIB-CLE.
           05  W-LIB-AN PIC 9(4).
           05  W-LIB-DIR PIC X(3).
           05  W-LIB-CLE1.
             10  W-LIB-CTYGC PIC X.
             10  W-LIB-DNUCOL PIC X(3).
           05  FILLER PIC X(2) VALUE SPACE.

      * SAUVEGARDE CODE DIRECTION ENTREE
       01 W-ACODIR-ENTREE               PIC X(03).
      * DERNIER CARACTERE MIN DU CODE DIRECTION POUR LES DEPARTEMENTS
       01 DEPT-DIR-MIN     PIC 9.
           88 DEPT-DIR-N2  VALUE 1.
           88 DEPT-DIR-N5  VALUE 4.
      * DERNIER CARACTERE MAX DU CODE DIRECTION POUR LES DEPARTEMENTS
       01 DEPT-DIR-MAX     PIC 9.
           88 DEPT-DIR-X2  VALUE 2.
           88 DEPT-DIR-X5  VALUE 8.
      * TROISIEME ET DERNIER CARACTERE DU CODE DIRECTION
       01 IND-DIR  PIC 9.
      * INDICATEUR DE FIN DE BOUCLE
       01                  PIC 9.
           88 NOTOK        VALUE 0.
           88 OK           VALUE 1.
      * ADRESSE PCB
       01 XPCBNAME                      PIC X(08).
       01 XPCBADX                       EXTERNAL.
          05 XPCB-COM00                 USAGE POINTER.
      *--------------    DONNEES GENERALES  ANNEE --------------------***
      *  ANNEE SERVIE  -  DIR = SPACE  - COM = 000 - CODE IFP = SPACE   *
       01   XB30.
       COPY XB30.
      *--------------    DONNEES DIRECTION  --------------------------***
      *  ANNEE SERVIE  -  DIR SERVIE   - COM = 000 - CODE IFP = SPACE   *
       01   XB35.
       COPY XB35.
      *--------------    DONNEES DIRECTION ORIGINE -------------------***
      *  ANNEE SERVIE  -  DIR SERVIE   - COM = 000 - CODE IFP = SPACE   *
       01   XB35-ORI.
       COPY XBXTDDIR REPLACING 'X' BY XB35-ORI.
      *--------------    DONNEES COMMUNE    --------------------------***
      * ANNEE SERVIE - DIR SERVIE  - COM SERVIE    - CODE IFP = SPACE   *
       01   XB40.
       COPY XB40.
      *--------------    DONNEES CODE IFP ----------------------------***
      * ANNEE SERVIE - DIR SERVIE  - COM SERVIE  - CODE IFP = SERVI     *
       01   XB45.
       COPY XB45.
      *--------------    DONNEES CODE IFP SUITE ----------------------***
       01   XB46.
       COPY XB46.
      *--------------    DONNEES ORGANISME TSE------------------------***
      * ANNEE SERVIE - DIR SERVIE  - TYPE GPT SERVI - CODE GPT SERVI  ***
       01   XB36.
       COPY XB36.
      *--------------    DONNEES LIBELLE EPCI ------------------------***
      * ANNEE SERVIE - DIR SERVIE  - TYPE GPT SERVI - CODE GPT SERVI  ***
       01   XB37.
       COPY XB37.
      *--------------    DONNEES LIBELLE TEOM ------------------------***
      * ANNEE SERVIE - DIR SERVIE  - TYPE GPT SERVI - CODE GPT SERVI  ***
       01   XB38.
        COPY XB38.
      *--------------    DONNEES LIBELLES SYNDICATS ------------------***
      * ANNEE SERVIE - DIR SERVIE  - COM SERVIE - CODE IFP Z SERVI    ***
       01   XB47.
       COPY XB47.
      *--------------    DONNEES ADRESSE MEL COMMUNE -----------------***
      * ANNEE SERVIE - DIR SERVIE  - COM SERVIE - CODE IFP Y SERVI    ***
       01   XB41.
       COPY XB41.
      *-------------    article pour restitution des 3 libell{s        ***
      *------------- 1er  occurs : libell{ TSE          sur 100 C.     ***
      *------------- 2}me occurs : libell{ TSE GP,MA,GA sur 100 C.     ***
      *------------- 3er  occurs : libell{ EPCI sur 100 caract}res     ***
      *-------------             : adresse mel EPCI sur 100 C.         ***
       01   XB50.
       COPY XB50.
      *-------------    article pour restitution de                    ***
      *------------- LIBELLES SYNDICATS et ADRESSE MEL COMMUNE         ***
       01   XB51.
       COPY XB51.
       LINKAGE SECTION.
      * DESCRIPTION DES PARMS EN ENTREE
       COPY XTAU2.
      * **************************************************
      * DESCRIPTION PCB
       01  PCB-COM.
            05  NOMBASE               PIC X(8).
            05  NIVEAUSEG             PIC X(2).
            05  DLI-RETOUR            PIC X(2).
            05  PROCOPT               PIC X(4).
            05  RESERVES              PIC S9(5) COMP.
            05  NOMSEG                PIC X(8).
            05  LG-CLE                PIC S9(5) COMP.
            05  NB-SEG-ACCESSIB       PIC S9(5) COMP.
            05  CLE-CONCAT            PIC X(07).

      * **************************************************
       PROCEDURE DIVISION USING FIE01-JANIPT FIE01-ACODIR
               FIE01-CCOCOM FIE01-CCOIFP CR RC
               ZES.
      **************************************************************
      *  INITIALISATION.                                           *
      **************************************************************
        INIT.
            MOVE 'GU' TO GU.
            INITIALIZE XB30
                       XB35
                       XB36
                       XB40
                       XB45
                       XB37
                       XB38
                       XB50
                       XB41 XB46 XB51
                       XB47           CR  RC
            .
      **************************************************************
      *  ACCES A LA BASE DES TAUX                                  *
      *  UN SEUL PCB EN LECTURE : GPHXTDTA                         *
      **************************************************************
        ACCES-TAUX.
            MOVE 'GPHXTD00' TO XPCBNAME
            CALL 'FMSPCB' USING XPCBNAME XPCB-COM00
            IF RETURN-CODE NOT = 0
                  MOVE 18 TO CR
                  MOVE RETURN-CODE TO RC
            ELSE
              SET ADDRESS OF PCB-COM TO XPCB-COM00
            END-IF
            .

      **************************************************************
      *  CAS DU PELP                                               *
      **************************************************************
        PELP-DEPT-MULTI-DSF.
            MOVE FIE01-ACODIR TO W-ACODIR-ENTREE
      *   RECHERCHE DE LA COMMUNE DANS LA BASE TAUX
      *********************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND
               (FIE01-CODEP = '75' OR '13' OR '59' OR '92')
                                     AND FIE01-CCOCOM NOT = ZERO)
                PERFORM PELP-COM
            END-IF
            .
      *
      **************************************************************
      *  RECUP SELON LE CAS DE 1 A 7 SEGMENTS                      *
      **************************************************************
        RECUP-SEG.
      *
      *   RECHERCHE DE L'ANNEE DANS LA BASE TAUX
      ******************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO)
              PERFORM RECH-ANNEE
            END-IF
      *
      *   RECHERCHE DE LA DIRECTION DANS LA BASE TAUX
      ***********************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO
                           AND FIE01-ACODIR NOT = SPACE)
              PERFORM RECH-DIR
            END-IF
      *
      *   RECHERCHE DE LA COMMUNE DANS LA BASE TAUX
      *********************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO)
                PERFORM RECH-COM
      *  RECHERCHE DU LIBELLE GROUPEMENT EPCI SI CODE RENSEIGNE
                IF (CR NOT > 2 AND XB40-CTYGC NOT = SPACE
                             AND XB40-DNUCOL NOT = SPACE)
                    PERFORM RECH-LEPCI
                END-IF
      *  RECHERCHE DU LIBELLE GROUPEMENT TEOM SI CODE RENSEIGNE
                IF (CR NOT > 2 AND XB40-CTYSYN NOT = SPACE
                             AND XB40-CCOSYN NOT = SPACE)
                    PERFORM RECH-LTEOM
                END-IF
            END-IF
      *
      *   RECHERCHE DU CODE IFP DANS LA BASE TAUX
      ********************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO
                                         AND FIE01-CCOIFP NOT = SPACE)
              PERFORM RECH-IFP
      *   RECHERCHE DU CODE IFP SUITE DANS LA BASE TAUX
              IF FIE01-JANIPT > 2015
                 PERFORM RECH-IFP-SUITE
      *  RECHERCHE DU LIBELLE GROUPEMENT TEOM SI CODE RENSEIGNE
      *  A PARTIR DE 2016, LE CODE GROUPEMENT TEOM EST AU NIVEAU SR
                 IF (CR NOT > 2 AND XB40-CTYSYN NOT = SPACE
                                AND XB40-CCOSYN NOT = SPACE)
                    PERFORM RECH-LTEOM
                 END-IF
              END-IF
      * RECHERCHE DES LIBELLES TSE POUR RESTITUTION DU RESULTAT DANS XB50
              PERFORM RECH-LIB
      * CAS DU CHANGEMENT DE DEPARTEMENT POUR UNE COMMUNE : RECHERCHE DU
      * SEGMENT DIRECTION D'ORIGINE
              IF (CR NOT > 2 AND XB45-CCDDIR NOT = SPACE)
                 PERFORM RECH-DIR-ORI
              END-IF
            END-IF
      *
      *   RECHERCHE DES LIBELLES SYNDICATS (CODE IFP "Z  ")
      ***************************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO)
              PERFORM RECH-LSYN
            END-IF
      *
      *   RECHERCHE DE L'ADRESSE MEL COMMUNE (CODE IFP "Y  ")
      ***************************************************
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO)
              PERFORM RECH-LMEL
            END-IF
      *
      *   RESTITUTION DES INFORMATIONS
      ***************************************************
            MOVE   XB30      TO  EL-REC(1)
            MOVE   XB35      TO  EL-REC(2)
            MOVE   XB40      TO  EL-REC(3)
            MOVE   XB45      TO  EL-REC(4)
            MOVE   XB50      TO  EL-REC(5)
            MOVE   XB51      TO  EL-REC(6)
            MOVE   XB47      TO  EL-REC(7)
            MOVE W-ACODIR-ENTREE TO FIE01-ACODIR
            GOBACK
            .

      ********      FONCTIONS APPELEES PAR PERFORM

      *  RECHERCHE DE L'ARTICLE ANNEE DANS LA BASE TAUX
      *
       RECH-ANNEE.
              MOVE FIE01-JANIPT TO W-TAU-AN
              MOVE SPACE        TO W-TAU-DIR
              MOVE 0            TO W-TAU-COM
              MOVE SPACE        TO W-TAU-IFP
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB30
                       SSAQ-GEN
              EVALUATE DLI-RETOUR
              WHEN 'GE'
                   MOVE  20  TO  CR    MOVE 01 TO RC
              WHEN  NOT SPACE
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-EVALUATE
                .
      *
      *  RECHERCHE DE L'ARTICLE DIRECTION DANS LA BASE TAUX
       RECH-DIR.
              MOVE FIE01-ACODIR TO W-TAU-DIR
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB35
                       SSAQ-GEN
              EVALUATE DLI-RETOUR
              WHEN 'GE'
                   MOVE  21  TO  CR    MOVE 01 TO RC
              WHEN  NOT SPACE
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-EVALUATE
               .
      *
      *  RECHERCHE DE L'ARTICLE DIRECTION ORIGINE DANS LA BASE TAUX
       RECH-DIR-ORI.
              MOVE FIE01-JANIPT TO W-ORI-AN
              MOVE XB45-CCDDIR  TO W-ORI-DIR
              MOVE '000'        TO W-ORI-COM
              MOVE SPACE        TO W-ORI-IFP
              MOVE W-ORI-CLE    TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB35-ORI
                       SSAQ-GEN
              EVALUATE DLI-RETOUR
              WHEN '  '
                   MOVE XB35-ORI-ADTSEG(1:385)
                                        TO XB35-ADTSEG
                   IF XB40-GNIDEP = 'N'
                      MOVE ZERO TO XB35-PTBDEP
                   END-IF
              WHEN 'GE'
                   MOVE  25  TO  CR    MOVE 01 TO RC
              WHEN OTHER
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-EVALUATE
               .
      *
      *  RECHERCHE DE L'ARTICLE COMMUNE DANS LA BASE TAUX
       RECH-COM.
              MOVE FIE01-CCOCOM TO W-TAU-COM
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB40
                       SSAQ-GEN
              EVALUATE DLI-RETOUR
              WHEN '  '
                   IF XB40-GTOVOT NOT = 'V'
                      MOVE 12 TO CR  MOVE 10 TO RC
                   END-IF
                   IF XB40-GNIDEP = 'N'
                      MOVE ZERO TO XB35-PTBDEP
                   END-IF
              WHEN 'GE'
                   MOVE  22  TO  CR    MOVE 01 TO RC
              WHEN  NOT SPACE
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-EVALUATE
              .
      *
      *  RECHERCHE DE L'ARTICLE CODE IFP DANS LA BASE TAUX
       RECH-IFP.
              MOVE FIE01-CCOIFP TO W-TAU-IFP
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB45
                       SSAQ-GEN
              EVALUATE DLI-RETOUR
              WHEN 'GE'
                   MOVE  23  TO  CR    MOVE 01 TO RC
              WHEN  NOT SPACE
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-EVALUATE
              .
      *
      *  RECHERCHE DE L'ARTICLE CODE IFP SUITE DANS LA BASE TAUX
       RECH-IFP-SUITE.
              MOVE SPACE        TO W-TAU-DIR
              MOVE FIE01-CCOIFP TO W-TAU-IFP
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB46
                       SSAQ-GEN
              EVALUATE DLI-RETOUR
              WHEN '  '
                   MOVE XB46-PBBOMP     TO XB40-PBBOMP
                   MOVE XB46-PBBOMA     TO XB40-PBBOMA
                   MOVE XB46-PBBOMB     TO XB40-PBBOMB
                   MOVE XB46-PBBOMC     TO XB40-PBBOMC
                   MOVE XB46-PBBOMD     TO XB40-PBBOMD
                   MOVE XB46-PBBOME     TO XB40-PBBOME
                   MOVE XB46-NTXOM      TO XB40-NTXOM
                   MOVE XB46-ACOSYN     TO XB40-ACOSYN
                   MOVE XB46-ACOGOM     TO XB40-ACOGOM
                   MOVE XB46-ACOBIM     TO XB40-ACOBIM
                   MOVE XB46-ACOTXA     TO XB40-ACOTXA
                   MOVE XB46-ACOGEM     TO XB40-ACOGEM
                   MOVE XB46-JCOINS(1)  TO XB40-JCOINS(1)
                   MOVE XB46-JCORIM(1)  TO XB40-JCORIM(1)
                   MOVE XB46-JCOINS(2)  TO XB40-JCOINS(2)
                   MOVE XB46-JCORIM(2)  TO XB40-JCORIM(2)
                   MOVE XB46-JCOINS(3)  TO XB40-JCOINS(3)
                   MOVE XB46-JCORIM(3)  TO XB40-JCORIM(3)
                   MOVE XB46-JCOINS(4)  TO XB40-JCOINS(4)
                   MOVE XB46-JCORIM(4)  TO XB40-JCORIM(4)
                   MOVE XB46-JCOINS(5)  TO XB40-JCOINS(5)
                   MOVE XB46-JCORIM(5)  TO XB40-JCORIM(5)
              WHEN 'GE'
                   MOVE  24  TO  CR    MOVE 01 TO RC
              WHEN OTHER
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-EVALUATE
              .
      *
      *  RECHERCHE DE L'ARTICLE LIBELLE EPCI DANS LA BASE TAUX
       RECH-LEPCI.
              MOVE FIE01-JANIPT TO W-LIB-AN
              MOVE FIE01-ACODIR TO W-LIB-DIR
              IF FIE01-CODEP = '75'
                 MOVE '754'        TO W-LIB-DIR
              END-IF
              MOVE XB40-CTYGC  TO W-LIB-CTYGC
              MOVE XB40-DNUCOL TO W-LIB-DNUCOL
              MOVE W-LIB-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB37
                       SSAQ-GEN
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-IF
                 .
      *
      *  RECHERCHE DES ARTICLES LIBELLES TSE ET PREPARATION DU RESULTAT
       RECH-LIB.
      *  ALIMENTATION DU 3EME OCCURS : LIBELLE EPCI
              MOVE XB37 TO XB50-AENR (3)
      *  ALIMENTATION ADRESSE MEL EPCI
              MOVE XB37-VMAILG     TO XB50-VMAILG
              MOVE XB37-VMAILD     TO XB50-VMAILD
      *  RECHERCHE DU LIBELLE TSE
              INITIALIZE XB36
              MOVE FIE01-JANIPT TO W-LIB-AN
              MOVE FIE01-ACODIR TO W-LIB-DIR
              IF FIE01-CODEP = '75'
                 MOVE '754'        TO W-LIB-DIR
              END-IF
              MOVE XB45-ACOETS (1) TO W-LIB-CLE1
              MOVE W-LIB-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB36
                       SSAQ-GEN
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-IF
      *  ALIMENTATION DU 1ER OCCURS : TSE
              MOVE XB36 TO XB50-AENR (1)
      *  RECHERCHE DU LIBELLE TSEGP, TSEMA, TSEGA
              INITIALIZE XB36
              MOVE FIE01-JANIPT TO W-LIB-AN
              MOVE FIE01-ACODIR TO W-LIB-DIR
              IF FIE01-CODEP = '75'
                 MOVE '754'        TO W-LIB-DIR
              END-IF
              MOVE XB45-ACOETS (2) TO W-LIB-CLE1
              MOVE W-LIB-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB36
                       SSAQ-GEN
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-IF
      *  ALIMENTATION DU 2EME OCCURS : TSEGP, TSEMA, TSEGA
              MOVE XB36 TO XB50-AENR (2)
                 .
      *
      *  RECHERCHE DE L'ARTICLE LIBELLE TEOM DANS LA BASE TAUX
       RECH-LTEOM.
              MOVE FIE01-JANIPT TO W-LIB-AN
              MOVE FIE01-ACODIR TO W-LIB-DIR
              MOVE XB40-CTYSYN TO W-LIB-CTYGC
              MOVE XB40-CCOSYN TO W-LIB-DNUCOL
              MOVE W-LIB-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB38
                       SSAQ-GEN
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              ELSE
                   MOVE XB38    TO XB51
              END-IF
                .
      *
      *  RECHERCHE DE L'ARTICLE LIBELLES SYNDICATS DANS LA BASE TAUX
       RECH-LSYN.
              MOVE FIE01-ACODIR TO W-TAU-DIR
              MOVE 'Z  '        TO W-TAU-IFP
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB47
                       SSAQ-GEN
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              END-IF
                .
      *
      *  RECHERCHE DE L'ARTICLE ADRESSE MEL COMMUNE DANS LA BASE TAUX
       RECH-LMEL.
              MOVE FIE01-ACODIR TO W-TAU-DIR
              MOVE 'Y  '        TO W-TAU-IFP
              MOVE W-TAU-CLE TO SSAQ-CLE
              CALL 'CBLTDLI' USING GU  PCB-COM XB41
                       SSAQ-GEN
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                  MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC
              ELSE
                  MOVE XB41-VMAILG TO XB51-VMAILG
                  MOVE XB41-VMAILD TO XB51-VMAILD
              END-IF
                .
      *
      *  RECHERCHE DE LA DIRECTION A LAQUELLE EST RATTACHEE LA COMMUNE
       PELP-COM.
              IF FIE01-CODEP = '75'
                 SET DEPT-DIR-N5   TO TRUE
                 SET DEPT-DIR-X5   TO TRUE
              ELSE
                 SET DEPT-DIR-N2   TO TRUE
                 SET DEPT-DIR-X2   TO TRUE
              END-IF
              SET NOTOK            TO TRUE
      *--- BOUCLE DE RECHERCHE SUR TOUTES LES DIRECTIONS ASSOCIEES AU
      *--- AU DEPARTEMENT
              MOVE DEPT-DIR-MIN    TO IND-DIR
              MOVE FIE01-JANIPT    TO W-TAU-AN
              MOVE FIE01-ACODIR    TO W-TAU-DIR
              MOVE IND-DIR         TO W-TAU-DIR(3:1)
              MOVE FIE01-CCOCOM    TO W-TAU-COM
              MOVE SPACE           TO W-TAU-IFP
              PERFORM UNTIL     IND-DIR > DEPT-DIR-MAX OR
                                OK
                  MOVE W-TAU-CLE   TO SSAQ-CLE
                  CALL 'CBLTDLI' USING GU  PCB-COM XB40
                       SSAQ-GEN
                  IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')
                     MOVE  16          TO CR
                     MOVE DLI-RETOUR   TO RC
                     SET OK            TO TRUE
                  ELSE
                     IF DLI-RETOUR = 'GE'
                        ADD 1          TO IND-DIR
                        MOVE IND-DIR   TO W-TAU-DIR(3:1)
                     ELSE
                        SET OK         TO TRUE
                        MOVE W-TAU-DIR TO FIE01-ACODIR
                        INITIALIZE    XB40 W-TAU-CLE
                     END-IF
                  END-IF
              END-PERFORM
                .
