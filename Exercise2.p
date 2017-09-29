
/*------------------------------------------------------------------------
    File        : Exercise.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 11:25:13 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//Request:Strada si numarul  fiecarui client  din statele care incep cu N 
//(folosind 2 functii pentru citirea strazii si citirea numarului)

DEFINE BUFFER OtherCust FOR Customer.
DEFINE VAR letter AS CHAR NO-UNDO INIT "N".
DEFINE VAR numField AS CHAR NO-UNDO INIT "".
DEFINE VAR streetField AS CHAR NO-UNDO INIT "".



FUNCTION isNumeric RETURNS LOGICAL (INPUT s AS CHARACTER):
  DEFINE VAR n AS DECIMAL NO-UNDO.
  ASSIGN n = DECIMAL(s) NO-ERROR.
  RETURN (ERROR-STATUS:NUM-MESSAGES = 0).
END.


PROCEDURE findNumberStreet:
    DEFINE INPUT PARAMETER letter AS CHAR.
    FOR EACH OtherCust WHERE OtherCust.State BEGINS letter NO-LOCK:
        numField = ENTRY(1,OtherCust.Address," ").
        IF (isNumeric(numField)) = TRUE THEN DO:
            ASSIGN streetField = SUBSTRING(OtherCust.Address,LENGTH(numField) + 1).
            DISPLAY
                numField    LABEL "Number"
                streetField LABEL "Street".
        END.
    END.
END PROCEDURE.

RUN findNumberStreet(INPUT letter).

