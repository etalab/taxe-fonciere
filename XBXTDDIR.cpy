              10          'X'-AIDFIC.
      *                             /IDENTIFIANT DU FICHIER
               15         'X'-JAN PICTURE 9(4).
      *                             /ANNEE
               15         'X'-DEPDIR.
      *                             /zone groupe (dept + dir)
                20        'X'-CODEP PICTURE X(2).
      *                             /code departement
                20        'X'-CODIR PICTURE X(1).
      *                             /code direction
               15         'X'-CCOCOM PICTURE X(3).
      *                             /CODE COMMUNE MAJIC2
               15         'X'-CCOIFP PICTURE X(3).
      *                             /CODE commune absorbee
              10          'X'-ADTSEG.
      *                             /DONNEES DU SEGMENT
               15         'X'-CCOENR PICTURE X(2).
      *                             /CODE ENREGISTREMENT
               15         'X'-XDDAY6 PICTURE X(6).
      *                             /DATE DU JOUR SUR 6 CARACTERES
               15         'X'-TAUDEP-B PICTURE 9(4)V9(6).
      *                             /taux bati departement
               15         'X'-TAUREG-B PICTURE 9(4)V9(6).
      *                             /taux bati region
               15         'X'-PTBTAS PICTURE 9(4)V9(6).
      *                             /taux bati TASA
               15         'X'-TAUDEP-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB DEPARTEMENT
               15         'X'-TAUREG-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB REGION et TSE IDF
               15         'X'-TAUCHAGR-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB CHAMBRE AGRICULTURE
               15         'X'-TAUBAP405-NB PICTURE 9(2)V9(2).
      *                             /TAUX BAPSA NON AGRICOLE (4,05)
               15         'X'-TAUSMAGR-NB PICTURE 9(4)V9(6).
      *                             /taux chambre agriculture communal
               15         'X'-JDEJA
                               OCCURS 005.
      *                             /zone groupe ja (JDEINS+JDERIM)
                20        'X'-JDEINS PICTURE 9(4).
      *                             /ANNEE INSTALLATION JA DEPARTEMENT
                20        'X'-JDERIM PICTURE 9(4).
      *                             /ANNEE RETOUR IMPOSITION DEPARTEMENT
               15         'X'-FILLER PICTURE X(9).
               15         'X'-ACOETS PICTURE X(4)
                               OCCURS 005.
      *                             /CODE ORGANISME BENEFICIAIRE TSE
               15         'X'-NBTSE PICTURE 9(2).
      *                             /NOMBRE DE TSE SUR LA DSF
               15         'X'-PTBDRB PICTURE 9(4)V9(6).
      *                             /taux bati dept rebase
               15         'X'-DSITAS PICTURE X(14).
      *                             /NUMERO SIRET REG BENEFICIAIRE TASA
               15         'X'-GROTAS PICTURE X(1).
      *                             /OPTION COPIE ROLE TASA
               15         'X'-DSIRED PICTURE X(14).
      *                             /NUMERO SIRET DIRECTION
               15         'X'-DSICA PICTURE X(14).
      *                             /NUMERO SIRET Ch Agr
               15         'X'-FILLER PICTURE X(179).
               15         'X'-DNUURC PICTURE X(2).
      *                             /NUM UNITE REGROUPEMENT CDIF ( UR )
