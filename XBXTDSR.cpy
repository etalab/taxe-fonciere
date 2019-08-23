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
               15         'X'-LIGBENEFOM PICTURE 9(2).
      *                             /code collectivite beneficiaire om
               15         'X'-TPBASY.
      *                             /table repartition produits syndicats
                20        'X'-PBASY1 PICTURE 9(3)V9(2)
                               OCCURS 010.
      *                             /elt repartition produits syndicat
               15         'X'-TPNBSY.
      *                             /table repartition produits syndicats
                20        'X'-PNBPSY PICTURE 9(3)V9(2)
                               OCCURS 010.
      *                             /elt repartition produits syndicat
               15         'X'-TPOMSY.
      *                             /table repartition produits syndicats
                20        'X'-POMSY1 PICTURE 9(3)V9(2)
                               OCCURS 010.
      *                             /elt repartition produits syndicat
               15         'X'-TAUCOM-B PICTURE 9(4)V9(6).
      *                             /TAUX BATI COMMUNAL
               15         'X'-TAUSYNDSFP-B PICTURE 9(4)V9(6).
      *                             /taux bati syndicat
               15         'X'-TAUCUDFPVN-B PICTURE 9(4)V9(6).
      *                             /taux bati groupement de commune
               15         'X'-TAUTSE-B PICTURE 9(4)V9(6).
      *                             /taux bati taxe speciale d'equipement
               15         'X'-PNBTXA PICTURE 9(4)V9(6).
      *                             /taux de taxe additionnellle
               15         'X'-TAUCOM-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB COMMUNE
               15         'X'-TAUSYNDSFP-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB SYNDICAT
               15         'X'-TAUCUDFPVN-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB COMMUNAUTE URBAINE
               15         'X'-TAUTSE-NB PICTURE 9(4)V9(6).
      *                             /TAUX NB TSE sauf ILE DE FRANCE
               15         'X'-PNBCAA PICTURE 9(4)V9(6).
      *                             /TAUX NB C.A.A.A.
               15         'X'-CCOEXC PICTURE X(2).
      *                             /code exclusion
               15         'X'-GIMOMI PICTURE X(1).
      *                             /Indicateur de taxation TEOMI
               15         'X'-CCOBIM PICTURE 9(2).
      *                             /Code collectivite beneficiaire TEOMI
               15         'X'-PTBGEM PICTURE 9(4)V9(6).
      *                             /TAUX BATI GEMAPI
               15         'X'-PNBGEM PICTURE 9(4)V9(6).
      *                             /TAUX NON BATI GEMAPI
               15         'X'-FILLER PICTURE X(50).
               15         'X'-ACOETS PICTURE X(4)
                               OCCURS 002.
      *                             /CODE ORGANISME BENEFICIAIRE TSE
               15         'X'-DNUTSE PICTURE 9(2)
                               OCCURS 002.
      *                             /Num{ro de poste TSE nouvelle
               15         'X'-FILLER PICTURE X(21).
               15         'X'-CCDDIR.
      *                             /CODE DIRECTION
                20        'X'-CO2DEP PICTURE X(2).
      *                             /CODE DEPARTEMENT
                20        'X'-CCODIR PICTURE X(1).
      *                             /CODE DIRECTION
               15         'X'-PTBTGP PICTURE 9(4)V9(6).
      *                             /TAUX TSE GP MA GA bati
               15         'X'-PNBTGP PICTURE 9(4)V9(6).
      *                             /TAUX TSE GRAND PARIS NON-BATI
               15         'X'-DNUURC PICTURE X(2).
      *                             /NUM UNITE REGROUPEMENT CDIF ( UR )
