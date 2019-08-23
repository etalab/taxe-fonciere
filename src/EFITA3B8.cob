      *********************************************************
      * PROGRAMME EFITA3B8                                    *
      * LANGAGE COBOL                                         *
      *                                                       *
      * CE SOUS-PROGRAMME EST LA CALCULETTE DES COTISATIONS   *
      * BATIES DE TAXE FONCIERE DE L'ANNEE 2018.              *
      *                                                       *
      *********************************************************

       ID DIVISION.
       PROGRAM-ID. EFITA3B8.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***
       01 SLATVARS              PIC X(122)                  VALUE 'SLAT
      -    'VARS START:18/12/1315:17:22BEPARDI        EFITA3B80001000010
      -    'EFI.TST.PGM                                 SLAT VARS END'.

       01 VERSION PIC X(23) VALUE 'EFITA3B8 00 DU 13/03/18'.
       01 IND PIC S9(4) BINARY GLOBAL.

      *
      * ZONES DE TRAVAIL POUR CALCUL COTIS ET FRAIS
      *
       01 W-TOTCOT3             PIC S9(11) GLOBAL.
       01 W-TOTCOT8             PIC S9(11) GLOBAL.
       01 W-TOTCOT9             PIC S9(11) GLOBAL.
       01 W-FRAIS               PIC S9(11).
       01 W-TOTCOTOM            PIC S9(11) GLOBAL.
       01 W-F300FRS             PIC 9V9(4).
       01 W-F300ARN             PIC 9V9(4).
       01 W-F800FRS             PIC 9V9(4).
       01 W-F800ARN             PIC 9V9(4).
       01 W-F900FRS             PIC 9V9(4).
       01 W-F900ARN             PIC 9V9(4).
      * BASES RECONSTITUEES
       01 BASEB.
          COPY XBASEB   REPLACING 'X' BY BASEB.

      * ZONES GLOBALES
      * RECUP PARM
       01 COMBAT GLOBAL.
          COPY XCOMBAT  REPLACING 'X' BY COMBAT.

      * BASE TAUX
       01 TAU-E-AN.
          COPY XBXTDAN  REPLACING 'X' BY TAU-E.


       01 TAU-D-DEP.
          COPY XBXTDDIR REPLACING 'X' BY TAU-D.


       01 TAU-C-COM.
          COPY XBXTDCOM REPLACING 'X' BY TAU-C.


       01 TAU-R-ROL.
          COPY XBXTDSR  REPLACING 'X' BY TAU-R.


       01 TAU-R-ROL1.
          COPY XBXTDSR  REPLACING 'X' BY TAU-R1.


       01 ZES.
          05 ZESTAUX PIC X(400) OCCURS 7.
      * ZONES INTERMEDIAIRES
       01 COTISB GLOBAL.
          COPY XCOTB    REPLACING 'X' BY COTISB.

      * RETOUR MAJIC2
       01 RETOURB GLOBAL.
          COPY XRETB    REPLACING 'X' BY RETOURB.

      * CODES RETOUR
       01 CR                       PIC 9(2) GLOBAL.
       01 RC                       PIC 9(2) GLOBAL.

       LINKAGE SECTION.
      * DESCRIPTION DES PARAMETRES
      * APPEL INITIAL PAR MAJIC2
       01 COMBATM PIC X(600).
      * RETOUR VERS MAJIC2 DES COTISATIONS CALCULEES
       01 RETOURM PIC X(600).
      * RETOUR MAJIC2 DES CODES ANOMALIES
       01 CRM                      PIC 9(2).
       01 RCM                      PIC 9(2).
       01 PARM                     PIC X.

       PROCEDURE DIVISION USING COMBATM RETOURM CRM RCM PARM.

      ***********************************************************
      * INITIALISATIONS                                         *
      ***********************************************************
           INITIALIZE RETOURB BASEB COTISB.
           MOVE 0 TO CR RC
           MOVE COMBATM TO COMBAT
           MOVE 0.0800  TO W-F800FRS
           MOVE 0.0440  TO W-F800ARN
           MOVE 0.0300  TO W-F300FRS
           MOVE 0.0100  TO W-F300ARN
           MOVE 0.0900  TO W-F900FRS
           MOVE 0.0540  TO W-F900ARN

      ***********************************************************
      * VERIFICATION DES PARAMETRE ISSUS DE L'APPEL             *
      ***********************************************************

      * VERIFICATION DU CODE ARTICLE. LA ZONE CCOBNB DOIT ETRE
      * VALORISEE A 2 (ART BATI)
           IF COMBAT-CCOBNB NOT = 2
              MOVE 12 TO CR
              MOVE  1 TO RC
           END-IF

      * VERIFICATION DE L'ANNEE D'IMPOSITION
            IF COMBAT-DAN = '2018'
               CONTINUE
            ELSE
               MOVE 12 TO CR
               MOVE  2 TO RC
           END-IF

      * VERIFICATION DE LA NUMERICITE DES BASES D'IMPOSITION
           IF COMBAT-MBACOM     NOT NUMERIC OR
              COMBAT-MBADEP     NOT NUMERIC OR
              COMBAT-MBAREG     NOT NUMERIC OR
              COMBAT-MBASYN     NOT NUMERIC OR
              COMBAT-MBACU      NOT NUMERIC OR
              COMBAT-MBAGE3     NOT NUMERIC OR
              COMBAT-MBATA3     NOT NUMERIC OR
              COMBAT-MBBT13(1)  NOT NUMERIC OR
              COMBAT-MBBT13(2)  NOT NUMERIC
              MOVE 12 TO CR
              MOVE 11 TO RC
           END-IF

      * VERIFICATION DU ZONAGE ET DES BASES OM
           PERFORM VARYING IND FROM 1 BY 1 UNTIL IND > 6
              IF NOT COMBAT-GTAUOM-OK(IND)
                 MOVE 12 TO CR MOVE 5 TO RC
              END-IF
              IF COMBAT-GTAUOM(IND) NOT = SPACE
              AND COMBAT-MBAOM(IND) NOT NUMERIC
                 MOVE 12 TO CR MOVE 6 TO RC
              END-IF
              IF COMBAT-GTAUOM(IND) = SPACE
                 MOVE 0 TO COMBAT-MBAOM(IND)
              END-IF
           END-PERFORM

      * ON NE RENTRE DANS LA CALCULETTE QUE SI LE CR NON POSITIF
           IF CR NOT > ZERO

      **************************************************************
      * RECUPERATION DES TAUX :                                    *
      *                                                            *
      * LES TAUX NE SONT PAS RECUPERES SI L'IMPOSITION BATIE       *
      * PRECEDENTE A LES PARAMETRES ANNEE, DIRECTION, COMMUNE      *
      * ET IFP TOUS IDENTIQUES A L'IMPOSITION NON BATIE  TRAITEE   *
      *                                                            *
      * DANS LE CAS CONTRAIRE, SELON L'APPLICATION APPELANTE,      *
      * LA RECUPERATION DES TAUX SE FAIT SOIT AVEC LE SS-PRG :     *
      *  - EFITAUX2 QUAND L'APPEL EST FAIT PAR CROISIC (ROLE       *
      *      GENERAL DE TF), AVEC LA VARIABLE PARM VALORISEE A 'M' *
      *  - FMSTAU2 QUAND L'APPEL EST FAIT PAR MAJIC ( IMPOSITIONS  *
      *      SUPPLEMENTAIRES TF OU CONTENTIEUX TF ) AVEC UN PARM   *
      *      NON VALORISE A 'M'                                    *
      **************************************************************

              EVALUATE TRUE ALSO TRUE ALSO TRUE ALSO TRUE
                 WHEN COMBAT-DAN    = TAU-R-JAN    ALSO
                      COMBAT-AC3DIR = TAU-R-DEPDIR ALSO
                      COMBAT-CCOCOM = TAU-R-CCOCOM ALSO
                      COMBAT-CCOIFP = TAU-R-CCOIFP
                    CONTINUE
                 WHEN OTHER
                    IF PARM = 'M'
                       CALL 'EFITAUX2' USING
      * PROGRAMME EFITAUX2
      * DESCRIPTION SOMMAIRE DU TRAITEMENT :
      * MODULE DE RECUPERATION DES TAUX DANS LE FICHIER TAUDIS
      * IL SE SUBSTITUE A LA BASE TAUX ET SA PRIMITIVE D'ACCES

      * PARM ENTREE
                          COMBAT-DAN
                          COMBAT-AC3DIR
                          COMBAT-CCOCOM
                          COMBAT-CCOIFP
                          COMBAT-CCPPER
      * CODES RETOUR
                          CR RC
      * DONNEES RENDUES
                          ZES
                          ON EXCEPTION MOVE 24 TO CR MOVE 01 TO RC
                       END-CALL
                    ELSE
                       CALL 'FMSTAU2' USING
      * PROGRAMME FMSTAU2
      * DESCRIPTION SOMMAIRE DU TRAITEMENT :
      * PROGRAMME 'PRIMITIVE' D INTERROGATION A LA BASE TAUX

      * PARM ENTREE
                          COMBAT-DAN
                          COMBAT-AC3DIR
                          COMBAT-CCOCOM
                          COMBAT-CCOIFP
      * CODES RETOUR
                          CR RC
      * DONNEES RENDUES
                          ZES
                          ON EXCEPTION MOVE 24 TO CR MOVE 01 TO RC
                       END-CALL

                       MOVE ZESTAUX(4) TO TAU-R-ROL1
                       MOVE TAU-R-ROL1 TO ZESTAUX(4)
                    END-IF

                    MOVE ZESTAUX(1) TO TAU-E-AN
                    MOVE ZESTAUX(2) TO TAU-D-DEP
                    MOVE ZESTAUX(3) TO TAU-C-COM
                    MOVE ZESTAUX(4) TO TAU-R-ROL
              END-EVALUATE

      *************************************************************
      *     CONSTITUTION DE BASEB ET COTISB                       *
      *                                                           *
      *************************************************************
              MOVE COMBAT-AIDFIC      TO BASEB-CLE
                                         COTISB-CLE
              MOVE COMBAT-ANUPRO      TO BASEB-ANUPRO
                                         COTISB-ANUPRO
              MOVE COMBAT-CCOBNB      TO BASEB-ACODB
                                         COTISB-ACODB
              MOVE 'I'                TO BASEB-IMPOT
                                         COTISB-IMPOT
              MOVE 'BN'               TO BASEB-GNEXPL
                                         COTISB-GNEXPL
      *
      * ALIMENTATION DES TAUX
      *

      * TAUX COMMUNAL
              MOVE TAU-R-TAUCOM-B     TO BASEB-TAUCOM
                                         COTISB-TAUCOM
      * TAUX DEPARTEMENTAL
              MOVE TAU-D-TAUDEP-B     TO BASEB-TAUDEP
                                         COTISB-TAUDEP
      * TAUX TASA
              MOVE TAU-D-PTBTAS       TO BASEB-TAUTAS
                                         COTISB-TAUTAS
      * TAUX SYNDICAT DE COMMUNE
              MOVE TAU-R-TAUSYNDSFP-B TO BASEB-TAUSYN
                                         COTISB-TAUSYN
      * TAUX EPCI
              MOVE TAU-R-TAUCUDFPVN-B TO BASEB-TAUCU
                                         COTISB-TAUCU
      * TAUX TSE 1
              MOVE TAU-R-TAUTSE-B     TO BASEB-TAUTSEN(1)
                                         COTISB-TAUTSEN(1)
      * TAUX TSE 2
              MOVE TAU-R-PTBTGP       TO BASEB-TAUTSEN(2)
                                         COTISB-TAUTSEN(2)
      * TAUX GEMAPI
              MOVE TAU-R-PTBGEM       TO BASEB-TAUGEM
                                         COTISB-TAUGEM
      * TAUX OM ZONE TAUX PLEIN
              MOVE TAU-C-PBBOMP       TO BASEB-TAUOM1(1)
                                         COTISB-TAUOM1(1)
      * TAUX OM ZONE TAUX REDUIT A
              MOVE TAU-C-PBBOMA       TO BASEB-TAUOM1(2)
                                         COTISB-TAUOM1(2)
      * TAUX OM ZONE TAUX REDUIT B
              MOVE TAU-C-PBBOMB       TO BASEB-TAUOM1(3)
                                         COTISB-TAUOM1(3)
      * TAUX OM ZONE TAUX REDUIT C
              MOVE TAU-C-PBBOMC       TO BASEB-TAUOM1(4)
                                         COTISB-TAUOM1(4)
      * TAUX OM ZONE TAUX REDUIT D
              MOVE TAU-C-PBBOMD       TO BASEB-TAUOM1(5)
                                         COTISB-TAUOM1(5)
      * TAUX OM ZONE TAUX REDUIT E
              MOVE TAU-C-PBBOME       TO BASEB-TAUOM1(6)
                                         COTISB-TAUOM1(6)

      *
      *  ALIMENTATION DES BASES
      *

      * BASE COMMUNALE
              MOVE COMBAT-MBACOM      TO BASEB-BBCOM
                                         COTISB-BBCOM
      * BASE DEPARTEMENTALE
              MOVE COMBAT-MBADEP      TO BASEB-BBDEP
                                         COTISB-BBDEP
      * BASE SYNDICAT DE COMMUNE
              MOVE COMBAT-MBASYN      TO BASEB-BBSYN
                                         COTISB-BBSYN
      * BASE EPCI
              MOVE COMBAT-MBACU       TO BASEB-BBCU
                                         COTISB-BBCU
      * BASE GEMAPI
              MOVE COMBAT-MBAGE3      TO BASEB-BBGEM
                                         COTISB-BBGEM
      * BASE TASA
              MOVE COMBAT-MBATA3      TO BASEB-BBTAS
                                         COTISB-BBTAS
      * BASE TSE 1
              MOVE COMBAT-MBBT13(1)   TO BASEB-BBTSEN(1)
                                         COTISB-BBTSEN(1)
      * BASE TSE 2
              MOVE COMBAT-MBBT13(2)   TO BASEB-BBTSEN(2)
                                         COTISB-BBTSEN(2)
              PERFORM VARYING IND FROM 1 BY 1 UNTIL IND > 6
                 MOVE COMBAT-GTAUOM(IND) TO BASEB-GTAUOM(IND)
                                            COTISB-GTAUOM(IND)
                 MOVE COMBAT-MBAOM(IND)  TO BASEB-BBTEOM(IND)
                                            COTISB-BBTEOM(IND)
              END-PERFORM

      *
      * CALCUL DES COTISATION BATIES DE TAXE FONCIERE
      *

      * COTISATION COMMUNALE
              COMPUTE COTISB-COTICOM     ROUNDED =
                      COTISB-BBCOM * COTISB-TAUCOM / 100
      * COTISATION DEPARTEMENTALE
              COMPUTE COTISB-COTIDEP     ROUNDED =
                      COTISB-BBDEP * COTISB-TAUDEP / 100
      * COTISATION SYNDICAT DE COMMUNE
              COMPUTE COTISB-COTISYN     ROUNDED =
                      COTISB-BBSYN * COTISB-TAUSYN / 100
      * COTISATION EPCI
              COMPUTE COTISB-COTICU      ROUNDED =
                      COTISB-BBCU  * COTISB-TAUCU / 100
      * COTISATION GEMAPI
              COMPUTE COTISB-MCOGE3      ROUNDED =
                      COTISB-BBGEM  * COTISB-TAUGEM / 100
      * COTISATION TASA
              COMPUTE COTISB-MCOTA3      ROUNDED =
                      COTISB-BBTAS  * COTISB-TAUTAS / 100
      * COTISATION TSE 1
              COMPUTE COTISB-COTITSEN(1) ROUNDED =
                      COTISB-BBTSEN(1) * COTISB-TAUTSEN(1) / 100
      * COTISATION TSE 2
              COMPUTE COTISB-COTITSEN(2) ROUNDED =
                      COTISB-BBTSEN(2) * COTISB-TAUTSEN(2) / 100
      * COTISATION AMALGAMEE TSE 1 + TSE 2 + TASA
              COMPUTE COTISB-MCBTSA      ROUNDED =
                      COTISB-COTITSEN(1) + COTISB-COTITSEN(2) +
                      COTISB-MCOTA3
      *  COTISATION ORDURES MENAGERES
              PERFORM VARYING IND FROM 1 BY 1 UNTIL IND > 6
                 EVALUATE BASEB-GTAUOM(IND)
                    WHEN '  '
                       MOVE ZERO TO COTISB-COTIS-OM(IND)
                    WHEN 'P '
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(1)
                                                  / 100
                    WHEN ' P'
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(1)
                                                  / 100
                    WHEN 'RA'
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(2)
                                                  / 100
                    WHEN 'RB'
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(3)
                                                  / 100
                    WHEN 'RC'
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(4)
                                                  / 100
                    WHEN 'RD'
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(5)
                                                  / 100
                    WHEN 'RE'
                       COMPUTE COTISB-COTIS-OM(IND) ROUNDED =
                               COTISB-BBTEOM(IND) * COTISB-TAUOM1(6)
                                                  / 100
                    WHEN OTHER CONTINUE
                 END-EVALUATE
              END-PERFORM
      * COTISATION TEOMI
              MOVE COMBAT-MVLTIM TO COTISB-COTIS-OMI

      *
      * CALCUL DES FRAIS
      *

      * AMALGAME DES COTISTIONS OM ET DE TEOMI
              MOVE 0 TO W-TOTCOTOM
              PERFORM VARYING IND FROM 1 BY 1 UNTIL IND > 7
                 ADD COTISB-COTIS-OM(IND) TO W-TOTCOTOM
              END-PERFORM
              ADD COTISB-COTIS-OMI     TO W-TOTCOTOM
      * TOTAL DES COTISATIONS SOUMISES AUX FRAIS DE 3%
              COMPUTE W-TOTCOT3 = COTISB-COTICOM + COTISB-COTIDEP +
                                  COTISB-COTICU + COTISB-MCOGE3
      * TOTAL DES COTISATIONS SOUMISES AUX FRAIS DE 8%
              COMPUTE W-TOTCOT8 = W-TOTCOTOM  + COTISB-COTISYN +
                                  COTISB-MCOTA3
      * TOTAL DES COTISATIONS SOUMISES AUX FRAIS DE 9%
              COMPUTE W-TOTCOT9 = COTISB-COTITSEN(1) +
                                  COTISB-COTITSEN(2)
      * FRAIS A 3%
      *  ( FRAIS ASSIETTE : 1% - FRAIS DEGVT NON VALEUR : 2%)
              COMPUTE COTISB-FA300  ROUNDED = W-TOTCOT3 * W-F300ARN
              COMPUTE W-FRAIS       ROUNDED = W-TOTCOT3 * W-F300FRS
              COMPUTE COTISB-FN300          = W-FRAIS - COTISB-FA300
      * FRAIS A 8%
      *  ( FRAIS ASSIETTE : 4,4% - FRAIS DEGVT NON VALEUR : 3,6%)
              COMPUTE COTISB-FA800  ROUNDED = W-TOTCOT8  * W-F800ARN
              COMPUTE W-FRAIS       ROUNDED = W-TOTCOT8  * W-F800FRS
              COMPUTE COTISB-FN800          = W-FRAIS - COTISB-FA800
      * FRAIS A 9%
      *  ( FRAIS ASSIETTE : 5,4% - FRAIS DEGVT NON VALEUR : 3,6%)
              COMPUTE COTISB-FA900  ROUNDED = W-TOTCOT9  * W-F900ARN
              COMPUTE W-FRAIS       ROUNDED = W-TOTCOT9  * W-F900FRS
              COMPUTE COTISB-FN900          = W-FRAIS - COTISB-FA900

      *    DANS CERTAINS CAS LES FRAIS D'ASSIETTE SONT INFERIEURS
      *    DE 1 EURO AUX FRAIS DE DEGREVEMENT ET NON VALEUR
      *    DANS CE CAS, ON REEQUILIBRE ARTIFICIELLEMENT AFIN QUE
      *    FRAIS ASSIETTE > FRAIS DNV
              IF COTISB-FA800  < COTISB-FN800
                 ADD      1 TO   COTISB-FA800
                 SUBTRACT 1 FROM COTISB-FN800
              END-IF
              IF COTISB-FA900  < COTISB-FN900
                 ADD      1 TO   COTISB-FA900
                 SUBTRACT 1 FROM COTISB-FN900
              END-IF

      **************************************************************
      * ALIMENTATION DE LA ZONE DE LINK RETOUR                     *
      *                                                            *
      **************************************************************
              MOVE COTISB-CLE         TO RETOURB-AIDFIC
              MOVE COTISB-ANUPRO      TO RETOURB-ANUPRO
              MOVE COTISB-ACODB       TO RETOURB-CCOBNB

      * COTISATIONS TF BATIE
      * COMMUNE
              MOVE COTISB-COTICOM     TO RETOURB-MCTCOM
      * DEPARTEMENT
              MOVE COTISB-COTIDEP     TO RETOURB-MCTDEP
      * SYNDICAT DE COMMUNE
              MOVE COTISB-COTISYN     TO RETOURB-MCTSYN
      * EPCI
              MOVE COTISB-COTICU      TO RETOURB-MCTCU
      * GEMAPI
              MOVE COTISB-MCOGE3      TO RETOURB-MCOGE3
      * TASA
              MOVE COTISB-MCOTA3      TO RETOURB-MCOTA3
      * TSE 1
              MOVE COTISB-COTITSEN(1) TO RETOURB-MCBT13(1)
      * TSE 2
              MOVE COTISB-COTITSEN(2) TO RETOURB-MCBT13(2)
      * AMALGAME TSE 1 + TSE 2 + TASA
              MOVE COTISB-MCBTSA      TO RETOURB-MCBTSA
      * TEOMI
              MOVE COTISB-COTIS-OMI   TO RETOURB-MVLTIM
      * ORDURES MENAGERES
              PERFORM VARYING IND FROM 1 BY 1 UNTIL IND > 6
                 MOVE COTISB-GTAUOM(IND)   TO RETOURB-GTAUOM(IND)
                 MOVE COTISB-COTIS-OM(IND) TO RETOURB-MCTOM(IND)
              END-PERFORM
      * AMALGAME ORDURES MENAGERES + TEOMI
              MOVE W-TOTCOTOM         TO RETOURB-TCTOM

      * COTISATION TF BATIE HORS FRAIS (COTISATION BRUTE)
              COMPUTE RETOURB-TCTHFR = W-TOTCOT3 + W-TOTCOT8
                                                 + W-TOTCOT9

      * FRAIS DE LA FDL
      * FRAIS A 3%
              MOVE COTISB-FA300       TO RETOURB-MFA300
              MOVE COTISB-FN300       TO RETOURB-MFN300
      * FRAIS A 8%
              MOVE COTISB-FA800       TO RETOURB-MFA800
              MOVE COTISB-FN800       TO RETOURB-MFN800
      * FRAIS A 9%
              MOVE COTISB-FA900       TO RETOURB-MFA900
              MOVE COTISB-FN900       TO RETOURB-MFN900

      * ALIMENTATION TOTAL DES FRAIS
              COMPUTE RETOURB-TCTFRA = COTISB-FA300 + COTISB-FN300
                                     + COTISB-FA800 + COTISB-FN800
                                     + COTISB-FA900 + COTISB-FN900

      * ALIMENTATION TOTAL DU
              COMPUTE RETOURB-TCTDU = RETOURB-TCTHFR
                                    + RETOURB-MFA300  + RETOURB-MFN300
                                    + RETOURB-MFA800  + RETOURB-MFN800
                                    + RETOURB-MFA900  + RETOURB-MFN900

      **************************************************************
      * FIN DU IF CR NOT > 0                                       *
      **************************************************************
           END-IF

      **************************************************************
      *          RETOUR MAJIC2                                     *
      **************************************************************
           MOVE RETOURB TO RETOURM
           MOVE CR TO CRM MOVE RC TO RCM
           GOBACK
           .
       END PROGRAM EFITA3B8.
