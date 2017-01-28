
_main:

;esp8266-project.c,33 :: 		void main()
;esp8266-project.c,35 :: 		ADCON1 = 0x0F;
	MOVLW      15
	MOVWF      ADCON1+0
;esp8266-project.c,36 :: 		INTCON = 0;
	CLRF       INTCON+0
;esp8266-project.c,37 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;esp8266-project.c,38 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;esp8266-project.c,40 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;esp8266-project.c,41 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;esp8266-project.c,42 :: 		TRISC = 0xC0;
	MOVLW      192
	MOVWF      TRISC+0
;esp8266-project.c,44 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;esp8266-project.c,45 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,46 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,47 :: 		lcd_write("DEVICE: MInc Dev", 1, 1);
	MOVLW      ?lstr1_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,48 :: 		lcd_write("STATUS: Offline", 2, 1);
	MOVLW      ?lstr2_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,49 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;esp8266-project.c,50 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,52 :: 		do
L_main2:
;esp8266-project.c,54 :: 		if(esp_responding != 1)
	MOVF       _esp_responding+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;esp8266-project.c,59 :: 		lcd_write("Send AT Command.", 1, 1);
	MOVLW      ?lstr3_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,60 :: 		esp_init();
	CALL       _esp_init+0
;esp8266-project.c,61 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;esp8266-project.c,62 :: 		}
L_main5:
;esp8266-project.c,64 :: 		if(esp_responding != 0)
	MOVF       _esp_responding+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;esp8266-project.c,69 :: 		if(!wifi_connected)
	MOVF       _wifi_connected+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;esp8266-project.c,73 :: 		}
L_main8:
;esp8266-project.c,78 :: 		if(!dev_online)
	MOVF       _dev_online+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;esp8266-project.c,82 :: 		}
L_main9:
;esp8266-project.c,87 :: 		if(PORTA.F0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main10
;esp8266-project.c,91 :: 		}
L_main10:
;esp8266-project.c,97 :: 		if(PORTA.F3 == 1)
	BTFSS      PORTA+0, 3
	GOTO       L_main11
;esp8266-project.c,101 :: 		}
L_main11:
;esp8266-project.c,102 :: 		}
L_main7:
;esp8266-project.c,104 :: 		while(1);
	GOTO       L_main2
;esp8266-project.c,106 :: 		}
	GOTO       $+0
; end of _main

_lcd_clear:

;esp8266-project.c,108 :: 		void lcd_clear()
;esp8266-project.c,110 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,111 :: 		}
	RETURN
; end of _lcd_clear

_lcd_write:

;esp8266-project.c,113 :: 		void lcd_write(unsigned char *msg, short int row, short int col)
;esp8266-project.c,115 :: 		Lcd_Out(row, col, msg);
	MOVF       FARG_lcd_write_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_lcd_write_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_lcd_write_msg+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;esp8266-project.c,116 :: 		}
	RETURN
; end of _lcd_write

_esp_init:

;esp8266-project.c,118 :: 		void esp_init()
;esp8266-project.c,120 :: 		UART1_Write_Text("AT");
	MOVLW      ?lstr4_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,121 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,123 :: 		esp_responding = 1;
	MOVLW      1
	MOVWF      _esp_responding+0
;esp8266-project.c,124 :: 		}
	RETURN
; end of _esp_init

_ESP_WIFI_CONNECT:

;esp8266-project.c,126 :: 		void ESP_WIFI_CONNECT()
;esp8266-project.c,127 :: 		{}
	RETURN
; end of _ESP_WIFI_CONNECT

_uart_move_cursor:

;esp8266-project.c,129 :: 		void uart_move_cursor()
;esp8266-project.c,131 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,132 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,133 :: 		}
	RETURN
; end of _uart_move_cursor
