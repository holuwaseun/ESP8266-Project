
_main:

;esp8266-project.c,30 :: 		void main()
;esp8266-project.c,32 :: 		ADCON1 = 0x0F;
	MOVLW      15
	MOVWF      ADCON1+0
;esp8266-project.c,33 :: 		INTCON = 0;
	CLRF       INTCON+0
;esp8266-project.c,34 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;esp8266-project.c,35 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;esp8266-project.c,37 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;esp8266-project.c,38 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;esp8266-project.c,39 :: 		TRISC = 0xC0;
	MOVLW      192
	MOVWF      TRISC+0
;esp8266-project.c,41 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;esp8266-project.c,42 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;esp8266-project.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,44 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,45 :: 		lcd_write("DEVICE: MInc Dev", 1, 1);
	MOVLW      ?lstr1_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,46 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;esp8266-project.c,47 :: 		lcd_write("STATUS: Offline", 2, 1);
	MOVLW      ?lstr2_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      2
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,48 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;esp8266-project.c,50 :: 		do
L_main4:
;esp8266-project.c,52 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,53 :: 		if(!esp_responding)
	MOVF       _esp_responding+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;esp8266-project.c,58 :: 		lcd_write("Send AT Command", 1, 1);
	MOVLW      ?lstr3_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,59 :: 		esp_init();
	CALL       _esp_init+0
;esp8266-project.c,60 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
;esp8266-project.c,61 :: 		}
L_main7:
;esp8266-project.c,63 :: 		if(esp_responding)
	MOVF       _esp_responding+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;esp8266-project.c,68 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,69 :: 		if(!opmode_set)
	MOVF       _opmode_set+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;esp8266-project.c,71 :: 		lcd_write("ESP OPMODE SET", 1, 1);
	MOVLW      ?lstr4_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,72 :: 		esp_set_mode(3);
	MOVLW      3
	MOVWF      FARG_esp_set_mode_opmode+0
	CALL       _esp_set_mode+0
;esp8266-project.c,73 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;esp8266-project.c,74 :: 		}
L_main10:
;esp8266-project.c,79 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,80 :: 		if(!wifi_connected)
	MOVF       _wifi_connected+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;esp8266-project.c,82 :: 		lcd_write("ESP WIFI CONNECT", 1, 1);
	MOVLW      ?lstr5_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,83 :: 		esp_wifi_connect();
	CALL       _esp_wifi_connect+0
;esp8266-project.c,84 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
;esp8266-project.c,85 :: 		}
L_main12:
;esp8266-project.c,90 :: 		if(!dev_online)
	MOVF       _dev_online+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;esp8266-project.c,94 :: 		}
L_main14:
;esp8266-project.c,99 :: 		if(PORTA.F0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main15
;esp8266-project.c,103 :: 		}
L_main15:
;esp8266-project.c,109 :: 		if(PORTA.F3 == 1)
	BTFSS      PORTA+0, 3
	GOTO       L_main16
;esp8266-project.c,113 :: 		}
L_main16:
;esp8266-project.c,114 :: 		}
L_main9:
;esp8266-project.c,116 :: 		while(1);
	GOTO       L_main4
;esp8266-project.c,118 :: 		}
	GOTO       $+0
; end of _main

_lcd_clear:

;esp8266-project.c,120 :: 		void lcd_clear()
;esp8266-project.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;esp8266-project.c,123 :: 		}
	RETURN
; end of _lcd_clear

_lcd_write:

;esp8266-project.c,125 :: 		void lcd_write(unsigned char *msg, short int row, short int col)
;esp8266-project.c,127 :: 		Lcd_Out(row, col, msg);
	MOVF       FARG_lcd_write_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_lcd_write_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_lcd_write_msg+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;esp8266-project.c,128 :: 		}
	RETURN
; end of _lcd_write

_esp_init:

;esp8266-project.c,130 :: 		void esp_init()
;esp8266-project.c,132 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,133 :: 		UART1_Write_Text("AT");
	MOVLW      ?lstr6_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,134 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,136 :: 		while(!UART1_Data_Ready());
L_esp_init17:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_init18
	GOTO       L_esp_init17
L_esp_init18:
;esp8266-project.c,138 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,140 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,141 :: 		if(response == 'O')
	MOVF       _response+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_esp_init19
;esp8266-project.c,143 :: 		lcd_write("ESP Module OK", 1, 1);
	MOVLW      ?lstr7_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,144 :: 		esp_responding = 1;
	MOVLW      1
	MOVWF      _esp_responding+0
;esp8266-project.c,145 :: 		}
	GOTO       L_esp_init20
L_esp_init19:
;esp8266-project.c,148 :: 		lcd_write("ESP Module Bad", 1, 1);
	MOVLW      ?lstr8_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,149 :: 		esp_responding = 0;
	CLRF       _esp_responding+0
