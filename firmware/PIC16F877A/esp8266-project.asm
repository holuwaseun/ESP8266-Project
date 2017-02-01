
_esp_init:

;esp8266-project.c,35 :: 		void esp_init()
;esp8266-project.c,37 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,38 :: 		lcd_write("Send AT Comm.", 1, 1);
	MOVLW      ?lstr1_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,39 :: 		UART1_Write_Text("AT");
	MOVLW      ?lstr2_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,40 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,42 :: 		while(!UART1_Data_Ready());
L_esp_init0:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_init1
	GOTO       L_esp_init0
L_esp_init1:
;esp8266-project.c,44 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,46 :: 		if(response == 'O')
	MOVF       R0+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_esp_init2
;esp8266-project.c,48 :: 		lcd_write("ESP Module OK", 2, 1);
	MOVLW      ?lstr3_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,49 :: 		esp_ok = ON;
	MOVLW      1
	MOVWF      _esp_ok+0
;esp8266-project.c,50 :: 		}
	GOTO       L_esp_init3
L_esp_init2:
;esp8266-project.c,53 :: 		lcd_write("ESP Module Bad", 2, 1);
	MOVLW      ?lstr4_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,54 :: 		esp_ok = OFF;
	CLRF       _esp_ok+0
;esp8266-project.c,55 :: 		}
L_esp_init3:
;esp8266-project.c,56 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_esp_init4:
	DECFSZ     R13+0, 1
	GOTO       L_esp_init4
	DECFSZ     R12+0, 1
	GOTO       L_esp_init4
	DECFSZ     R11+0, 1
	GOTO       L_esp_init4
	NOP
;esp8266-project.c,57 :: 		}
	RETURN
; end of _esp_init

_esp_set_mode:

;esp8266-project.c,59 :: 		void esp_set_mode(int opmod)
;esp8266-project.c,61 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,62 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,63 :: 		lcd_write("Set Op Mode.", 1, 1);
	MOVLW      ?lstr5_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,64 :: 		switch(opmod)
	GOTO       L_esp_set_mode5
;esp8266-project.c,66 :: 		case 1:
L_esp_set_mode7:
;esp8266-project.c,67 :: 		UART1_Write_Text("AT+CWMODE=1");
	MOVLW      ?lstr6_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,68 :: 		break;
	GOTO       L_esp_set_mode6
;esp8266-project.c,69 :: 		case 2:
L_esp_set_mode8:
;esp8266-project.c,70 :: 		UART1_Write_Text("AT+CWMODE=2");
	MOVLW      ?lstr7_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,71 :: 		break;
	GOTO       L_esp_set_mode6
;esp8266-project.c,72 :: 		case 3:
L_esp_set_mode9:
;esp8266-project.c,73 :: 		default:
L_esp_set_mode10:
;esp8266-project.c,74 :: 		UART1_Write_Text("AT+CWMODE=3");
	MOVLW      ?lstr8_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,75 :: 		break;
	GOTO       L_esp_set_mode6
;esp8266-project.c,76 :: 		}
L_esp_set_mode5:
	MOVLW      0
	XORWF      FARG_esp_set_mode_opmod+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__esp_set_mode42
	MOVLW      1
	XORWF      FARG_esp_set_mode_opmod+0, 0
L__esp_set_mode42:
	BTFSC      STATUS+0, 2
	GOTO       L_esp_set_mode7
	MOVLW      0
	XORWF      FARG_esp_set_mode_opmod+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__esp_set_mode43
	MOVLW      2
	XORWF      FARG_esp_set_mode_opmod+0, 0
L__esp_set_mode43:
	BTFSC      STATUS+0, 2
	GOTO       L_esp_set_mode8
	MOVLW      0
	XORWF      FARG_esp_set_mode_opmod+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__esp_set_mode44
	MOVLW      3
	XORWF      FARG_esp_set_mode_opmod+0, 0
L__esp_set_mode44:
	BTFSC      STATUS+0, 2
	GOTO       L_esp_set_mode9
	GOTO       L_esp_set_mode10
L_esp_set_mode6:
;esp8266-project.c,77 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,79 :: 		while(!UART1_Data_Ready());
L_esp_set_mode11:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_set_mode12
	GOTO       L_esp_set_mode11
L_esp_set_mode12:
;esp8266-project.c,81 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,83 :: 		if(response == 'O')
	MOVF       R0+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_esp_set_mode13
