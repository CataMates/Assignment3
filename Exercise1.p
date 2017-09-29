
/*------------------------------------------------------------------------
    File        : Ex1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 09:58:16 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//Request:Suma de plata pentru fiecare ultima comanda a Clientilor din Florida.
    
    
DEFINE BUFFER OtherCust FOR Customer.
DEFINE BUFFER OtherOrd FOR Order.
DEFINE BUFFER OtherOrdLine FOR OrderLine.

DEFINE VAR orderSum AS DECIMAL NO-UNDO INITIAL 0.


FUNCTION totalSum RETURNS DECIMAL() FORWARD.

ETIME(YES).
DEFINE QUERY lastOrd FOR OtherCust, OtherOrd.


FUNCTION totalSum RETURN DECIMAL:
    ASSIGN orderSum = 0.
    OPEN QUERY lastOrd FOR EACH OtherCust WHERE OtherCust.State = "FL", 
                           LAST OtherOrd OF OtherCust.
    GET FIRST lastOrd.    
    DO WHILE AVAILABLE OtherCust:
        IF AVAILABLE OtherOrd THEN DO:
            FOR EACH OtherOrdLine OF OtherOrd:
                ASSIGN orderSum = orderSum + OtherOrdLine.ExtendedPrice.
            END.
        END.
        GET NEXT lastOrd.
    END.
    RETURN orderSum.
END FUNCTION.

DISPLAY totalSum() LABEL "Total Sum".
MESSAGE ETIME VIEW-AS ALERT-BOX.





