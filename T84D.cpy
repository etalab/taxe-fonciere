      *-----------------------------------------------------------
      *   ARTICLE DIRECTION DU TAUDIS
      *
      *    ANNEE 2018. LONGUEUR T800 + T84D = 3000
      *
      *-----------------------------------------------------------
             03 DONNEES-DIRECTION.
      * LETTRE ARTICLE. 'D' POUR DIRECTION
               10 'X'-FILLER PIC X.
               10 'X'-DLETAR PIC X.
      * LIBELLE DIRECTION
               10 'X'-FILLER PIC X.
               10 'X'-DLIDIR PIC X(30).
      * DATE CREATION DU TAUDIS
               10 'X'-FILLER PIC X.
               10 'X'-JDACRE PIC X(8).
      * SIRET DEPARTEMENT
               10 'X'-FILLER PIC X.
               10 'X'-DSIRED PIC X(14).
      * NOMBRE DE COMMUNES SUR LA DIRECTION
               10 'X'-FILLER PIC X.
               10 'X'-NBCOM1 PIC 9(3).
      * ANNEE D'IMPOSITION (AAAA)
               10 'X'-FILLER PIC X.
               10 'X'-JANROL PIC 9(4).
      * ANNEE DE MER (AA)
               10 'X'-FILLER PIC X.
               10 'X'-JANMIR PIC X(2).
      * DATE CREATION / MODIFICATION DU BASEROLE (JJMMAAAA)
               10 'X'-FILLER PIC X.
               10 'X'-JBAROL PIC X(10).
      * DATE D'HOMOLOGATION
               10 'X'-FILLER PIC X.
               10 'X'-JDAHO1.
                 15 'X'-JSSHOM PIC 9(2).
                 15 'X'-JANHO1 PIC 9(2).
                 15 'X'-JMOHOM PIC 9(2).
                 15 'X'-JJRHOM PIC 9(2).
      * DATE DE MER DU DERNIER ROLE
               10 'X'-FILLER PIC X.
               10 'X'-JDAMI1 PIC 9(8).
      * DATE DE MAJORATION DU DERNIER ROLE
               10 'X'-FILLER PIC X.
               10 'X'-JDAMJO PIC 9(8).
      * DERNIER NUMERO DE LOT TRAITE
               10 'X'-FILLER PIC X.
               10 'X'-DDRLTF PIC 9.
      * DERNIER NUMERO DE ROLE
               10 'X'-FILLER PIC X.
               10 'X'-DDRROL PIC 9(3).
      * TYPE DE ROLE. RG, RD, RR.
               10 'X'-FILLER PIC X.
               10 'X'-CTYROL PIC XX.
      * DERNIER LOT + NUM ROLE GENERAL INITIAL
               10 'X'-FILLER PIC X.
               10 'X'-DHMRG.
                 15 'X'-DDRHMG PIC 9.
                 15 'X'-DDRROG PIC 9(3).
      * DERNIER LOT + NUM ROLE GENERAL DIFFERE
               10 'X'-FILLER PIC X.
               10 'X'-DHMRD.
                 15 'X'-DDRHMD PIC 9.
                 15 'X'-DDRROD PIC 9(3).
      * DERNIER LOT + NUM ROLE GENERAL RECONFECTIONNE
               10 'X'-FILLER PIC X.
               10 'X'-DHMRR.
                 15 'X'-DDRHMR PIC 9.
                 15 'X'-DDRROR PIC 9(3).
      * CODE VALIDATION EFICT. 'V' = VALID, '' = NON
               10 'X'-FILLER PIC X.
               10 'X'-GCOVEF PIC X.
      * ORIGINE VALIDATION EFICT. 'C' = CLIST, '' = BATCH
               10 'X'-FILLER PIC X.
               10 'X'-GORVEF PIC X.
      * CODE VALIDATION FDL. '1' = VALID, '' = NON
               10 'X'-FILLER PIC X.
               10 'X'-GCOFDL PIC X.
      * CODE PASSAGE FDL. 1, 2, 3,...
               10 'X'-FILLER PIC X.
               10 'X'-CCOFDL PIC X.
      * TOUTES COMMUNES TAXEES. '*' OU BLANC
               10 'X'-FILLER PIC X.
               10 'X'-GTACOM PIC X.
      * TOUTES COMMUNES PARIS TAXEES. '*' OU BLANC
               10 'X'-FILLER PIC X.
               10 'X'-GTACO2 PIC X.
      * CODE CONTENTIEUX (IS) OU TAXATION. C = CONTENTIEUX, T = TAXATION
               10 'X'-FILLER PIC X.
               10 'X'-GTOCTX PIC X.
      * TOP ROLE PRIMITIF. '*' = RMP, BLANC = RS OU RP
               10 'X'-FILLER PIC X.
               10 'X'-GTOROP PIC X.
      * TOP DGE. G = DGE, P = CP
               10 'X'-FILLER PIC X.
               10 'X'-GPCTFX PIC X.
      * TOP TAXATION DGE SEULE
               10 'X'-FILLER PIC X.
               10 'X'-GTODGS PIC X.
      * OPTION COPIE DE ROLE DEPARTEMENT
               10 'X'-FILLER PIC X.
               10 'X'-GRODEP PIC X.
      * OPTION COPIE DE ROLE REGION BENEF DE LA TASA
               10 'X'-FILLER PIC X.
               10 'X'-GROTAS PIC X.
      * TAUX BATI DEPARTEMENT
               10 'X'-FILLER PIC X.
               10 'X'-PTBDEP PIC 9(4)V9(6).
      * TAUX BATI TASA
               10 'X'-FILLER PIC X.
               10 'X'-PTBTAS PIC 9(4)V9(6).
      * TAUX NON BATI CHAMBRE AGRICULTURE
               10 'X'-FILLER PIC X.
               10 'X'-PNBAGR PIC 9(4)V9(6).
      * TAUX NON BATI CHAMBRE CONSULAIRE SAINT-MARTIN (971)
               10 'X'-FILLER PIC X.
               10 'X'-PNBAGN PIC 9(4)V9(6).
      * SIRET DE LA CHAMBRE D'AGRICULTURE
               10 'X'-FILLER PIC X.
               10 'X'-SIRET-CHAGR PIC X(14).
      * PRODUIT ATTENDU CH AGRIC TOTAL
               10 'X'-FILLER PIC X.
               10 'X'-TPNAGR PIC 9(10).
      * PRODUIT ATTENDU CH AGRIC (PRORATA DIRECTION PARISIENNES)
               10 'X'-FILLER PIC X.
               10 'X'-MPNAGR PIC 9(10).
               10 'X'-ADTTSE OCCURS 5.
      * CODE ETABLISSEMENT TSE
                 15 'X'-FILLER PIC X.
                 15 'X'-ACOETS PIC X(4).
      * PRODUIT ATTENDU BATI TSE TOTAL
                 15 'X'-FILLER PIC X.
                 15 'X'-TPBTSE PIC 9(10).
      * PRODUIT ATTENDU BATI TSE (PRORATA DIRECTION PARISIENNES)
                 15 'X'-FILLER PIC X.
                 15 'X'-MPBTSE PIC 9(10).
      * PRODUIT ATTENDU BATI TSE DONNE PAR FDL
                 15 'X'-FILLER PIC X.
                 15 'X'-MPBTSX PIC 9(10).
      * PRODUIT ATTENDU NON BATI TSE TOTAL
                 15 'X'-FILLER PIC X.
                 15 'X'-TPNTSE PIC 9(10).
      * PRODUIT ATTENDU NON BATI TSE (PRORATA DIR PARISIENNES)
                 15 'X'-FILLER PIC X.
                 15 'X'-MPNTSE PIC 9(10).
      * NOMBRE DE TSE SUR LA DIRECTION
               10 'X'-FILLER PIC X.
               10 'X'-NBTSE  PIC 9(2).
      * SIRET DE LA REGION BENEF DE LA TASA
               10 'X'-FILLER PIC X.
               10 'X'-DSITAS PIC X(14).
      * PRODUIT ATTENDU TASA TOTAL
               10 'X'-FILLER PIC X.
               10 'X'-TPBTAS PIC 9(10).
      * PRODUIT ATTENDU TASA (PRORATA DIRECTION PARISIENNES)
               10 'X'-FILLER PIC X.
               10 'X'-MPBTAS PIC 9(10).
      * PRODUIT ATTENDU TASA DONNE PAR FDL
               10 'X'-FILLER PIC X.
               10 'X'-MPBTAX PIC 9(10).
      * NUMERO DE FACTURE BORNE INFERIEURE
               10 'X'-FILLER PIC X.
               10 'X'-VBOINF PIC 9(7).
      * NUMERO DE FACTURE BORNE SUPERIEURE
               10 'X'-FILLER PIC X.
               10 'X'-VBOSUP PIC 9(7).
      * DERNIER NUMERO DE FACTURE ATTRIBUE
               10 'X'-FILLER PIC X.
               10 'X'-DDRAVI PIC 9(7).
      * NOMBRE ARTICLES DU ROLE SANS ADRESSE D'ENVOI
               10 'X'-FILLER PIC X.
               10 'X'-NARSAE PIC 9(6).
      * NOMBRE ARTICLES DU ROLE SANS IUI
               10 'X'-FILLER PIC X.
               10 'X'-NARSIU PIC 9(6).
      * COMPTEURS HCNT ET BOND
               10 'X'-FILLER PIC X.
               10 'X'-ANACNT.
                 15 'X'-NBHCNT PIC 9(7) OCCURS 16.
               10 'X'-ANBOND.
                 15 'X'-NABOND PIC 9(7) OCCURS 16.
      * ADRESSE EMAIL DU DEPARTEMENT (PARTIE GAUCHE ET DROITE)
               10 'X'-FILLER PIC X.
               10 'X'-VMAILG PIC X(50).
               10 'X'-VMAILD PIC X(50).
      * ADRESSE EMAIL DE LA REGION BENEF DE LA TASA (GAUCHE ET DROITE)
               10 'X'-FILLER PIC X.
               10 'X'-VMGTAS PIC X(50).
               10 'X'-VMDTAS PIC X(50).
      * LIBRE
               10 'X'-FILLER PIC X(1936).
