      ***************************************************
      *              I M P O R T A N T                  *
      *              -----------------                  *
      *                                                 *
      *   LE PROGRAMME EFITA3B EST UNIQUEMENT UN        *
      *   AIGUILLAGE PAR RAPPORT A L'ANNEE              *
      *   D'IMPOSITION                                  *
      *                  EFITA3B8 POUR 2009             *
      *                  EFITA3B0 POUR 2010             *
      *                  EFITA3B1 POUR 2011             *
      *                  EFITA3B2 POUR 2012             *
      *                  EFITA3B3 POUR 2013             *
      *                  EFITA3B4 POUR 2014             *
      *                  EFITA3B5 POUR 2015             *
      *                  EFITA3B7 POUR 2017             *
      *                  EFITA3B8 POUR 2018             *
      ***************************************************
       ID DIVISION.
       PROGRAM-ID. CTXTA3B.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***
       01 SLATVARS              PIC X(122)                  VALUE 'SLAT
      -    'VARS START:18/12/0608:39:01BEPARDI        CTXTA3B 0000200002
      -    'EFI.TST.PGM                                 SLAT VARS END'.

       01 VERSION     PIC X(23) VALUE 'CTXTA3B  05 DU 13/03/18'.

       01 PARM                     PIC X.
       LINKAGE SECTION.
      * DESCRIPTION DES PARAMETRES
      * APPEL INITIAL
       01 ENTREE.
          05             PIC X.
          05 E-ANNEE     PIC X(4).
          05             PIC X(595).
      * RETOUR VERS MAJIC2 DES COTISATIONS CALCULEES
       01 SORTIE      PIC X(600).
      * RETOUR MAJIC2 DES CODES ANOMALIES
       01 CRM         PIC 9(2).
       01 RCM         PIC 9(2).
       PROCEDURE DIVISION USING ENTREE SORTIE CRM RCM .
       TRAIT.
           IF CRM = 99
              MOVE 'M' TO PARM
           ELSE
              MOVE ' ' TO PARM
           END-IF
           MOVE 00     TO CRM
           EVALUATE E-ANNEE
              WHEN '2006'
                 CALL 'EFITA3B6' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2007'
                 CALL 'EFITA3B7' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2008'
                 CALL 'EFITA3B8' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2009'
                 CALL 'EFITA3B8' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2010'
                 CALL 'EFITA3B0' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2011'
                 CALL 'EFITA3B1' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2012'
                 CALL 'EFITA3B2' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2013'
                 CALL 'EFITA3B3' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2014'
                 CALL 'EFITA3B4' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2015'
                 CALL 'EFITA3B5' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2016'
                 CALL 'EFITA3B6' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2017'
                 CALL 'EFITA3B7' USING ENTREE SORTIE CRM RCM PARM
              WHEN '2018'
                 CALL 'EFITA3B8' USING ENTREE SORTIE CRM RCM PARM
           END-EVALUATE
           GOBACK
           .
