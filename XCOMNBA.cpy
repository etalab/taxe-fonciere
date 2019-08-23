              10          'X'-CCOBNB PICTURE X(1).
      *                             /CODE BATI / NON-BATI
              10          'X'-AIDFIC.
      *                             /IDENTIFIANT DU FICHIER
               15         'X'-DAN PICTURE 9(4).
      *                             /ANNEE IMPOSITION
               15         'X'-AC3DIR.
      *                             /CODE DEPARTEMENT DIRECTION
                20        'X'-CC2DEP PICTURE X(2).
      *                             /CODE DEPARTEMENT
                20        'X'-CCODIR PICTURE X(1).
      *                             /CODE DIRECTION
               15         'X'-CCOCOM PICTURE X(3).
      *                             /CODE COMMUNE MAJIC2
               15         'X'-DSRPAR PICTURE X(1).
      *                             /SERIE ROLE PARCELLE
              10          'X'-ANUPRO.
      *                             /NUM COMPTE PROPRIETAIRE
               15         'X'-CGROUP PICTURE X(1).
      *                             /CODE GROUPE PROPRIETAIRE
               15         'X'-NNUPRO PICTURE 9(5).
      *                             /NUM COMPTE PROPRIETAIRE
              10          'X'-A0011.
      *                             /GROUPE 11C
               15         'X'-GTOTAU PICTURE X
                               OCCURS 011.
      *                             /INDICATEUR TAUX SERVI
              10          'X'-ABANB.
      *                             /BASES NON BATI
               15         'X'-MBACOM PICTURE S9(10).
      *                             /BASE COMMUNE
               15         'X'-MBADEP PICTURE S9(10).
      *                             /BASE DEPARTEMENT
               15         'X'-MBAREG PICTURE S9(10).
      *                             /BASE REGION
               15         'X'-MBASYN PICTURE S9(10).
      *                             /BASE SYNDICAT ET DISTRICT SANS FP
               15         'X'-MBACU PICTURE S9(10).
      *                             /BASE CU/DFP/AGGLOMERATION NOUVELLE
               15         'X'-MBATSE PICTURE S9(10).
      *                             /BASE TSE
               15         'X'-MBNT13 PICTURE S9(10)
                               OCCURS 002.
      *                             /BASE NON BATI TSE EPF 1  APRES
               15         'X'-MBACA PICTURE S9(10).
      *                             /BASE CHAMBRE D'AGRICULTURE
               15         'X'-MBABAP PICTURE S9(10).
      *                             /BASE BAPSA
               15         'X'-MBACAA PICTURE S9(10).
      *                             /BASE CAAA
               15         'X'-MBAPOS PICTURE S9(10).
      *                             /BASE MAJORATION TERRAIN CONSTRUCT
              10          'X'-ABAJAG.
      *                             /BASES JEUNES AGRICULTEURS
               15         'X'-MBJCOM PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - COMMUNE
               15         'X'-MBJSYN PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - SYNDICAT
               15         'X'-MBJCU PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - CU
               15         'X'-MBJTSE PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - TSE
               15         'X'-MBJT13 PICTURE S9(10)
                               OCCURS 002.
      *                             /BASE JEUNE AGRICULT TSE EPF 1  APRES
               15         'X'-MBJDEP PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - DEPARTEMENT
               15         'X'-MB1PRE PICTURE S9(10).
      *                             /BASE DEPARTEMENTALE PRES
               15         'X'-MBJPRE PICTURE S9(10).
      *                             /BASE JEUNE AGRI/PRES   - DEPARTEMENT
               15         'X'-MBJECO PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - ETAT COM
               15         'X'-MBJESY PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - ETAT SYN
               15         'X'-MBJEIC PICTURE S9(10).
      *                             /BASE JEUNE AGRICULTEUR - ETAT CU
              10          'X'-MBAGE3 PICTURE S9(10).
      *                             /BASE GEMAPI
              10          'X'-CCOIFP PICTURE X(3).
      *                             /CODE commune absorbee
              10          'X'-CCPPER PICTURE X(3).
      *                             /CODE TRESORERIE
              10          'X'-FILLER PICTURE X(315).
