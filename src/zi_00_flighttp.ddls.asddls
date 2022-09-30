@AbapCatalog.sqlViewName: 'ZI00FLIGHTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Interface-View: Flight'
@VDM.viewType: #TRANSACTIONAL
define view ZI_00_FlightTP
  as select from ZI_00_Flight
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      Price,
      CurrencyCode,
      Planetype,
      MaxSeatsEconomy,
      OccupiedSeatsEconomy,
      Paymentsum,
      MaxSeatsBusiness,
      OccupiedSeatsBusiness,
      MaxSeatsFirst,
      OccupiedSeatsFirst
}
