package Top_Fabric_Master_CoreUARTapb_0_coreuart_pkg is
function SYNC_MODE_SEL( FAMILY: INTEGER) return INTEGER;
end Top_Fabric_Master_CoreUARTapb_0_coreuart_pkg;

package body Top_Fabric_Master_CoreUARTapb_0_coreuart_pkg is

	FUNCTION SYNC_MODE_SEL (FAMILY: INTEGER) RETURN INTEGER IS
        VARIABLE return_val : INTEGER := 0;
        BEGIN
		IF(FAMILY = 25) THEN
		    return_val := 1;
		ELSE
		    return_val := 0;
		END IF;
		RETURN return_val; 
	END SYNC_MODE_SEL;
		
end Top_Fabric_Master_CoreUARTapb_0_coreuart_pkg;
