      *-----------------------------------------------------------
      *    ARTICLE COMMUNE DU TAUDIS
      *
      *    ANNEE 2018. LONGUEUR T800 + T84C = 3000
      *
      *-----------------------------------------------------------
             03 DONNEES-COMMUNE.
      * LETTRE ARTICLE. 'C' POUR COMMUNE.
              10 'X'-FILLER PIC X.
              10 'X'-DLETAR PIC X.
      * **
      * ** DONNEES DE TAXATION
      * **

      * NUMERO DE LOT
              10 'X'-FILLER PIC X.
              10 'X'-DNULTF PIC X.
      * NUMERO DE ROLE
              10 'X'-FILLER PIC X.
              10 'X'-DNURO  PIC 9(3).
      * CODE ANNULATION-RECONF / REGULARISATION. A:COM ENTIERE - I:IFP
              10 'X'-FILLER PIC X.
              10 'X'-GCOANU PIC X.
      * ANCIEN NUMERO DE ROLE POUR ANNULATION-RECONF
              10 'X'-FILLER PIC X.
              10 'X'-DACROL PIC X(3).
      * CODE VALIDATION EFICT.
              10 'X'-FILLER PIC X.
              10 'X'-GCOVEF PIC X.
      * ORIGE VALIDATION EFICT
              10 'X'-FILLER PIC X.
              10 'X'-GORVEF PIC X.
      * CODE PASSAGE EFICT
              10 'X'-FILLER PIC X.
              10 'X'-CCOFDL PIC X.
      * VALIDATION EPCI. V:VALIDE OU ''
              10 'X'-FILLER PIC X.
              10 'X'-GOKCU  PIC X.
      * **
      * ** CARACTERISTIQUES DE LA COMMUNE
      * **

      * NBRE D'IFP-TRESO DE LA COMMUNE
              10 'X'-FILLER PIC X.
              10 'X'-NBIFTR PIC 9(3).
      * NBRE D'IFP DE LA COMMUNE. 1: PAS D'IFP -   >1: NBRE D'IFP
              10 'X'-FILLER PIC X.
              10 'X'-NBRIFP PIC 9(3).
      * TOP PREMIERE ANNEE DE FUSION DE LA COMMUNE.
              10 'X'-FILLER PIC X.
              10 'X'-GTOCFU PIC X.
      * CODE NON BATI NON DIFFUSABLE.
              10 'X'-FILLER PIC X.
              10 'X'-GCNDIF PIC X.
      * CODE BATI NON DIFFUSABLE.
              10 'X'-FILLER PIC X.
              10 'X'-GCBDIF PIC X.
      * DATE D'HOMOLOGATION
              10 'X'-FILLER PIC X.
              10 'X'-JDAHO1.
                15 'X'-JSSHOM PIC 9(2).
                15 'X'-JANHO1 PIC 9(2).
                15 'X'-JMOHOM PIC 9(2).
                15 'X'-JJRHOM PIC 9(2).
      * DATE DE MISE EN RECOUVREMENT
              10 'X'-FILLER PIC X.
              10 'X'-JDAMI1.
                15 'X'-JSSMIR PIC X(2).
                15 'X'-JANMIR PIC X(2).
                15 'X'-JMOMIR PIC X(2).
                15 'X'-JJRMIR PIC X(2).
      * DATE DE MAJORATION
              10 'X'-FILLER PIC X.
              10 'X'-JDAMJO.
                15 'X'-JSSMJO PIC X(2).
                15 'X'-JANMJO PIC X(2).
                15 'X'-JMOMJO PIC X(2).
                15 'X'-JJRMJO PIC X(2).
      * LIBELLE DE LA COMMUNE
              10 'X'-FILLER PIC X.
              10 'X'-DLICOM PIC X(30).
      * SIRET DE LA COMMUNE
              10 'X'-FILLER PIC X.
              10 'X'-DSIREC PIC X(14).
      * TOP COMMUNE NON TAXABLE AU DEPARTEMENT
              10 'X'-FILLER PIC X.
              10 'X'-GNIDEP PIC X.
      * TOP COMMUNE APPARTENANT A LA MGP
              10 'X'-FILLER PIC X.
              10 'X'-GTOMGP PIC X.
      * TOP COMMUNE 1ERE ANNEE APPARTENANCE TPU
              10 'X'-FILLER PIC X.
              10 'X'-GCEPCI PIC X.
      * TOP VERSEMENT FOND IDF
              10 'X'-FILLER PIC X.
              10 'X'-GTIDF  PIC X.
      * CODE COMMUNE RECENSEE. R: RECENCEE - N:NON RECENSEE
              10 'X'-FILLER PIC X.
              10 'X'-CTLORR PIC X.
      * SERVICE DE GESTION DE LA TF. I:SIP - F:CDIF
              10 'X'-FILLER PIC X.
              10 'X'-GSVREC PIC X.
      * CODE CDIF OU SIP (CODE BASE MAJIC)
              10 'X'-FILLER PIC X.
              10 'X'-CCOBMJ PIC X(4).
      * POPULATION
              10 'X'-FILLER PIC X.
              10 'X'-NPOCOM PIC 9(7).
      * POS APPLICABLE. P: OUI - ''
              10 'X'-FILLER PIC X.
              10 'X'-GMJPOS PIC X.
      * TAUX POS
              10 'X'-FILLER PIC X.
              10 'X'-PMJPO  PIC 9(3).
      * INDIC MAJO TC. N: NATIONALE - D: SUR DELIB COMM - '': NEANT
              10 'X'-FILLER PIC X.
              10 'X'-DCMZO1 PIC X.
      * MONTANT VERSEMENT FOND IDF
              10 'X'-FILLER PIC X.
              10 'X'-MFSIDF.
                15 'X'-MFSID1 PIC 9(10).
      * VL MOYENNE POUR ECRETEMENT TOM
              10 'X'-FILLER PIC X.
              10 'X'-DVLPOM PIC 9(6).
      * COEFF ECRETEMENT TOM
              10 'X'-FILLER PIC X.
              10 'X'-PPLOM  PIC 9V99.
      * NOMBRE DE TAUX OM FDL. NON VALORISE SI IFP.
              10 'X'-FILLER PIC X.
              10 'X'-NTXOM  PIC 9.
      * NOMBRE DE TAUX COMPTES PAR EFIBA.
              10 'X'-FILLER PIC X.
              10 'X'-NTXOM1 PIC 9.
      * SEUIL EXO DOM BATI
              10 'X'-FILLER PIC X.
              10 'X'-DSEDOM PIC 9(9).
      * SEUIL EXO DOM NON BATI
              10 'X'-FILLER PIC X.
              10 'X'-DSEDNB PIC 9(9).
      * OPTION DE COPIE DE ROLE DE LA COMMUNE
              10 'X'-FILLER PIC X.
              10 'X'-GROCOM PIC X.
      * COEFF DE MODULATION IDF
              10 'X'-FILLER PIC X.
              10 'X'-PCFIDF PIC X(3).
      * AVANCEMENT DU PASSAGE DANS EFIRF. '*': EFIRF10 - '':EFIRF25
              10 'X'-FILLER PIC X.
              10 'X'-GTOCOM PIC X.
      * CODE EPCI AUQUEL LA COMMUNE EST RATTACHE
              10 'X'-FILLER PIC X.
              10 'X'-ACOGC.
                15 'X'-CTYGC1 PIC X.
                15 'X'-CCOIC PIC 9(3).
      * REGIME FISCAL EPCI. FPA OU FPU
              10 'X'-FILLER PIC X.
              10 'X'-RFEPCI PIC X(3).
      * TOP FUSION OU RATTACHEMENT EPCI BATI.F:FUSION-R:RATTACH-'':NA
              10 'X'-FILLER PIC X.
              10 'X'-GTOCOB PIC X.
      * TOP FUSION OU RATTACHEMENT EPCI NBAT.F:FUSION-R:RATTACH-'':NA
              10 'X'-FILLER PIC X.
              10 'X'-GTOCON PIC X.
      * CODE ETAB PUBLIC (TSE) AUQUEL LA COMMUNE EST RATTACHE
              10 'X'-FILLER PIC X.
              10 'X'-GCOETP PIC 9(3).
      * LIBELLE DES SYNDICATS COMMUNAUX
              10 'X'-LISTSY OCCURS 10.
                15 'X'-FILLER PIC X.
                15 'X'-SIREN-SYN PIC X(9).
                15 'X'-FILLER PIC X.
                15 'X'-DLISYN PIC X(20).
      * DELIBERATIONS JEUNES AGRICULTEURS AU NIVEAU DE L'EPCI
      * ANNEE D'INSTALLATION (FGCINX) - ANNEE RETOUR IMPOS (JGCRIX)
              10 'X'-AGRJA.
      * N-4
                15 'X'-FILLER PIC X.
                15 'X'-JGCIN5 PIC 9(4).
                15 'X'-JGCRI5 PIC 9(4).
      * N-3
                15 'X'-FILLER PIC X.
                15 'X'-JGCIN4 PIC 9(4).
                15 'X'-JGCRI4 PIC 9(4).
      * N-2
                15 'X'-FILLER PIC X.
                15 'X'-JGCIN3 PIC 9(4).
                15 'X'-JGCRI3 PIC 9(4).
      * N-1
                15 'X'-FILLER PIC X.
                15 'X'-JGCIN2 PIC 9(4).
                15 'X'-JGCRI2 PIC 9(4).
      * N
                15 'X'-FILLER PIC X.
                15 'X'-JGCIN1 PIC 9(4).
                15 'X'-JGCRI1 PIC 9(4).
              10 'X'-AGRJAR REDEFINES  'X'-AGRJA.
                15 'X'-AGRJAO OCCURS 5.
                  20 'X'-FILLER PIC X.
                  20 'X'-GRINSN PIC 9(4).
                  20 'X'-GRRIMN PIC 9(4).
      * ADRESSE EMAIL DE LA COMMUNE (PARTIE GAUCHE ET DROITE)
              10 'X'-FILLER PIC X.
              10 'X'-VMAILG PIC X(50).
              10 'X'-VMAILD PIC X(50).
      * COEFFICIENT NEUTRALISATION COMMUNE - TASA
              10 'X'-FILLER PIC X.
              10 'X'-CNCOM           PIC 9(3)V9(6).
      * COEFFICIENT NEUTRALISATION EPCI
              10 'X'-FILLER PIC X.
              10 'X'-CNEPCI PIC 9(3)V9(6).
      * COEFFICIENT NEUTRALISATION DEPARTEMENT
              10 'X'-FILLER PIC X.
              10 'X'-CNDEP           PIC 9(3)V9(6).
      * COEFFICIENT NEUTRALISATION TEOM
              10 'X'-FILLER PIC X.
              10 'X'-CNTEOM PIC 9(3)V9(6).
      * COEFFICIENT NEUTRALISATION TSE - GEMAPI
              10 'X'-FILLER PIC X.
              10 'X'-CNTSE           PIC 9(3)V9(6).
      * LIBRE
              10 'X'-FILLER PIC X(2269).
