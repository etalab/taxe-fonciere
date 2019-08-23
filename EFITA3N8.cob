      *********************************************************
      * PROGRAMME EFITA3N8                                    *
      * LANGAGE COBOL                                         *
      *                                                       *
      * CE SOUS-PROGRAMME EST LA CALCULETTE DES COTISATIONS   *
      * NON BATIES DE TAXE FONCIERE DE L'ANNEE 2018.          *
      *                                                       *
      *********************************************************


       ID DIVISION.
       PROGRAM-ID. EFITA3N8.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***
       01  SLATVARS              PIC X(122)                 VALUE 'SLAT
      -    'VARS START: DATEUPD TIMEUPD PROGRAMMERNAME MODNAME LVNO UPNO
      -    ' DATA-SET-NAME-FOR-THE-LIBRARIAN-MASTER-FILESLAT VARS END'.

       01  VERSION PIC X(23) VALUE 'EFITA3N8 00 DU 13/03/18'.



      *
      * ZONES DE TRAVAIL POUR CALCUL COTIS ET FRAIS :
      * --------------------------------------------
      * TOTAUX COTIS
       01 W-TOT GLOBAL.
            05  W-TOTCOT3      PIC  S9(11) OCCURS 5.
            05  W-TOTCOT8      PIC  S9(11) OCCURS 5.
            05  W-TOTCOT9      PIC  S9(11) OCCURS 5.

      * ZONE UTILISEE POUR LA VENTILATION DES FRAIS :
       01 W-FRAIS-A-REPARTIR     PIC  S9(10).


      * CONSTANTES
      * ----------
       01  W-F300FRS             PIC  9V9999.
       01  W-F300ARN             PIC  9V9999.
       01  W-F800FRS             PIC  9V9999.
       01  W-F800ARN             PIC  9V9999.
       01  W-F900FRS             PIC  9V9999.
       01  W-F900ARN             PIC  9V9999.
       01  W-FPROCAAA            PIC  9V9999.
       01  W-FARCAAA             PIC  9V9999.
       01  W-DFIXCAAA-P          PIC  S9(5).
       01  W-DFIXCAAA-N          PIC  S9(5).
       01  W-LIMBASCAAA-P        PIC  S9(2).
       01  W-LIMBASCAAA-N        PIC  S9(2).

      * VARIABLES D'AGREGATION
       01  W-COTDEGJA            PIC  S9(10).
       01  W-COTIS-BRUTE         PIC  S9(12).

      *
      *   BASES RECONSTITUEES
      *   -------------------
       01 BASENB.
          02 EL-BASENB OCCURS 5.
          COPY XBASNB   REPLACING 'X' BY BASENB.

      * ZONES GLOBALES
       01  COMNONBAT GLOBAL.
           COPY XCOMNBA  REPLACING 'X' BY COMNONBA.

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

       01  ZES.
             05 ZESTAUX PIC X(400) OCCURS 7.

      * ZONES INTERMEDIAIRES
       01 COTISNB GLOBAL.
          02 EL-COTISNB OCCURS 5.
           COPY XCOTNB    REPLACING 'X' BY COTISNB.

      * RETOUR
       01  RETOURNB GLOBAL.
           COPY XRETNB    REPLACING 'X' BY RETOURNB.

      * CODES RETOUR
       01  CR                       PIC 99 GLOBAL.
       01  RC                       PIC 99 GLOBAL.

      /
       LINKAGE SECTION.
      * --------------
      * DESCRIPTION DES PARAMETRES
      *     ZONE D'APPEL
       01  COMNONBAM PIC X(600).
      *     RETOUR DES COTISATIONS CALCULEES
       01  RETOURNBM PIC X(600).
      *     RETOUR DES CODES ANOMALIES
       01  CRM                      PIC 99.
       01  RCM                      PIC 99.
      *     PARM INDIQUANT QUI APPELLE : 'M' POUR CROISIC SINON MAJIC
       01  PARM                     PIC X.
      /
       PROCEDURE DIVISION USING COMNONBAM RETOURNBM  CRM RCM PARM.
      *=======================================================

      ***********************************************************
      * INITIALISATIONS                                         *
      ***********************************************************

           INITIALIZE      RETOURNB BASENB COTISNB
           MOVE 0   TO  CR   RC
           MOVE COMNONBAM TO COMNONBAT
           MOVE  0.0300   TO        W-F300FRS
           MOVE  0.0100   TO        W-F300ARN
           MOVE  0.0800   TO        W-F800FRS
           MOVE  0.0440   TO        W-F800ARN
           MOVE  0.0900   TO        W-F900FRS
           MOVE  0.0540   TO        W-F900ARN
           MOVE  0.0781   TO        W-FPROCAAA
           MOVE  0.0458   TO        W-FARCAAA
           MOVE   2       TO        W-DFIXCAAA-P
           MOVE  -2       TO        W-DFIXCAAA-N
           MOVE   8       TO        W-LIMBASCAAA-P
           MOVE  -8       TO        W-LIMBASCAAA-N



      ***********************************************************
      * VERIFICATION DES PARAMETRE ISSUS DE L'APPEL             *
      ***********************************************************

      * VERIFICATION DU CODE ARTICLE. LA ZONE CCOBNB DOIT ETRE
      * VALORISEE A 1 (ART NON BATI)
           IF  COMNONBA-CCOBNB NOT =  1
              MOVE   12      TO        CR
              MOVE    1      TO        RC
           END-IF

      * VERIFICATION DE L'ANNEE D'IMPOSITION
           IF  COMNONBA-DAN  = '2018'
              CONTINUE
           ELSE
              MOVE   12      TO        CR
              MOVE   2       TO        RC
           END-IF

      * VERIFICATION DE LA NUMERICITE DES BASES D'IMPOSITION
           IF COMNONBA-MBACOM     NOT NUMERIC OR
              COMNONBA-MBADEP     NOT NUMERIC OR
              COMNONBA-MBASYN     NOT NUMERIC OR
              COMNONBA-MBACU      NOT NUMERIC OR
              COMNONBA-MBAGE3     NOT NUMERIC OR
              COMNONBA-MBNT13(1)  NOT NUMERIC OR
              COMNONBA-MBNT13(2)  NOT NUMERIC OR
              COMNONBA-MBACA      NOT NUMERIC OR
              COMNONBA-MBACAA     NOT NUMERIC OR
              COMNONBA-MBJCOM     NOT NUMERIC OR
              COMNONBA-MBJSYN     NOT NUMERIC OR
              COMNONBA-MBJCU      NOT NUMERIC OR
              COMNONBA-MBJT13(1)  NOT NUMERIC OR
              COMNONBA-MBJT13(2)  NOT NUMERIC OR
              COMNONBA-MBJDEP     NOT NUMERIC OR
              COMNONBA-MB1PRE     NOT NUMERIC OR
              COMNONBA-MBJPRE     NOT NUMERIC OR
              COMNONBA-MBJECO     NOT NUMERIC OR
              COMNONBA-MBJESY     NOT NUMERIC OR
              COMNONBA-MBJEIC     NOT NUMERIC
              MOVE   12      TO        CR
              MOVE   11      TO        RC
           END-IF


      * ON NE RENTRE DANS LA CALCULETTE QUE SI LE CR NON POSITIF
           IF CR NOT > ZERO


      **************************************************************
      * RECUPERATION DES TAUX :                                    *
      *                                                            *
      * LES TAUX NE SONT PAS RECUPERES SI L'IMPOSITION NON BATIE   *
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
             WHEN COMNONBA-DAN     = TAU-R-JAN    ALSO
                  COMNONBA-AC3DIR  = TAU-R-DEPDIR ALSO
                  COMNONBA-CCOCOM  = TAU-R-CCOCOM ALSO
                  COMNONBA-CCOIFP  = TAU-R-CCOIFP
                               CONTINUE
             WHEN OTHER
                IF   PARM = 'M'
                    CALL 'EFITAUX2' USING
      *             PARM ENTREE (ANNEE DIRECTION COMMUNE IFP TRESORERIE)
                      COMNONBA-DAN
                      COMNONBA-AC3DIR
                      COMNONBA-CCOCOM
                      COMNONBA-CCOIFP
                      COMNONBA-CCPPER
      *             CODES RETOUR
                      CR  RC
      *             DONNEES RENDUES
                      ZES
                    ON EXCEPTION MOVE 24 TO CR MOVE 01 TO RC
                    END-CALL
               ELSE
                    CALL 'FMSTAU2' USING
      *             PARM ENTREE (ANNEE DIRECTION COMMUNE IFP)
                      COMNONBA-DAN
                      COMNONBA-AC3DIR
                      COMNONBA-CCOCOM
                      COMNONBA-CCOIFP
      *             CODES RETOUR
                      CR  RC
      *             DONNEES RENDUES
                      ZES
                    ON EXCEPTION MOVE 24 TO CR MOVE 01 TO RC
                    END-CALL

                    MOVE ZESTAUX(4)       TO  TAU-R-ROL1
                    MOVE TAU-R1-TAUTSE-NB TO  TAU-R1-TAUTSE-NB
                    MOVE TAU-R1-PNBTGP    TO  TAU-R1-PNBTGP
                    MOVE TAU-R-ROL1       TO  ZESTAUX(4)
                END-IF

               MOVE ZESTAUX(1) TO TAU-E-AN
               MOVE ZESTAUX(2) TO TAU-D-DEP
               MOVE ZESTAUX(3) TO TAU-C-COM
               MOVE ZESTAUX(4) TO TAU-R-ROL
             END-EVALUATE




      *************************************************************
      *     CONSTITUTION DE BASENB ET COTISNB                     *
      *                                                           *
      * BASENB ET COTISNB SONT CONSTITUES D'UNE TABLE DE 5 POSTES *
      * UTILISES PARTIELLEMENT                                    *
      * POSTE 1 : CONTIENT LES ELEMENTS DE L'IMPOSITION NON BATIE *
      * POSTE 2 : N'EST PLUS UTILISE                              *
      * POSTE 3 : N'EST PLUS UTILISE                              *
      * POSTE 4 : CONTIENT LES ELEMENTS DU DEGREVEMENT JEUNES AGR *
      * POSTE 5 : N'EST PLUS UTILISE                              *
      *                                                           *
      * LES POSTES 2, 3 ET 5 CONTENAIENT AUPARAVANT DES ELEMENTS  *
      * QUI ONT ETE AGGREGES DANS LES POSTES 1 ET 4. LA STRUCTURE *
      * EN 5 POSTES A ETE GARDEE POUR NE PAS FAIRE DE MAINTENANCE *
      * SUR LES DIFFERENTES APPLICATIONS APPELELANT CE SOUS PRG   *
      *                                                           *
      *************************************************************

      ***********************************************************
      * ALIMENTATION DU POSTE 1 CORRESPONDANT AUX ELEMENTS DE   *
      *                         L'IMPOSITION NON BATIE          *
      * CE POSTE D'IMPOSITION DES BASES NETTES ( I BN ) EST     *
      * TOUJOURS CREE.                                          *
      * C'EST DANS CE SEUL POSTE OU L'ON TROUVERA LES TAUX      *
      * DES BASES PEUVENT ETRE A NULLES                         *
      *                                                         *
      ***********************************************************

              MOVE COMNONBA-AIDFIC     TO     BASENB-CLE(1)
                                              COTISNB-CLE(1)
              MOVE COMNONBA-ANUPRO     TO     BASENB-ANUPRO(1)
                                              COTISNB-ANUPRO(1)
              MOVE COMNONBA-CCOBNB     TO     BASENB-ACODNB(1)
                                              COTISNB-ACODNB(1)

              MOVE  'I'   TO   BASENB-IMPOT(1) COTISNB-IMPOT(1)
              MOVE  'BN'  TO   BASENB-GNEXPS(1) COTISNB-GNEXPS(1)

      *
      *   ALIMENTATION DES TAUX
      *

      * TAUX COMMUNAL
              MOVE  TAU-R-TAUCOM-NB        TO   BASENB-TAUCOM(1)
                                                COTISNB-TAUCOM(1)

      * TAUX SYNDICAT COMMUNAL
              MOVE  TAU-R-TAUSYNDSFP-NB    TO   BASENB-TAUSYN(1)
                                                COTISNB-TAUSYN(1)

      * TAUX EPCI
              MOVE  TAU-R-TAUCUDFPVN-NB    TO   BASENB-TAUCU(1)
                                                COTISNB-TAUCU(1)

      * TAUX GEMAPI
              MOVE  TAU-R-PNBGEM           TO   BASENB-TAUGEM(1)
                                                COTISNB-TAUGEM(1)

      * TAUX TSE 1
              MOVE  TAU-R-TAUTSE-NB        TO   BASENB-TAUTSEN(1 1)
                                                COTISNB-TAUTSEN(1 1)

      * TAUX TSE 2
              MOVE  TAU-R-PNBTGP           TO   BASENB-TAUTSEN(1 2)
                                                COTISNB-TAUTSEN(1 2)

      * TAUX TAXE ADDITIONNELLE
              MOVE  TAU-R-PNBTXA           TO   BASENB-TAUTXADD(1)
                                                COTISNB-TAUTXADD(1)

      * TAUX CHAMBRE AGRICULTURE
              MOVE  TAU-D-TAUCHAGR-NB      TO   BASENB-TAUCHAGR(1)
                                                COTISNB-TAUCHAGR(1)

      * TAUX CAAA
              MOVE  TAU-R-PNBCAA           TO   BASENB-TAUCAAA(1)
                                                COTISNB-TAUCAAA(1)

      * TAUX CHAMBRE CONSULAIRE ST MARTIN
              MOVE  TAU-D-TAUSMAGR-NB      TO   BASENB-TAUSMAGR(1)
                                                COTISNB-TAUSMAGR(1)

      *
      *  ALIMENTATION DES BASES
      *

      * BASE COMMUNALE
              MOVE COMNONBA-MBACOM        TO   BASENB-BNBCOM(1)
                                               COTISNB-BNBCOM(1)

      * BASE TAXE ADDITIONNELLE
              MOVE COMNONBA-MBADEP        TO   BASENB-BNBDEP(1)
                                               COTISNB-BNBDEP(1)

      * BASE SYNDICAT COMMUNAL
              MOVE COMNONBA-MBASYN        TO   BASENB-BNBSYN(1)
                                               COTISNB-BNBSYN(1)

      * BASE EPCI
              MOVE COMNONBA-MBACU         TO   BASENB-BNBCU(1)
                                               COTISNB-BNBCU(1)

      * BASE GEMAPI
              MOVE COMNONBA-MBAGE3        TO   BASENB-BNBGEM(1)
                                               COTISNB-BNBGEM(1)

      * BASE TSE 1
              MOVE COMNONBA-MBNT13(1)     TO   BASENB-BNBTSEN(1 1)
                                               COTISNB-BNBTSEN(1 1)

      * BASE TSE 2
              MOVE COMNONBA-MBNT13(2)     TO   BASENB-BNBTSEN(1 2)
                                               COTISNB-BNBTSEN(1 2)

      * BASE CHAMBRE D'AGRICULTURE
              MOVE COMNONBA-MBACA         TO   BASENB-BNBAGR(1)
                                               COTISNB-BNBAGR(1)

      * BASE CAAA
              MOVE COMNONBA-MBACAA        TO   BASENB-BNBCAA(1)
                                               COTISNB-BNBCAA(1)

      *
      * CALCUL DES COTISATION DE TAXE FONCIERE NON BATIE
      *

      * COTISATION COMMUNALE
              COMPUTE  COTISNB-COTICOM (1) ROUNDED =
                       COTISNB-BNBCOM(1) * COTISNB-TAUCOM(1) / 100

      * COTISATION TAXE ADDITIONNELLE
              COMPUTE  COTISNB-COTIDEP (1) ROUNDED =
                       COTISNB-BNBDEP(1) * COTISNB-TAUTXADD(1) / 100

      * COTISATION SYNDICAT COMMUNAL
              COMPUTE  COTISNB-COTISYN (1) ROUNDED =
                       COTISNB-BNBSYN(1) * COTISNB-TAUSYN(1) / 100

      * COTISATION EPCI
              COMPUTE  COTISNB-COTICU  (1) ROUNDED =
                       COTISNB-BNBCU (1) * COTISNB-TAUCU (1) / 100

      * COTISATION GEMAPI
              COMPUTE  COTISNB-MCOGE3 (1)  ROUNDED =
                       COTISNB-BNBGEM(1) * COTISNB-TAUGEM(1) / 100

      * COTISATION TSE 1
              COMPUTE  COTISNB-COTITSEN (1 1) ROUNDED =
                   COTISNB-BNBTSEN(1 1) * COTISNB-TAUTSEN(1 1) / 100

      * COTISATION TSE 2
              COMPUTE  COTISNB-COTITSEN (1 2) ROUNDED =
                   COTISNB-BNBTSEN(1 2) * COTISNB-TAUTSEN(1 2) / 100

      * COTISATION AMALGAMEE TSE1 + TSE 2
              COMPUTE  COTISNB-MCNTSA  (1) ROUNDED =
                   COTISNB-COTITSEN (1 1) + COTISNB-COTITSEN (1 2)

      * COTISATION CHAMBRE CONSULAIRE ST MARTIN
              COMPUTE  COTISNB-COTISMAG(1) ROUNDED =
                   COTISNB-BNBAGR(1) * COTISNB-TAUSMAGR(1) / 100

      * COTISATION CHAMBRE D'AGRICULTURE
              COMPUTE  COTISNB-COTIAGR (1) ROUNDED =
                   COTISNB-BNBAGR(1) * COTISNB-TAUCHAGR(1) / 100

      * COTISATION DROIT FIXE CAAA
      *    APPLICATION DU DROIT FIXE : CE DROIT FIXE NE S'APPLIQUE QUE
      *                                DANS LE DEPARTEMENT 57 ET SI LA
      *                                BASE CAAA > 8 EUROS.
      *    ATTENTION AUX BASES NEGATIVES POUR APPLIQUER LES SEUILS
              IF COTISNB-CCODEP(1)  = '57'
                 IF COTISNB-BNBCAA(1) > 0
                    IF COTISNB-BNBCAA(1) < W-LIMBASCAAA-P
                        CONTINUE
                    ELSE
                        MOVE W-DFIXCAAA-P TO COTISNB-DFIXCAA(1)
                    END-IF
                 END-IF

                 IF COTISNB-BNBCAA(1) NEGATIVE
                    IF COTISNB-BNBCAA(1) > W-LIMBASCAAA-N
                        CONTINUE
                    ELSE
                        MOVE W-DFIXCAAA-N TO COTISNB-DFIXCAA(1)
                    END-IF
                 END-IF
              END-IF

      * COTISATION DROIT PROPORTIONNEL CAAA
      * SI LE TAUX DROIT PROPORTIONNEL CAAA DIFFERENT DE 0
              IF COTISNB-TAUCAAA(1) NOT = 0
                 COMPUTE  COTISNB-DPROCAA(1) ROUNDED =
                       COTISNB-BNBCAA(1) * COTISNB-TAUCAAA(1) / 100
              END-IF


      *
      * CALCUL DES FRAIS
      *

      *    DETERMINATION DE LA BASE DE CALCUL DES FRAIS A 3% :
              COMPUTE W-TOTCOT3 (1) = COTISNB-COTICOM(1)
                                    + COTISNB-COTICU(1)
                                    + COTISNB-COTIDEP(1)
                                    + COTISNB-MCOGE3(1)

      *    DETERMINATION DE LA BASE DE CALCUL DES FRAIS A 8% :
              COMPUTE W-TOTCOT8 (1) = COTISNB-COTISYN(1)
                                    + COTISNB-COTIAGR(1)

      *    DETERMINATION DE LA BASE DE CALCUL DES FRAIS A 9% :
              COMPUTE W-TOTCOT9 (1) = COTISNB-COTITSEN (1 1)
                                    + COTISNB-COTITSEN (1 2)

      * CALCUL FRAIS 3%
      * (FRAIS ASSIETTE : 1% - FRAIS DGVT/NON VALEUR : 2%)
      *     ON CALCULE LES FRAIS D'ASSIETTE
              COMPUTE  COTISNB-FA300 (1)  ROUNDED   =
                       W-TOTCOT3 (1) * W-F300ARN
      *     ON CALCULE LES FRAIS TOTAUX
              COMPUTE  W-FRAIS-A-REPARTIR ROUNDED   =
                       W-TOTCOT3 (1) * W-F300FRS
      *     FRAIS DEGVT-NON VALEUR = FRAIS TOTAUX - FRAIS ASSIETTE
              COMPUTE  COTISNB-FN300 (1)            =
                       W-FRAIS-A-REPARTIR  -  COTISNB-FA300 (1)


      * CALCUL FRAIS 8%
      * (FRAIS ASSIETTE : 4,4% - FRAIS DGVT/NON VALEUR : 3,6%)
      *     ON CALCULE LES FRAIS D'ASSIETTE
              COMPUTE  COTISNB-FA800 (1)  ROUNDED   =
                       W-TOTCOT8 (1) * W-F800ARN
      *     ON CALCULE LES FRAIS TOTAUX
              COMPUTE  W-FRAIS-A-REPARTIR ROUNDED   =
                       W-TOTCOT8 (1) * W-F800FRS
      *     FRAIS DEGVT-NON VALEUR = FRAIS TOTAUX - FRAIS ASSIETTE
              COMPUTE  COTISNB-FN800 (1)            =
                       W-FRAIS-A-REPARTIR  -  COTISNB-FA800 (1)

      * CALCUL FRAIS 9%
      * (FRAIS ASSIETTE : 5,4% - FRAIS DGVT/NON VALEUR : 3,6%)
      *     ON CALCULE LES FRAIS D'ASSIETTE
              COMPUTE  COTISNB-FA900 (1)  ROUNDED   =
                       W-TOTCOT9 (1) * W-F900ARN
      *     ON CALCULE LES FRAIS TOTAUX
              COMPUTE  W-FRAIS-A-REPARTIR ROUNDED   =
                       W-TOTCOT9 (1) * W-F900FRS
      *     FRAIS DEGVT-NON VALEUR = FRAIS TOTAUX - FRAIS ASSIETTE
              COMPUTE  COTISNB-FN900 (1)            =
                       W-FRAIS-A-REPARTIR  -  COTISNB-FA900 (1)

      *    DANS CERTAINS CAS LES FRAIS D'ASSIETTE SONT INFERIEURS
      *    DE 1 EURO AUX FRAIS DE DEGREVEMENT ET NON VALEUR
      *    DANS CE CAS, ON REEQUILIBRE ARTIFICIELLEMENT AFIN QUE
      *    FRAIS ASSIETTE > FRAIS DNV
              IF COTISNB-FA800 (1) < COTISNB-FN800 (1)
                 ADD      1 TO   COTISNB-FA800 (1)
                 SUBTRACT 1 FROM COTISNB-FN800 (1)
              END-IF

              IF COTISNB-FA900 (1) < COTISNB-FN900 (1)
                 ADD      1 TO   COTISNB-FA900 (1)
                 SUBTRACT 1 FROM COTISNB-FN900 (1)
              END-IF

      * CALCUL DES FRAIS RELATIFS AUX DROITS PROPORTIONNELS CAAA A 7,81%
      *        (FRAIS ASSIETTE: 4,58% - FRAIS DGVT-NON VALEUR: 3,23%)
      *     ON CALCULE LES FRAIS D'ASSIETTE
              COMPUTE  COTISNB-FARC(1)     ROUNDED   =
                       COTISNB-DPROCAA(1)  *  W-FARCAAA
      *     ON CALCULE LES FRAIS TOTAUX
              COMPUTE  W-FRAIS-A-REPARTIR  ROUNDED   =
                       COTISNB-DPROCAA(1) *  W-FPROCAAA
      *     FRAIS DEGVT-NON VALEUR = FRAIS TOTAUX - FRAIS ASSIETTE
              COMPUTE  COTISNB-FRNVC(1)              =
                       W-FRAIS-A-REPARTIR   -  COTISNB-FARC(1)




      ***********************************************************
      * ALIMENTATION DU POSTE 4 CORRESPONDANT AUX ELEMENTS DU   *
      *                         DEGREVEMENT JEUNE AGRICULTEURS  *
      * CE POSTE D'IMPOSITION EST CREE AU BESOIN.               *
      *                                                         *
      * ATTENTION, LES TAUX PROVIENNENT DU POSTE 1              *
      *                                                         *
      ***********************************************************

              IF COMNONBA-MBJCOM  NOT = 0 OR
                 COMNONBA-MBJSYN  NOT = 0 OR
                 COMNONBA-MBJCU   NOT = 0 OR
                 COMNONBA-MBJECO  NOT = 0 OR
                 COMNONBA-MBJESY  NOT = 0 OR
                 COMNONBA-MBJEIC  NOT = 0


                MOVE COMNONBA-AIDFIC     TO   BASENB-CLE(4)
                                              COTISNB-CLE(4)
                MOVE COMNONBA-ANUPRO     TO   BASENB-ANUPRO(4)
                                              COTISNB-ANUPRO(4)
                MOVE COMNONBA-CCOBNB     TO   BASENB-ACODNB(4)
                                              COTISNB-ACODNB(4)

                MOVE  'G'      TO   BASENB-IMPOT(4)  COTISNB-IMPOT(4)
                MOVE  'JA'     TO   BASENB-GNEXPS(4) COTISNB-GNEXPS(4)

      *
      *  ALIMENTATION DES BASES
      *

      * BASE COMMUNALE DEGREVEMENT JA COLLECTIVITES
                MOVE   COMNONBA-MBJCOM  TO  BASENB-BNBCOM(4)
                                            COTISNB-BNBCOM(4)

      * BASE SYNDICAT COMMUNAL DEGREVEMENT JA COLLECTIVITE
                MOVE   COMNONBA-MBJSYN  TO  BASENB-BNBSYN(4)
                                            COTISNB-BNBSYN(4)

      * BASE EPCI DEGREVEMENT JA COLLECTIVITE
                MOVE   COMNONBA-MBJCU   TO  BASENB-BNBCU(4)
                                            COTISNB-BNBCU(4)

      * BASE COMMUNALE DEGREVEMENT JA ETAT
                MOVE   COMNONBA-MBJECO  TO  BASENB-MBJECO(4)
                                            COTISNB-MBJECO(4)

      * BASE SYNDICAT COMMUNAL DEGREVEMENT JA ETAT
                MOVE   COMNONBA-MBJESY  TO  BASENB-MBJESY(4)
                                            COTISNB-MBJESY(4)

      * BASE EPCI DEGREVEMENT JA ETAT
                MOVE   COMNONBA-MBJEIC  TO  BASENB-MBJEIC(4)
                                            COTISNB-MBJEIC(4)


      *
      *  CALCUL DU DEGREVEMENT JEUNES AGRICULTEURS
      *

      * DEGREVEMENT JA COMMUNAL PART COLLECTIVITES
                 COMPUTE  COTISNB-COTICOM (4) ROUNDED =
                          COTISNB-BNBCOM(4) * COTISNB-TAUCOM(1) / 100

      * DEGREVEMENT JA SYNDICAT COMMUNAL PART COLLECTIVITES
                 COMPUTE  COTISNB-COTISYN (4) ROUNDED =
                          COTISNB-BNBSYN(4) * COTISNB-TAUSYN(1) / 100

      * DEGREVEMENT JA EPCI PART COLLECTIVITES
                 COMPUTE  COTISNB-COTICU (4) ROUNDED =
                          COTISNB-BNBCU (4) * COTISNB-TAUCU (1) / 100

      * DEGREVEMENT JA COMMUNAL PART ETAT
                 COMPUTE  COTISNB-MCNJCO (4) ROUNDED =
                          COTISNB-MBJECO(4) * COTISNB-TAUCOM(1) / 100

      * DEGREVEMENT JA SYNDICAT COMMUNAL PART ETAT
                 COMPUTE  COTISNB-MCNJSY (4) ROUNDED =
                          COTISNB-MBJESY(4) * COTISNB-TAUSYN(1) / 100

      * DEGREVEMENT JA EPCI PART ETAT
                 COMPUTE  COTISNB-MCNJIC (4) ROUNDED =
                          COTISNB-MBJEIC( 4) * COTISNB-TAUCU(1) / 100

      * DEGVT JA ETAT AMALGAMEE (PART COMMUNALE + SYND COMMUNAL + EPCI)
                 COMPUTE  COTISNB-MCNJAE (4) = COTISNB-MCNJCO (4) +
                                               COTISNB-MCNJSY (4) +
                                               COTISNB-MCNJIC (4)


      *
      * CALCUL DES FRAIS RELATIFS AU DGVT JEUNES AGRICULTEURS
      *

      *    DETERMINATION DE LA BASE DE CALCUL DES FRAIS A 3% :
                 COMPUTE W-TOTCOT3  (4)  =  COTISNB-COTICOM (4) +
                                            COTISNB-COTICU  (4) +
                                            COTISNB-MCNJCO  (4) +
                                            COTISNB-MCNJIC  (4)

      *    DETERMINATION DE LA BASE DE CALCUL DES FRAIS A 8% :
                 COMPUTE W-TOTCOT8  (4)  =  COTISNB-COTISYN (4) +
                                            COTISNB-MCNJSY  (4)

      *   CALCUL DES FRAIS D'ASSIETTE AMALGAMES ( A 1% ET 4,4% )
                 COMPUTE  COTISNB-MFAJAE(4) ROUNDED   =
                   ( W-TOTCOT3(4) * W-F300ARN )  +
                   ( W-TOTCOT8(4) * W-F800ARN )
      *   CALCUL DES FRAIS TOTAUX AMALGAMES ( A 3% ET 8% )
                 COMPUTE  W-FRAIS-A-REPARTIR ROUNDED   =
                   ( W-TOTCOT3(4) * W-F300FRS )  +
                   ( W-TOTCOT8(4) * W-F800FRS )
      *   FRAIS DE DGVT ET NON VALEUR = FRAIS TOTAUX - FRAIS ASSIETTE
                 COMPUTE  COTISNB-MFNJAE(4) ROUNDED   =
                    W-FRAIS-A-REPARTIR  -  COTISNB-MFAJAE(4)

              END-IF



      **************************************************************
      * ALIMENTATION DE LA ZONE DE LINK RETOUR                     *
      *                                                            *
      **************************************************************

              MOVE   COTISNB-CLE(1)         TO RETOURNB-AIDFIC
              MOVE   COTISNB-ANUPRO(1)      TO RETOURNB-ANUPRO
              MOVE   COTISNB-ACODNB(1)      TO RETOURNB-CCOBNB

      * COTISATIONS TF NON BATIE
      *     COMMUNE
              MOVE    COTISNB-COTICOM(1)    TO RETOURNB-MCTCOM
      *     SYNDICAT COMMUNAL
              MOVE    COTISNB-COTISYN(1)    TO RETOURNB-MCTSYN
      *     TAXE ADDITIONNELLE
              MOVE    COTISNB-COTIDEP(1)    TO RETOURNB-MCTDEP
      *     EPCI
              MOVE    COTISNB-COTICU(1)     TO RETOURNB-MCTCU
      *     GEMAPI
              MOVE    COTISNB-MCOGE3(1)     TO RETOURNB-MCOGE3
      *     TSE 1
              MOVE    COTISNB-COTITSEN(1 1) TO RETOURNB-MCNT13(1)
      *     TSE 2
              MOVE    COTISNB-COTITSEN(1 2) TO RETOURNB-MCNT13(2)
      *     TSE AMALGAMEE (TSE 1 + TSE 2)
              MOVE    COTISNB-MCNTSA (1)    TO RETOURNB-MCNTSA
      *     CHAMBRE D'AGRICULTURE
              MOVE    COTISNB-COTIAGR(1)    TO RETOURNB-MCTCA
      *     CHAMBRE CONSULAIRE SAINT MARTIN (971127)
              MOVE    COTISNB-COTISMAG(1)   TO RETOURNB-MCTCAS
      *     DROIT PROPORTIONNEL CAAA
              MOVE    COTISNB-DPROCAA(1)    TO RETOURNB-MCTCAP
      *     DROIT FIXE CAAA
              MOVE    COTISNB-DFIXCAA(1)    TO RETOURNB-MCTCAD

      * FRAIS DE GESTION DE LA FDL
      *     FRAIS A 3%
              MOVE    COTISNB-FA300(1)      TO RETOURNB-MFA300
              MOVE    COTISNB-FN300(1)      TO RETOURNB-MFN300
      *     FRAIS RELATIFS A LA CAAA
              MOVE    COTISNB-FARC(1)       TO RETOURNB-MCFACA
              MOVE    COTISNB-FRNVC(1)      TO RETOURNB-MCFNVC
      *     FRAIS A 8%
              MOVE    COTISNB-FA800(1)      TO RETOURNB-MFA800
              MOVE    COTISNB-FN800(1)      TO RETOURNB-MFN800
      *     FRAIS A 9%
              MOVE    COTISNB-FA900(1)      TO RETOURNB-MFA900
              MOVE    COTISNB-FN900(1)      TO RETOURNB-MFN900

      * DEGREVEMENT JEUNES AGRICULTEURS
      *     DEGVT COMMUNE PART COLLECTIVITES LOCALES
              MOVE    COTISNB-COTICOM(4)    TO RETOURNB-MDJCOM
      *     DEGVT SYNDICAT COMMUNAL PART COLLECTIVITES LOCALES
              MOVE    COTISNB-COTISYN(4)    TO RETOURNB-MDJSYN
      *     DEGVT EPCI PART COLLECTIVITES LOCALES
              MOVE    COTISNB-COTICU(4)     TO RETOURNB-MDJCU
      *     DEGVT JA AMALGAME PART ETAT
              MOVE    COTISNB-MCNJAE(4)     TO RETOURNB-MCNJAE

      * FRAIS RELATIFS AU DEGREVEMENT JEUNES AGRICULTEURS
      *     FRAIS D'ASSIETTE
              MOVE    COTISNB-MFAJAE(4)     TO RETOURNB-MFAJ1E
      *     FRAIS DE DGVT NON VALEUR
              MOVE    COTISNB-MFNJAE(4)     TO RETOURNB-MFNJ1E



      * CALCUL ET ALIMENTATION DES DONNEES AGGREGEES
      *   SI ON TRAITE LA COMMUNE DE ST-MARTIN, ON AJOUTE
      *   LA COTISATION DE LA CHAMBRE CONSULAIRE AUX TOTAUX
              IF  COMNONBA-AC3DIR  = '971'
              AND COMNONBA-CCOCOM  = '127'
                 ADD COTISNB-COTISMAG(1) TO W-TOTCOT3 (1)
              END-IF

      *   TOUTES COTIS SANS LES FRAIS
              COMPUTE W-COTIS-BRUTE = W-TOTCOT3 (1)
                                    + W-TOTCOT8 (1)
                                    + W-TOTCOT9 (1)
                                    + COTISNB-DPROCAA(1)
                                    + COTISNB-DFIXCAA(1)

      *   TOTAL  DEG JA (AVEC   FRAIS)
              COMPUTE W-COTDEGJA = COTISNB-COTICOM(4)
                                 + COTISNB-COTISYN(4)
                                 + COTISNB-COTICU(4)
                                 + COTISNB-MCNJAE(4)
                                 + COTISNB-MFAJAE(4)
                                 + COTISNB-MFNJAE(4)

      *   ALIMENTATION COTISATION BRUTE (HORS FRAIS) - DGVT JA
              COMPUTE RETOURNB-TCTHFR ROUNDED = W-COTIS-BRUTE
                                              - W-COTDEGJA

      *   ALIMENTATION TOTAL DES FRAIS
              COMPUTE RETOURNB-TCTFRA         =  RETOURNB-MFA300
                                              +  RETOURNB-MFN300
                                              +  RETOURNB-MCFACA
                                              +  RETOURNB-MCFNVC
                                              +  RETOURNB-MFA800
                                              +  RETOURNB-MFN800
                                              +  RETOURNB-MFA900
                                              +  RETOURNB-MFN900

      *   ALIMENTATION TOTAL DU
              COMPUTE RETOURNB-TCTDU          = W-COTIS-BRUTE
                                              + RETOURNB-TCTFRA
                                              - W-COTDEGJA

      **************************************************************
      * FIN DU IF CR NOT > 0                                       *
      **************************************************************
           END-IF

      **************************************************************
      *          RETOUR                                            *
      **************************************************************
           MOVE RETOURNB TO RETOURNBM
           MOVE CR TO CRM MOVE RC TO RCM
           GOBACK
           .

       END PROGRAM EFITA3N8.
