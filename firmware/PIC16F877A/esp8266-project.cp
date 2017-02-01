#line 1 "C:/Users/HOLUWAS3UN/Documents/ESP8266-Project/firmware/PIC16F877A/esp8266-project.c"



sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

char device_status =  0 ;
char wifi_status =  0 ;
char esp_ok =  0 ;
char opmode =  0 ;
char *token;
char response;

void lcd_write(char *msg, short int row, short int col);
void lcd_clear();

void esp_init();
void esp_set_mode(int opmod);
void esp_wifi_connect();

void api_connect();

void uart_move_cursor();

void esp_init()
{
 lcd_clear();
 lcd_write("Send AT Comm.", 1, 1);
 UART1_Write_Text("AT");
 uart_move_cursor();

 while(!UART1_Data_Ready());

 response = UART1_Read();

 if(response == 'O')
 {
 lcd_write("ESP Module OK", 2, 1);
 esp_ok =  1 ;
 }
 else
 {
 lcd_write("ESP Module Bad", 2, 1);
 esp_ok =  0 ;
 }
 Delay_ms(3000);
}

void esp_set_mode(int opmod)
{
 lcd_clear();
 uart_move_cursor();
 lcd_write("Set Op Mode.", 1, 1);
 switch(opmod)
 {
 case 1:
 UART1_Write_Text("AT+CWMODE=1");
 break;
 case 2:
 UART1_Write_Text("AT+CWMODE=2");
 break;
 case 3:
 default:
 UART1_Write_Text("AT+CWMODE=3");
 break;
 }
 uart_move_cursor();

 while(!UART1_Data_Ready());

 response = UART1_Read();

 if(response == 'O')
 {
 lcd_write("ESP OPMODE OK", 2, 1);
 opmode =  1 ;
 }
 else
 {
 lcd_write("ESP OPMODE Bad", 2, 1);
 opmode =  0 ;
 }
 Delay_ms(3000);
}

void esp_wifi_connect()
{
 lcd_clear();
 uart_move_cursor();
 lcd_write("ESP WiFi Connect", 1, 1);
 UART1_Write_Text("AT+CWJAP=MInc Mobile,oluwaseun");
 uart_move_cursor();

 while(!UART1_Data_Ready());

 response = UART1_Read();

 if(response == 'O')
 {
 lcd_write("ESP WiFi OK", 2, 1);
 wifi_status =  1 ;
 }
 else
 {
 lcd_write("ESP WiFi Bad", 2, 1);
 wifi_status =  0 ;
 }
 Delay_ms(3000);
}

void api_connect()
{
 lcd_clear();
 uart_move_cursor();
 lcd_write("Device-API Sync", 1, 1);
 UART1_Write_Text("AT+CWJAP=MInc Mobile,oluwaseun");
 uart_move_cursor();

 while(!UART1_Data_Ready());

 response = UART1_Read();

 if(response == 'O')
 {
 lcd_write("ESP WiFi OK", 2, 1);
 wifi_status =  1 ;
 }
 else
 {
 lcd_write("ESP WiFi Bad", 2, 1);
 wifi_status =  0 ;
 }
 Delay_ms(3000);
}

void main()
{
 ADCON1 = 0x0F;
 INTCON = 0;
 UART1_Init(9600);
 Delay_ms(2000);

 TRISA = 0xFF;
 TRISB = 0x00;
 TRISC = 0xC0;

 Lcd_init();
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 lcd_clear();
 lcd_write("DEVICE: MInc Dev", 1, 1);
 Delay_ms(3000);
 lcd_write("STATUS: Offline", 2, 1);
 Delay_ms(5000);

 while( 1 )
 {
 PORTB.F7 = !PORTB.F7;
 Delay_ms(1000);

 if(!esp_ok)
 {
 esp_init();
 }
 else
 {
 if(!opmode)
 {
 esp_set_mode(3);
 }
 else
 {
 if(!wifi_status)
 {
 esp_wifi_connect();
 }
 else
 {
 if(!device_status)
 {

 api_connect();
 }
 }
 }
 }

 if(PORTA.F0 ==  1 )
 {

 }

 if(PORTA.F3 ==  1 )
 {

 }
 }
}

void lcd_clear()
{
 Lcd_Cmd(_LCD_CLEAR);
}

void lcd_write(unsigned char *msg, short int row, short int col)
{
 Lcd_Out(row, col, msg);
}

void uart_move_cursor()
{
 UART1_Write(10);
 UART1_Write(13);
}
