
/*------------------------------------------------------------------------
    File        : Exercise4custom.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 13:00:24 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */


//Request: Orasul din care s-au dat cele mai  multe comenzi.
    

DEFINE BUFFER OtherCust FOR Customer.
DEFINE BUFFER OtherOrd FOR Order.
DEFINE VAR orderNumber  AS INTEGER NO-UNDO INIT 0.
DEFINE VAR orderMaximum AS INTEGER NO-UNDO INIT 0.
DEFINE VAR cityName     AS CHAR    NO-UNDO INIT "".

FUNCTION totalOrd RETURN CHAR FORWARD.

FUNCTION totalOrd RETURN CHAR:

    FOR EACH OtherCust NO-LOCK BREAK BY OtherCust.City:
        ASSIGN orderNumber = 0.
        FOR EACH OtherOrd OF OtherCust NO-LOCK:
            ASSIGN orderNumber = orderNumber + 1.
        END.
        IF orderNumber > orderMaximum THEN DO:
            ASSIGN
                orderMaximum = orderNumber
                cityName     = OtherCust.City.
        END.
    END.
    RETURN cityName.
END FUNCTION.


DISPLAY totalOrd() LABEL "City with maxim orders".