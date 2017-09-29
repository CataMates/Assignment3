
/*------------------------------------------------------------------------
    File        : Exercise3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 11:40:17 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//Request:Comenzile care nu au fost onorate in maxim o saptamana   


DEFINE BUFFER OtherCust FOR Customer.
DEFINE BUFFER OtherOrd FOR Order.


FOR EACH OtherCust:
    FOR EACH OtherOrd OF OtherCust:
        IF (OtherOrd.OrderDate - OtherOrd.ShipDate) < 7 THEN DO:
              DISPLAY
                     OtherCust.Name LABEL "Name"
                     OtherOrd.OrderDate
                     OtherOrd.ShipDate.
        END.
    END.
END.


