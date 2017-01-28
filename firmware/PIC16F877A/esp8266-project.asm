
_main:

;esp8266-project.c,35 :: 		void main()
;esp8266-project.c,37 :: 		ADCON1 = 0x0F;
	MOVLW      15
	MOVWF      ADCON1+0
;esp8266-project.c,38 :: 		INTCON = 0;
	CLRF       INTCON+0
;esp8266-project.c,39 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;esp8266-project.c,40 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;esp8266-project.c,42 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;esp8266-project.c,43 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;esp8266-project.c,44 :: 		TRISC = 0xC0;
	MOVLW      192
	MOVWF      TRISC+0
;esp8266-project.c,46 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;esp8266-project.c,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,48 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,49 :: 		lcd_write("DEVICE: MInc Dev", 1, 1);
	MOVLW      ?lstr1_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,50 :: 		lcd_write("STATUS: Offline", 2, 1);
	MOVLW      ?lstr2_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,51 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;esp8266-project.c,52 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,54 :: 		do
L_main2:
;esp8266-project.c,56 :: 		if(esp_responding != 1)
	MOVF       _esp_responding+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;esp8266-project.c,61 :: 		lcd_write("Send AT Command.", 1, 1);
	MOVLW      ?lstr3_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,62 :: 		esp_init();
	CALL       _esp_init+0
;esp8266-project.c,63 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;esp8266-project.c,64 :: 		}
L_main5:
;esp8266-project.c,66 :: 		if(esp_responding != 0)
	MOVF       _esp_responding+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;esp8266-project.c,72 :: 		if(!dev_online)
	MOVF       _dev_online+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;esp8266-project.c,76 :: 		}
L_main8:
;esp8266-project.c,81 :: 		if(PORTA.F0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main9
;esp8266-project.c,85 :: 		}
L_main9:
;esp8266-project.c,91 :: 		if(PORTA.F3 == 1)
	BTFSS      PORTA+0, 3
	GOTO       L_main10
;esp8266-project.c,95 :: 		}
L_main10:
;esp8266-project.c,96 :: 		}
L_main7:
;esp8266-project.c,98 :: 		while(1);
	GOTO       L_main2
;esp8266-project.c,100 :: 		}
	GOTO       $+0
; end of _main

_lcd_clear:

;esp8266-project.c,102 :: 		void lcd_clear()
;esp8266-project.c,104 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,105 :: 		}
	RETURN
; end of _lcd_clear

_lcd_write:

;esp8266-project.c,107 :: 		void lcd_write(unsigned char *msg, short int row, short int col)
;esp8266-project.c,109 :: 		Lcd_Out(row, col, msg);
	MOVF       FARG_lcd_write_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_lcd_write_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_lcd_write_msg+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;esp8266-project.c,110 :: 		}
	RETURN
; end of _lcd_write

_esp_init:

;esp8266-project.c,112 :: 		void esp_init()
;esp8266-project.c,114 :: 		UART1_Write_Text("AT");
	MOVLW      ?lstr4_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,115 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,117 :: 		while(!UART1_Data_Ready());
L_esp_init11:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_init12
	GOTO       L_esp_init11
L_esp_init12:
;esp8266-project.c,119 :: 		UART1_Read_Text(response, "\0", 2);
	MOVF       _response+0, 0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr5_esp8266_45project+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      2
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;esp8266-project.c,121 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,122 :: 		if(strcmp("OK", response) == 0)
	MOVLW      ?lstr6_esp8266_45project+0
	MOVWF      FARG_strcmp_s1+0
	MOVF       _response+0, 0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__esp_init23
	MOVLW      0
	XORWF      R0+0, 0
L__esp_init23:
	BTFSS      STATUS+0, 2
	GOTO       L_esp_init13
;esp8266-project.c,124 :: 		lcd_write("ESP Module OK", 1, 1);
	MOVLW      ?lstr7_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,125 :: 		esp_responding = 1;
	MOVLW      1
	MOVWF      _esp_responding+0