;esp8266-project.c,150 :: 		}
L_esp_init20:
;esp8266-project.c,151 :: 		}
	RETURN
; end of _esp_init

_esp_set_mode:

;esp8266-project.c,153 :: 		void esp_set_mode(short int opmode)
;esp8266-project.c,155 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,156 :: 		switch(opmode)
	GOTO       L_esp_set_mode21
;esp8266-project.c,158 :: 		case 1:
L_esp_set_mode23:
;esp8266-project.c,159 :: 		UART1_Write_Text("AT+CWMODE=1");
	MOVLW      ?lstr9_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,160 :: 		break;
	GOTO       L_esp_set_mode22
;esp8266-project.c,161 :: 		case 2:
L_esp_set_mode24:
;esp8266-project.c,162 :: 		UART1_Write_Text("AT+CWMODE=2");
	MOVLW      ?lstr10_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,163 :: 		break;
	GOTO       L_esp_set_mode22
;esp8266-project.c,164 :: 		case 3:
L_esp_set_mode25:
;esp8266-project.c,165 :: 		default:
L_esp_set_mode26:
;esp8266-project.c,166 :: 		UART1_Write_Text("AT+CWMODE=3");
	MOVLW      ?lstr11_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,167 :: 		break;
	GOTO       L_esp_set_mode22
;esp8266-project.c,168 :: 		}
L_esp_set_mode21:
	MOVF       FARG_esp_set_mode_opmode+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_esp_set_mode23
	MOVF       FARG_esp_set_mode_opmode+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_esp_set_mode24
	MOVF       FARG_esp_set_mode_opmode+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_esp_set_mode25
	GOTO       L_esp_set_mode26
L_esp_set_mode22:
;esp8266-project.c,169 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,171 :: 		while(!UART1_Data_Ready());
L_esp_set_mode27:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_set_mode28
	GOTO       L_esp_set_mode27
L_esp_set_mode28:
;esp8266-project.c,173 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,175 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,176 :: 		if(response == 'O')
	MOVF       _response+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_esp_set_mode29
;esp8266-project.c,178 :: 		lcd_write("ESP OPMODE: 3", 1, 1);
	MOVLW      ?lstr12_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,179 :: 		opmode_set = 1;
	MOVLW      1
	MOVWF      _opmode_set+0
;esp8266-project.c,180 :: 		}
	GOTO       L_esp_set_mode30
L_esp_set_mode29:
;esp8266-project.c,183 :: 		lcd_write("ESP OPMODE: FAIL", 1, 1);
	MOVLW      ?lstr13_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,184 :: 		opmode_set = 0;
	CLRF       _opmode_set+0
;esp8266-project.c,185 :: 		}
L_esp_set_mode30:
;esp8266-project.c,186 :: 		}
	RETURN
; end of _esp_set_mode

_esp_wifi_connect:

;esp8266-project.c,188 :: 		void esp_wifi_connect()
;esp8266-project.c,190 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,191 :: 		UART1_Write_Text("AT+CWJAP=MInc Mobile,oluwaseun");
	MOVLW      ?lstr14_esp8266_45project+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;esp8266-project.c,192 :: 		uart_move_cursor();
	CALL       _uart_move_cursor+0
;esp8266-project.c,194 :: 		while(!UART1_Data_Ready());
L_esp_wifi_connect31:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_esp_wifi_connect32
	GOTO       L_esp_wifi_connect31
L_esp_wifi_connect32:
;esp8266-project.c,196 :: 		response = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _response+0
;esp8266-project.c,198 :: 		lcd_clear();
	CALL       _lcd_clear+0
;esp8266-project.c,199 :: 		if(response == 'O')
	MOVF       _response+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_esp_wifi_connect33
;esp8266-project.c,201 :: 		lcd_write("WiFi Connect OK", 1, 1);
	MOVLW      ?lstr15_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,202 :: 		wifi_connected = 1;
	MOVLW      1
	MOVWF      _wifi_connected+0
;esp8266-project.c,203 :: 		}
	GOTO       L_esp_wifi_connect34
L_esp_wifi_connect33:
;esp8266-project.c,206 :: 		lcd_write("WiFi Connect Bad", 1, 1);
	MOVLW      ?lstr16_esp8266_45project+0
	MOVWF      FARG_lcd_write_msg+0
	MOVLW      1
	MOVWF      FARG_lcd_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd_write_col+0
	CALL       _lcd_write+0
;esp8266-project.c,207 :: 		wifi_connected = 1;
	MOVLW      1
	MOVWF      _wifi_connected+0
;esp8266-project.c,208 :: 		}
L_esp_wifi_connect34:
;esp8266-project.c,209 :: 		}
	RETURN
; end of _esp_wifi_connect

_uart_move_cursor:

;esp8266-project.c,211 :: 		void uart_move_cursor()
;esp8266-project.c,213 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,214 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esp8266-project.c,215 :: 		}
	RETURN
; end of _uart_move_cursor
