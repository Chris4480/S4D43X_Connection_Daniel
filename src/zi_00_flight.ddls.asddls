@AbapCatalog.sqlViewName: 'ZI00FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic Interface-View: Flight'
@VDM.viewType: #BASIC
define view ZI_00_Flight
  as select from sflight
{
  key carrid     as CarrierID,
  key connid     as ConnectionID,
  key fldate     as FlightDate,
      price      as Price,
      currency   as CurrencyCode,
      planetype  as Planetype,
      seatsmax   as MaxSeatsEconomy,
      seatsocc   as OccupiedSeatsEconomy,
      paymentsum as Paymentsum,
      seatsmax_b as MaxSeatsBusiness,
      seatsocc_b as OccupiedSeatsBusiness,
      seatsmax_f as MaxSeatsFirst,
      seatsocc_f as OccupiedSeatsFirst
}