;esp8266-project.c,126 :: 		}
	GOTO       L_esp_init14
L_esp_init13:
;esp8266-project.c,129 :: 		lcd_write("ESP Module Bad", 1, 1);
	MOVLW      ?lstr8_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,130 :: 		esp_responding = 0;
	CLRF       _esp_responding+0
;esp8266-project.c,131 :: 		}
L_esp_init14:
;esp8266-project.c,132 :: 		}
	RETURN
; end of _esp_init

_esp_set_mode:

;esp8266-project.c,134 :: 		void esp_set_mode()
;esp8266-project.c,136 :: 		UART1_Write_Text("AT+CWMODE=3");
	MOVLW      ?lstr9_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,137 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,139 :: 		while(!UART1_Data_Ready());
L_esp_set_mode15:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_set_mode16
	GOTO       L_esp_set_mode15
L_esp_set_mode16:
;esp8266-project.c,141 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,143 :: 		if(strcmp("OK", response) == 0)
	MOVLW      ?lstr10_esp8266_45project+0
	MOVWF      FARG_strcmp_s1+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__esp_set_mode24
	MOVLW      0
	XORWF      R0+0, 0
L__esp_set_mode24:
	BTFSS      STATUS+0, 2
	GOTO       L_esp_set_mode17
;esp8266-project.c,145 :: 		lcd_write("ESP OPMODE: 3", 1, 1);
	MOVLW      ?lstr11_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,146 :: 		}
	GOTO       L_esp_set_mode18
L_esp_set_mode17:
;esp8266-project.c,149 :: 		lcd_write("ESP OPMODE FAIL", 1, 1);
	MOVLW      ?lstr12_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,150 :: 		}
L_esp_set_mode18:
;esp8266-project.c,151 :: 		}
	RETURN
; end of _esp_set_mode

_esp_wifi_connect:

;esp8266-project.c,153 :: 		void esp_wifi_connect()
;esp8266-project.c,155 :: 		UART1_Write_Text("AT+CWJAP=MInc Mobile,oluwaseun");
	MOVLW      ?lstr13_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,156 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,158 :: 		while(!UART1_Data_Ready());
L_esp_wifi_connect19:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_wifi_connect20
	GOTO       L_esp_wifi_connect19
L_esp_wifi_connect20:
;esp8266-project.c,160 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,162 :: 		if(strcmp("OK", response) == 0)
	MOVLW      ?lstr14_esp8266_45project+0
	MOVWF      FARG_strcmp_s1+0
	MOVF       R0+0, 0
	MOVWF      FARG_strcmp_s2+0
	CALL       _strcmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__esp_wifi_connect25
	MOVLW      0
	XORWF      R0+0, 0
L__esp_wifi_connect25:
	BTFSS      STATUS+0, 2
	GOTO       L_esp_wifi_connect21
;esp8266-project.c,164 :: 		lcd_write("WiFi Connect OK", 1, 1);
	MOVLW      ?lstr15_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,165 :: 		wifi_connected = 1;
	MOVLW      1
	MOVWF      _wifi_connected+0
;esp8266-project.c,166 :: 		}
	GOTO       L_esp_wifi_connect22
L_esp_wifi_connect21:
;esp8266-project.c,169 :: 		lcd_write("WiFi Connect Bad", 1, 1);
	MOVLW      ?lstr16_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,170 :: 		wifi_connected = 1;
	MOVLW      1
	MOVWF      _wifi_connected+0
;esp8266-project.c,171 :: 		}
L_esp_wifi_connect22:
;esp8266-project.c,172 :: 		}
	RETURN
; end of _esp_wifi_connect

_uart_move_cursor:

;esp8266-project.c,174 :: 		void uart_move_cursor()
;esp8266-project.c,176 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,177 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,178 :: 		}
	RETURN
; end of _uart_move_cursor
