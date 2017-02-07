/*
 * File:   main.C
 * Author: HOLUWAS3UN
 *
 * Created on February 3, 2017, 6:07 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define _XTAL_FREQ 22118400
#define BAUDRATE 115200
#define SET 1
#define UNSET 0

#define RS RD2
#define EN RD3
#define D4 RD4
#define D5 RD5
#define D6 RD6
#define D7 RD7

// PIC16F877A Configuration Bit Settings

// 'C' source line config statements

// CONFIG
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = ON        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>
#include <pic16f877a.h>
#include "LiquidCrystalDisplay.h";
#include "UniversalAsyncReceiveTransmit.h";

char ESP_Response[8];

void main()
{
    unsigned char esp_ok = UNSET, op_mode = UNSET, wifi_connect = UNSET, device_status = UNSET;
    TRISD = 0x00;
    RB7 = UNSET;
    
    Lcd_Init();
    __delay_ms(100);
    UART_Init(BAUDRATE);
    __delay_ms(100);
    
    Lcd_Clear();
    Lcd_Set_Cursor(1,1);
    Lcd_Write_String("DEVICE: MInc Dev");
    Lcd_Set_Cursor(2,1);
    Lcd_Write_String("STATUS: Offline");
    __delay_ms(2500);
    
    while(SET)
    {
        __delay_ms(500);
        
        //Check ESP Device
        while(!esp_ok)
        {
            Lcd_Clear();
            Lcd_Set_Cursor(1,1);
            Lcd_Write_String("Send AT Command");
            __delay_ms(100);
            UART_Write_Text("AT");
            UART_Write(13);
            
            while(!UART_Data_Ready());
            
            if(UART_Data_Ready())
            {
                memset(ESP_Response, 0, sizeof(ESP_Response));
                UART_Read_Text(ESP_Response);
                __delay_ms(1000);
                Lcd_Set_Cursor(2,1);
                if(strcmp(ESP_Response, "OK") == 0)
                {
                    esp_ok = SET;
                    Lcd_Write_String("ESP Response OK");
                    //UART_Write_Text("\n\r");
                }
                else
                {
                    Lcd_Write_String("ESP Response Bad");
                    __delay_ms(1000);
                    Lcd_Write_String(ESP_Response);
                    __delay_ms(500);
                    //UART_Write_Text("\n\r");
                }
                __delay_ms(500);
            }
        }
	
        //Set ESP Operation Mode
        while(!op_mode)
        {
            Lcd_Clear();
            Lcd_Set_Cursor(1,1);
            Lcd_Write_String("Set Op. Mode");
            __delay_ms(100);
            UART_Write_Text("AT+CWMODE=3");
            //UART_Write_Text("\n\r");

            while(!UART_Data_Ready());

            if(UART_Data_Ready())
            {
                memset(ESP_Response, 0, sizeof(ESP_Response));
                UART_Read_Text(ESP_Response);
                __delay_ms(1000);
                Lcd_Set_Cursor(2,1);
                if(strcmp(ESP_Response, "OK") == 0)
                {
                    op_mode = SET;
                    Lcd_Write_String("Op Mode Set OK");
                    //UART_Write_Text("\n\r");
                }
                else
                {
                    Lcd_Write_String("Op Mode Set Fail");
                    //UART_Write_Text("\n\r");
                }
                __delay_ms(500);
            }
        }

        //Connect ESP to WiFi Network
        while(!wifi_connect)
        {
            Lcd_Clear();
            Lcd_Set_Cursor(1,1);
            Lcd_Write_String("WiFi Connection");
            __delay_ms(100);
            UART_Write_Text("AT+CWJAP='MInc Mobile','oluwaseun'");
            //UART_Write_Text("\n\r");

            while(!UART_Data_Ready());

            if(UART_Data_Ready())
            {
                memset(ESP_Response, 0, sizeof(ESP_Response));
                UART_Read_Text(ESP_Response);
                __delay_ms(1000);
                Lcd_Set_Cursor(2,1);
                if(strcmp(ESP_Response, "OK") == 0)
                {
                    wifi_connect = SET;
                    Lcd_Write_String("WiFi Connect OK");
                    //UART_Write_Text("\n\r");
                }
                else
                {
                    Lcd_Write_String("WiFi Connect Fail");
                    //UART_Write_Text("\n\r");
                }
                __delay_ms(500);
            }
        }
    }
}