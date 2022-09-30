@AbapCatalog.sqlViewName: 'ZC00FLIGHTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Consumption-View: Flight'
@VDM.viewType: #CONSUMPTION
define view ZC_00_FlightTP
  as select from ZI_00_FlightTP
  association [1..1] to ZC_00_ConnectionTP as _Connection on  _Connection.CarrierID    = ZI_00_FlightTP.CarrierID
                                                          and _Connection.ConnectionID = ZI_00_FlightTP.ConnectionID
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
      OccupiedSeatsFirst,
      _Connection
}
