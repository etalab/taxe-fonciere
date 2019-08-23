      *********************************************************
      * PROGRAMME CTXTA3N                                     *
      * LANGAGE COBOL                                         *
      *                                                       *
      * CE SOUS-PROGRAMME EST LE POINT D'ENTREE DE LA         *
      * CALCULETTE DES COTISATIONS DE TF NON BATIE.           *
      * EN FONCTION DE L'ANNEE D'IMPOSITION VALORISEE DANS LA *
      * ZONE D'E/S, LE SOUS PROGRAMME APPELLE LA CALCULETTE   *
      * MILLESIMEE CORRESPONDANTE.                            *
      *                                                       *
      *********************************************************

       ID DIVISION.
       PROGRAM-ID. CTXTA3N.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***
       01  SLATVARS              PIC X(122)                 VALUE 'SLAT
      -    'VARS START: DATEUPD TIMEUPD PROGRAMMERNAME MODNAME LVNO UPNO
      -    ' DATA-SET-NAME-FOR-THE-LIBRARIAN-MASTER-FILESLAT VARS END'.

       01 VERSION PIC X(23) VALUE 'CTXTA3N 01 DU 13/03/18'.
       01 PARM          PIC X .

       LINKAGE SECTION.
      *DESCRIPTION DES PARAMETRES DE LIAISON
      * - APPEL INITIAL
       01 ENTREE.
          05               PIC X(1).
          05  ANNEE        PIC X(4).
          05               PIC X(595).
      * - RETOUR             DES BASES CALCULEES
       01 SORTIE  PIC X(600).
      * - RETOUR             DES CODES ANOMALIES
       01 CR           PIC 99.
       01 RC           PIC 99.

       PROCEDURE DIVISION   USING   ENTREE SORTIE CR RC .
       TRAIT.
               IF CR  = 99
                   MOVE 'M' TO PARM
               ELSE
                   MOVE ' ' TO PARM
               END-IF
               MOVE 00      TO CR

           EVALUATE ANNEE
             WHEN 2010
               CALL  'EFITA3N0' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2011
               CALL  'EFITA3N1' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2012
               CALL  'EFITA3N2' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2013
               CALL  'EFITA3N3' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2014
               CALL  'EFITA3N4' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2015
               CALL  'EFITA3N5' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2016
               CALL  'EFITA3N6' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2017
               CALL  'EFITA3N7' USING   ENTREE  SORTIE  CR  RC PARM
             WHEN 2018
               CALL  'EFITA3N8' USING   ENTREE  SORTIE  CR  RC PARM
           END-EVALUATE
           GOBACK.
