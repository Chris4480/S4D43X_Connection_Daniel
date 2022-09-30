CLASS zcl_00_a_switch_planetype DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_a_switch_planetype IMPLEMENTATION.

  METHOD /bobf/if_frw_action~execute.

    " Datenobjekte deklarieren
    DATA connections TYPE zti00_connectiontp.
    DATA message TYPE REF TO zcm_00_connection.

    " BO-Daten lesen (Verbindungen)
    io_read->retrieve(
      EXPORTING
        iv_node       = is_ctx-node_key
        it_key        = it_key
      IMPORTING
        eo_message    = eo_message
        et_data       = connections
        et_failed_key = et_failed_key ).

    " Nachrichten-Container erzeugen
    IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    " BO-Daten sequentiell durchlaufen
    LOOP AT connections REFERENCE INTO DATA(connection).
      " Aktion implementieren
      IF connection->flighttype = 'X'.
        connection->flighttype = ''.
      ELSE.
        connection->flighttype = 'X'.
      ENDIF.

      " Nachricht erzeugen
      message = NEW zcm_00_connection(
        textid       = zcm_00_connection=>co_switched_successfully
        severity     = zcm_00_connection=>co_severity_success
        i_flighttype = connection->flighttype ).

      eo_message->add_cm( message ).

      " BO-Daten zurückschreiben
      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = connection->key
          is_data = connection ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