;esp8266-project.c,85 :: 		lcd_write("ESP OPMODE OK", 2, 1);
	MOVLW      ?lstr9_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,86 :: 		opmode = ON;
	MOVLW      1
	MOVWF      _opmode+0
;esp8266-project.c,87 :: 		}
	GOTO       L_esp_set_mode14
L_esp_set_mode13:
;esp8266-project.c,90 :: 		lcd_write("ESP OPMODE Bad", 2, 1);
	MOVLW      ?lstr10_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,91 :: 		opmode = OFF;
	CLRF       _opmode+0
;esp8266-project.c,92 :: 		}
L_esp_set_mode14:
;esp8266-project.c,93 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_esp_set_mode15:
	DECFSZ     R13+0, 1
	GOTO       L_esp_set_mode15
	DECFSZ     R12+0, 1
	GOTO       L_esp_set_mode15
	DECFSZ     R11+0, 1
	GOTO       L_esp_set_mode15
	NOP
;esp8266-project.c,94 :: 		}
	RETURN
; end of _esp_set_mode

_esp_wifi_connect:

;esp8266-project.c,96 :: 		void esp_wifi_connect()
;esp8266-project.c,98 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,99 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,100 :: 		lcd_write("ESP WiFi Connect", 1, 1);
	MOVLW      ?lstr11_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,101 :: 		UART1_Write_Text("AT+CWJAP=MInc Mobile,oluwaseun");
	MOVLW      ?lstr12_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,102 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,104 :: 		while(!UART1_Data_Ready());
L_esp_wifi_connect16:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_wifi_connect17
	GOTO       L_esp_wifi_connect16
L_esp_wifi_connect17:
;esp8266-project.c,106 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,108 :: 		if(response == 'O')
	MOVF       R0+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_esp_wifi_connect18
;esp8266-project.c,110 :: 		lcd_write("ESP WiFi OK", 2, 1);
	MOVLW      ?lstr13_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,111 :: 		wifi_status = ON;
	MOVLW      1
	MOVWF      _wifi_status+0
;esp8266-project.c,112 :: 		}
	GOTO       L_esp_wifi_connect19
L_esp_wifi_connect18:
;esp8266-project.c,115 :: 		lcd_write("ESP WiFi Bad", 2, 1);
	MOVLW      ?lstr14_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,116 :: 		wifi_status = OFF;
	CLRF       _wifi_status+0
;esp8266-project.c,117 :: 		}
L_esp_wifi_connect19:
;esp8266-project.c,118 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_esp_wifi_connect20:
	DECFSZ     R13+0, 1
	GOTO       L_esp_wifi_connect20
	DECFSZ     R12+0, 1
	GOTO       L_esp_wifi_connect20
	DECFSZ     R11+0, 1
	GOTO       L_esp_wifi_connect20
	NOP
;esp8266-project.c,119 :: 		}
	RETURN
; end of _esp_wifi_connect

_api_connect:

;esp8266-project.c,121 :: 		void api_connect()
;esp8266-project.c,123 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,124 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,125 :: 		lcd_write("Device-API Sync", 1, 1);
	MOVLW      ?lstr15_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,126 :: 		UART1_Write_Text("AT+CWJAP=MInc Mobile,oluwaseun");
	MOVLW      ?lstr16_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,127 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,129 :: 		while(!UART1_Data_Ready());
L_api_connect21:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_api_connect22
	GOTO       L_api_connect21
L_api_connect22:
;esp8266-project.c,131 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,133 :: 		if(response == 'O')
	MOVF       R0+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_api_connect23
;esp8266-project.c,135 :: 		lcd_write("ESP WiFi OK", 2, 1);
	MOVLW      ?lstr17_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,136 :: 		wifi_status = ON;
	MOVLW      1
	MOVWF      _wifi_status+0
;esp8266-project.c,137 :: 		}
	GOTO       L_api_connect24
L_api_connect23:
;esp8266-project.c,140 :: 		lcd_write("ESP WiFi Bad", 2, 1);
	MOVLW      ?lstr18_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,141 :: 		wifi_status = OFF;
	CLRF       _wifi_status+0
