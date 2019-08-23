      *-----------------------------------------------------------*
      *    NOM COPY                   :  XRETB                    *
      *-----------------------------------------------------------*
           10 'X'-AIDFIC.
      * IDENTIFIANT DU FICHIER
              15 'X'-DAN    PIC 9(4).
      * ANNEE IMPOSITION
              15 'X'-AC3DIR.
      * CODE DEPARTEMENT DIRECTION
                 20 'X'-CC2DEP    PIC X(2).
      * CODE DEPARTEMENT
                 20 'X'-CCODIR    PIC X.
      * CODE DIRECTION
              15 'X'-CCOCOM    PIC X(3).
      * CODE COMMUNE MAJIC2
              15 'X'-DSRPAR    PIC X.
      * SERIE ROLE PARCELLE
           10 'X'-ANUPRO.
      * NUM COMPTE PROPRIETAIRE
              15 'X'-CGROUP    PIC X.
      * CODE GROUPE PROPRIETAIRE
              15 'X'-NNUPRO    PIC 9(5).
      * NUM COMPTE PROPRIETAIRE
           10 'X'-CCOBNB    PIC X.
      * CODE BATI / NON-BATI
           10 'X'-MCTCOM    PIC S9(10).
      * COTISATION COMMUNALE
           10 'X'-MCTDEP    PIC S9(10).
      * COTISATION DEPARTEMENTALE
           10 'X'-MCTREG    PIC S9(10).
      * COTISATION REGIONALE
           10 'X'-MCTSYN    PIC S9(10).
      * COTIS. SYN. & DIST. SANS FISC. PROP
           10 'X'-MCTCU    PIC S9(10).
      * COTISATION GROUP. A FISCAL. PROPRE
           10 'X'-MCTTSE    PIC S9(10).
      * COTISATION TAXE SPECIALE EQUIPEMENT
           10 'X'-MCBT13    PIC S9(10) OCCURS 2.
      * COTISATION BATI TSE EPF 1
           10 'X'-MCBTSA    PIC 9(10).
      * COTISATION AMALGAMEE BATI T.S.E NOUV
           10 'X'-FILLER    PIC X(40).
           10 'X'-ACTOM OCCURS 6.
      * COTISATIONS ORDURES MENAGERES
              15 'X'-GTAUOM    PIC X(2).
      * REGIME DE LA TAXE ENLEVEMENT DES OM
              15 'X'-MCTOM    PIC S9(10).
      * COTISATION ORDURE MENAGERE
           10 'X'-MFA300    PIC S9(10).
      * MONTANT FRAIS ASSIETTE A 3%
           10 'X'-MCFANO REDEFINES 'X'-MFA300    PIC S9(10).
      * MONTANT FRAIS ASSIETTE NORMAUX
           10 'X'-MFN300    PIC S9(10).
      * MONTANT FRAIS NON VALEUR A 3%
           10 'X'-MCFNVN REDEFINES 'X'-MFN300    PIC S9(10).
      * MONTANT FRAIS NON VALEUR NORMAUX
           10 'X'-MFA800    PIC S9(10).
      * MONTANT FRAIS ASSIETTE A 8%
           10 'X'-MOMANO REDEFINES 'X'-MFA800    PIC S9(10).
      * MONT OM FRAIS ASSIETTE NORMAUX
           10 'X'-MFN800    PIC S9(10).
      * MONTANT FRAIS NON VALEUR A 8%
           10 'X'-MOMNVN REDEFINES 'X'-MFN800    PIC S9(10).
      * MONT OM FRAIS NON VALEUR NORMAUX
           10 'X'-TCTHFR    PIC S9(12).
      * TOTAL COTISATION HORS FRAIS
           10 'X'-TCTFRA    PIC S9(12).
      * COTISATION - TOTAL DES FRAIS
           10 'X'-TCTDU     PIC S9(12).
      * TOTAL COTISATION DU (AVEC FRAIS)
           10 'X'-MFA900    PIC S9(10).
      * MONTANT FRAIS ASSIETTE A 9%
           10 'X'-MFN900    PIC S9(10).
      * MONTANT FRAIS NON VALEUR A 9%
           10 'X'-TCTOM     PIC 9(10).
      * TOTAL COTISATIONS ORDURES MENAGERES
           10 'X'-MVLTIM    PIC S9(10).
      * MONTANT TEOMI
           10 'X'-MCOGE3    PIC S9(10).
      * COTISATION GEMAPI
           10 'X'-MCOTA3    PIC S9(10).
      * COTISATION TASA
           10 'X'-CCOIFP    PIC X(3).
      * CODE COMMUNE ABSORBEE
           10 'X'-CCPPER    PIC X(3).
      * CODE TRESORERIE
           10 'X'-FILLER    PIC X(238).
