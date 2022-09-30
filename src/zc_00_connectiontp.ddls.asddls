@AbapCatalog.sqlViewName: 'ZC00CONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Consumption-View: Connection'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@ObjectModel: {
    transactionalProcessingDelegated: true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
@Metadata.allowExtensions: true
define view ZC_00_ConnectionTP
  as select from ZI_00_ConnectionTP
  association [0..*] to ZC_00_FlightTP  as _Flights     on  _Flights.CarrierID    = ZI_00_ConnectionTP.CarrierID
                                                        and _Flights.ConnectionID = ZI_00_ConnectionTP.ConnectionID
  association [1..1] to ZC_00_AirportVH as _AirportFrom on  ZI_00_ConnectionTP.AirportFrom = _AirportFrom.Id
  association [1..1] to ZC_00_AirportVH as _AirportTo   on  ZI_00_ConnectionTP.AirportTo = _AirportTo.Id
{
  key CarrierID,
  key ConnectionID,
      CountryFrom,
      CityFrom,
      @Consumption.valueHelp: '_AirportFrom'
      AirportFrom,
      CountryTo,
      CityTo,
      @Consumption.valueHelp: '_AirportTo'
      AirportTo,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      Period,
      _Flights,
      _AirportFrom,
      _AirportTo
}