;esp8266-project.c,142 :: 		}
L_api_connect24:
;esp8266-project.c,143 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_api_connect25:
	DECFSZ     R13+0, 1
	GOTO       L_api_connect25
	DECFSZ     R12+0, 1
	GOTO       L_api_connect25
	DECFSZ     R11+0, 1
	GOTO       L_api_connect25
	NOP
;esp8266-project.c,144 :: 		}
	RETURN
; end of _api_connect

_main:

;esp8266-project.c,146 :: 		void main()
;esp8266-project.c,148 :: 		ADCON1 = 0x0F;
	MOVLW      15
	MOVWF      ADCON1+0
;esp8266-project.c,149 :: 		INTCON = 0;
	CLRF       INTCON+0
;esp8266-project.c,150 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;esp8266-project.c,151 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
;esp8266-project.c,153 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;esp8266-project.c,154 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;esp8266-project.c,155 :: 		TRISC = 0xC0;
	MOVLW      192
	MOVWF      TRISC+0
;esp8266-project.c,157 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;esp8266-project.c,158 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
;esp8266-project.c,159 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,160 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,161 :: 		lcd_write("DEVICE: MInc Dev", 1, 1);
	MOVLW      ?lstr19_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,162 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
;esp8266-project.c,163 :: 		lcd_write("STATUS: Offline", 2, 1);
	MOVLW      ?lstr20_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,164 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
;esp8266-project.c,166 :: 		while(ON)
L_main30:
;esp8266-project.c,168 :: 		PORTB.F7 = !PORTB.F7;
	MOVLW      128
	XORWF      PORTB+0, 1
;esp8266-project.c,169 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;esp8266-project.c,171 :: 		if(!esp_ok)
	MOVF       _esp_ok+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;esp8266-project.c,173 :: 		esp_init();
	CALL       _esp_init+0
;esp8266-project.c,174 :: 		}
	GOTO       L_main34
L_main33:
;esp8266-project.c,177 :: 		if(!opmode)
	MOVF       _opmode+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main35
;esp8266-project.c,179 :: 		esp_set_mode(3);
	MOVLW      3
	MOVWF      FARG_esp_set_mode_opmod+0
	MOVLW      0
	MOVWF      FARG_esp_set_mode_opmod+1
	CALL       _esp_set_mode+0
;esp8266-project.c,180 :: 		}
	GOTO       L_main36
L_main35:
;esp8266-project.c,183 :: 		if(!wifi_status)
	MOVF       _wifi_status+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main37
;esp8266-project.c,185 :: 		esp_wifi_connect();
	CALL       _esp_wifi_connect+0
;esp8266-project.c,186 :: 		}
	GOTO       L_main38
L_main37:
;esp8266-project.c,189 :: 		if(!device_status)
	MOVF       _device_status+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main39
;esp8266-project.c,192 :: 		api_connect();
	CALL       _api_connect+0
;esp8266-project.c,193 :: 		}
L_main39:
;esp8266-project.c,194 :: 		}
L_main38:
;esp8266-project.c,195 :: 		}
L_main36:
;esp8266-project.c,196 :: 		}
L_main34:
;esp8266-project.c,198 :: 		if(PORTA.F0 == ON)
	BTFSS      PORTA+0, 0
	GOTO       L_main40
;esp8266-project.c,201 :: 		}
L_main40:
;esp8266-project.c,203 :: 		if(PORTA.F3 == ON)
	BTFSS      PORTA+0, 3
	GOTO       L_main41
;esp8266-project.c,206 :: 		}
L_main41:
;esp8266-project.c,207 :: 		}
	GOTO       L_main30
;esp8266-project.c,208 :: 		}
	GOTO       $+0
; end of _main

_lcd_clear:

;esp8266-project.c,210 :: 		void lcd_clear()
;esp8266-project.c,212 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,213 :: 		}
	RETURN
; end of _lcd_clear

_lcd_write:

;esp8266-project.c,215 :: 		void lcd_write(unsigned char *msg, short int row, short int col)
;esp8266-project.c,217 :: 		Lcd_Out(row, col, msg);
	MOVF       FARG_lcd_write_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_lcd_write_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_lcd_write_msg+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;esp8266-project.c,218 :: 		}
	RETURN
; end of _lcd_write

_uart_move_cursor:

;esp8266-project.c,220 :: 		void uart_move_cursor()
;esp8266-project.c,222 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,223 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,224 :: 		}
	RETURN
; end of _uart_move_cursor
