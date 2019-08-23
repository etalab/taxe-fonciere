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
               15         'X'-GTOVOT PICTURE X(1).
      *                             /indicateur de taux valides
               15         'X'-XDDAY6 PICTURE X(6).
      *                             /DATE DU JOUR SUR 6 CARACTERES
               15         'X'-PMJPO PICTURE 9(3).
      *                             /MONTANT MAJORATION VL TERRAIN CONSTR
               15         'X'-DNURO PICTURE 9(3).
      *                             /numero du role
               15         'X'-JDHOMO PICTURE X(6).
      *                             /date d'homologation du role JJMMAA
               15         'X'-DNULTF PICTURE X.
      *                             /NUMERO LOT DE TAXATION FONCIERE
               15         'X'-GCOANU PICTURE X.
      *                             /CODE ANNULATION / REFECTION
               15         'X'-NBSROL PICTURE 9(2).
      *                             /nombre de serie-role
               15         'X'-DLISRO PICTURE X(7).
      *                             /liste des serie-role
               15         'X'-JDATAU PICTURE 9(8).
      *                             /DATE DE VALIDITE DES TAUX
               15         'X'-JDACMP PICTURE 9(8).
      *                             /DATE ROLE COMPLEMENTAIRE
               15         'X'-ACOGEM PICTURE X(4).
      *                             /Code beneficiaire de la GEMAPI
               15         'X'-PBBOMP PICTURE 9(4)V9(6).
      *                             /taux plein ordures menageres
               15         'X'-PBBOMA PICTURE 9(4)V9(6).
      *                             /taux reduit RA ordures menageres
               15         'X'-PBBOMB PICTURE 9(4)V9(6).
      *                             /taux reduit RB ordures menageres
               15         'X'-PBBOMC PICTURE 9(4)V9(6).
      *                             /taux reduit RC ordures menageres
               15         'X'-PBBOMD PICTURE 9(4)V9(6).
      *                             /taux reduit RD ordures menageres
               15         'X'-NBTAUXOM PICTURE 9(1).
      *                             /nombre de taux om
               15         'X'-JCOJA
                               OCCURS 005.
      *                             /zone groupe ja (JCOINS+JCORIM)
                20        'X'-JCOINS PICTURE 9(4).
      *                             /ANNEE INSTALLATION JA COMMUNE
                20        'X'-JCORIM PICTURE 9(4).
      *                             /ANNEE RETOUR IMPOSITION COMMUNE
               15         'X'-JGCJA
                               OCCURS 005.
      *                             /zone groupe ja (JGCINS+JGCRIM)
                20        'X'-JGCINS PICTURE 9(4).
      *                             /ANNEE INSTALLATION JA GRPT COMMUNE
                20        'X'-JGCRIM PICTURE 9(4).
      *                             /ANNEE RETOUR IMPOSITION GRPT COMMUNE
               15         'X'-DLICOM PICTURE X(30).
      *                             /LIBELLE COMMUNE
               15         'X'-GNIDEP PICTURE X(1).
      *                             /TOP COMMUNE NON IMPOSABLE AU DEPARTE
               15         'X'-GTOECO PICTURE X(1).
      *                             /INDICATEUR DE BASE TAUX ECOLE
               15         'X'-CTYGC PICTURE X(1).
      *                             /TYPE DE GROUPEMENT DE COMMUNE
               15         'X'-DNUCOL PICTURE X(3).
      *                             /CODE COLLECTIVITE LOCALE
               15         'X'-ACOSYN.
      *                             /SYNDICAT BENEFICIAIRE DES OM
                20        'X'-CTYSYN PICTURE X(1).
      *                             /TYPE DE SYNDICAT OM
                20        'X'-CCOSYN PICTURE X(3).
      *                             /CODE SYNDICAT OM
               15         'X'-ACOGOM PICTURE X(4).
      *                             /COLLECTIVITE GESTIONNAIRE DES OM
               15         'X'-DVLPOM PICTURE 9(6).
      *                             /Valeur locative moyenne (commune)
               15         'X'-PPLOM PICTURE 9V99.
      *                             /COEFFICIENT DE PLAFONNEMENT TEOM
               15         'X'-DCMZO1 PICTURE X.
      *                             /INDICATEUR MAJO TC NATIONAL
               15         'X'-ANUZIP.
      *                             /ZONE GROUPE ZIP
                20        'X'-DNUZIP PICTURE X(3).
      *                             /Numero de ZIP Zone OM P
                20        'X'-DNUZIA PICTURE X(3).
      *                             /Numero de ZIP Zone OM RA
                20        'X'-DNUZIB PICTURE X(3).
      *                             /Numero de ZIP Zone OM RB
                20        'X'-DNUZIC PICTURE X(3).
      *                             /Numero de ZIP Zone OM RC
                20        'X'-DNUZID PICTURE X(3).
      *                             /Numero de ZIP Zone OM RD
               15         'X'-NPOCOM PICTURE 9(7).
      *                             /Commune: population totale
               15         'X'-PBBOME PICTURE 9(4)V9(6).
      *                             /taux reduit RE ordures menageres
               15         'X'-FILLER PICTURE X(22).
               15         'X'-DSEDOM PICTURE 9(9).
      *                             /SEUIL D'EXONERATION DOM
               15         'X'-DSEDNB PICTURE 9(9).
      *                             /SEUIL D'EXONERATION DOM NON BATI
               15         'X'-ACOTXA.
      *                             /BENEFICIAIRE TAXE ADDITIONNELLE
                20        'X'-CTYTXA PICTURE X(1).
      *                             /TYPE DE BENEFICIAIRE TAXE ADD
                20        'X'-CCOTXA PICTURE X(3).
      *                             /CODE BENEFICIAIRE TAXE ADD
               15         'X'-PBBOMI PICTURE 9(12)V9(6).
      *                             /Pseudo taux TEOMI constr. neuves
               15         'X'-ACOBIM PICTURE X(4).
      *                             /Code beneficiaire de la TEOMI
               15         'X'-GTOMGP PICTURE X(1).
      *                             /TOP COMMUNE APPARTENANT  GRAND PARIS
               15         'X'-DSIREC PICTURE X(14).
      *                             /NUMERO SIRET COMMUNE
               15         'X'-GTOCFU PICTURE X(1).
      *                             /TOP 1ERE ANNEE FUSION COMMUNE
               15         'X'-FILLER PICTURE X(34).
               15         'X'-DNUURC PICTURE X(2).
      *                             /NUM UNITE REGROUPEMENT CDIF ( UR )
