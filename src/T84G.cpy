      *-----------------------------------------------------------
      *    ARTICLE EPCI OU SYNDICAT OM OU GROUPEMENT TSE DU TAUDIS
      *
      *    ANNEE 2018. LONGUEUR T800 + T84G = 3000
      *
      *-----------------------------------------------------------
             03 DONNEES-EPCI-OM-GRPT.
      * LETTRE ARTICLE. 'E' POUR EPCI,
      *                 'O' POUR SYND OM,
      *                 'G' POUR GROUPEMENT TSE
               10 'X'-FILLER PIC X.
               10 'X'-DLETAR PIC X.
      * LIBELLE
               10 'X'-FILLER PIC X.
               10 'X'-DLIGC  PIC X(65).
      * OPTION DE COPIE DE ROLE
               10 'X'-FILLER PIC X.
               10 'X'-GROGC  PIC X.
      * SIREN
               10 'X'-FILLER PIC X.
               10 'X'-DNUSRN PIC X(9).
      * SIRET
               10 'X'-FILLER PIC X.
               10 'X'-DSIREG PIC X(14).
      * TOP INTEGRATION FUSION OU RATTACHEMENT DE EPCI BATI (O-N)
               10 'X'-FILLER PIC X.
               10 'X'-GTOGRB PIC X.
      * TOP INTEGRATION FUSION OU RATTACHEMENT DE EPCI NON BATI (O-N)
               10 'X'-FILLER PIC X.
               10 'X'-GTOGRN PIC X.
      * TAUX DE L'EPCI BATI (TAUX 1)
               10 'X'-FILLER PIC X.
               10 'X'-PTBGRB PIC 9(4)V9(6).
      * TAUX DE L'EPCI NON BATI (TAUX 1)
               10 'X'-FILLER PIC X.
               10 'X'-PTNGRN PIC 9(4)V9(6).
      * TAUX DE L'EPCI BATI (TAUX 2)
               10 'X'-FILLER PIC X.
               10 'X'-PTBGRB2 PIC 9(4)V9(6).
      * TAUX DE L'EPCI NON BATI (TAUX 2)
               10 'X'-FILLER PIC X.
               10 'X'-PTNGRN2 PIC 9(4)V9(6).
      * EPCI DE TYPE EPT (O OU BLANC)
               10 'X'-FILLER PIC X.
               10 'X'-GTOEPT PIC X.
      * EPCI DE TYPE MGP (O OU BLANC)
               10 'X'-FILLER PIC X.
               10 'X'-GTOMGP PIC X.
      * TOP EPCI ISSU DE FUSION
               10 'X'-FILLER PIC X.
               10 'X'-GTOFUS PIC X.
      * ANNEE DE CREATION DE EPCI
               10 'X'-FILLER PIC X.
               10 'X'-JANCRE PIC X(4).
      * ADRESSE EMAIL (PARTIE GAUCHE ET DROITE)
               10 'X'-FILLER PIC X.
               10 'X'-VMAILG PIC X(50).
               10 'X'-VMAILD PIC X(50).
      * LIBRE
               10 'X'-FILLER PIC X(2733).
