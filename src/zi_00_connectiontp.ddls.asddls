@AbapCatalog.sqlViewName: 'ZI00CONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Interface-View: Connection'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
    transactionalProcessingEnabled: true,
    compositionRoot: true,
    writeActivePersistence: 'ZV00CONN',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

    modelCategory: #BUSINESS_OBJECT,
    semanticKey: ['CarrierID', 'ConnectionID'],
    representativeKey: 'ConnectionID'
}
define view ZI_00_ConnectionTP
  as select from ZI_00_Connection
{
      @ObjectModel.mandatory: true
  key CarrierID,
      @ObjectModel.mandatory: true
  key ConnectionID,
      @ObjectModel.readOnly: true
      CountryFrom,
      @ObjectModel.readOnly: true
      CityFrom,
      @ObjectModel.mandatory: true
      AirportFrom,
      @ObjectModel.readOnly: true
      CountryTo,
      @ObjectModel.readOnly: true
      CityTo,
      @ObjectModel.mandatory: true
      AirportTo,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      Period
}
