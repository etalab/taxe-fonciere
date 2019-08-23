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
              10          'X'-CCOBNB PICTURE X(1).
      *                             /CODE BATI / NON-BATI
              10          'X'-MCTCOM PICTURE S9(10).
      *                             /COTISATION COMMUNALE
              10          'X'-MCTDEP PICTURE S9(10).
      *                             /COTISATION DEPARTEMENTALE
              10          'X'-MCTREG PICTURE S9(10).
      *                             /COTISATION REGIONALE
              10          'X'-MCTSYN PICTURE S9(10).
      *                             /COTIS. SYN. & DIST. SANS FISC. PROP
              10          'X'-MCTCU PICTURE S9(10).
      *                             /COTISATION GROUP. A FISCAL. PROPRE
              10          'X'-MCTTSE PICTURE S9(10).
      *                             /COTISATION TAXE SPECIALE EQUIPEMENT
              10          'X'-MCNT13 PICTURE S9(10)
                               OCCURS 002.
      *                             /COTISATION NON BATI TSE EPF 1
              10          'X'-MCTCA PICTURE S9(10).
      *                             /COTISATION CHAMBRE D'AGRICULTURE
              10          'X'-MCTBAP PICTURE S9(10).
      *                             /COTISATION BAPSA
              10          'X'-MCTCAP PICTURE S9(10).
      *                             /COTISATION DROIT PROPORTIONNEL CAAA
              10          'X'-MCTCAD PICTURE S9(5).
      *                             /COTISATION DROIT FIXE CAAA
              10          'X'-MCNTSA PICTURE 9(10).
      *                             /COTISATION amalgam{e Non bATI TSE NV
              10          'X'-MCFFIX PICTURE S9(10).
      *                             /MONTANT FRAIS FIXE CAAA
              10          'X'-MFA300 PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE A 3%
              10          'X'-MCFANO
                          REDEFINES      'X'-MFA300
                                      PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE NORMAUX
              10          'X'-MFN300 PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR A 3%
              10          'X'-MCFNVN
                          REDEFINES      'X'-MFN300
                                      PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR NORMAUX
              10          'X'-MCFABA PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE BAPSA
              10          'X'-MCFNVB PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR BAPSA
              10          'X'-MCFACA PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE CAAA
              10          'X'-MCFNVC PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR CAAA
              10          'X'-FILLER PICTURE X(10).
              10          'X'-MDGPLA PICTURE S9(10).
      *                             /MONTANT DEGREVEMENT PRES ET LANDES
              10          'X'-MDGFAP PICTURE S9(10).
      *                             /MONTANT DEGREV.FRAIS ASSIETTE PRES
              10          'X'-MDGFNV PICTURE S9(10).
      *                             /MONTANT DEGREV.FRAIS NON VALEUR PRES
              10          'X'-MDJCOM PICTURE S9(10).
      *                             /MONTANT DEGREVT. JEUNE AGRIC. COM.
              10          'X'-MDJSYN PICTURE S9(10).
      *                             /MONTANT DEGREVT. JEUNE AGRIC. SYN.
              10          'X'-MDJCU PICTURE S9(10).
      *                             /MONTANT DEGREVT. JEUNE AGRIC. GROUP.
              10          'X'-MDJTSE PICTURE S9(10).
      *                             /MONTANT DEGREVT. JEUNE AGRIC. TSE
              10          'X'-MDJDEP PICTURE S9(10).
      *                             /MONTANT DEGREVT. JEUNE AGRIC. DPT.
              10          'X'-MDJT13 PICTURE S9(10)
                               OCCURS 002.
      *                             /MONTANT DEGREV JEUNE AGRIC TSE EPF 1
              10          'X'-TCTHFR PICTURE S9(12).
      *                             /TOTAL COTISATION HORS FRAIS
              10          'X'-TCTFRA PICTURE S9(12).
      *                             /COTISATION - TOTAL DES FRAIS
              10          'X'-TCTDU PICTURE S9(12).
      *                             /TOTAL COTISATION DU (avec frais)
              10          'X'-MCNJAE PICTURE S9(10).
      *                             /MONTANT TOTAL COTISATION JA ETAT
              10          'X'-MFAJ1E PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE JA ETAT
              10          'X'-MFNJ1E PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR JA ETAT
              10          'X'-MCTCAS PICTURE S9(10).
      *                             /COTIS. CHAMBRE D'AGR. saint martin
              10          'X'-MFA800 PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE A 8%
              10          'X'-MCAANO
                          REDEFINES      'X'-MFA800
                                      PICTURE S9(10).
      *                             /MNT FRAIS ASSIETTE CHAGR NORMAUX
              10          'X'-MFN800 PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR A 8%
              10          'X'-MCANVN
                          REDEFINES      'X'-MFN800
                                      PICTURE S9(10).
      *                             /MNT FRAIS ASSIETTE CHAGR NON VALEUR
              10          'X'-MFA900 PICTURE S9(10).
      *                             /MONTANT FRAIS ASSIETTE A 9%
              10          'X'-MFN900 PICTURE S9(10).
      *                             /MONTANT FRAIS NON VALEUR A 9%
              10          'X'-MCOGE3 PICTURE S9(10).
      *                             /Cotisation GEMAPI
              10          'X'-CCOIFP PICTURE X(3).
      *                             /CODE commune absorbee
              10          'X'-CCPPER PICTURE X(3).
      *                             /CODE TRESORERIE
              10          'X'-FILLER PICTURE X(145).
