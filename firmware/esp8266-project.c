#define DEVICE_NAME "MInc Dev"
#define DEVICE_KEY "MInc Systems"

#define SSID "MInc Mobile"
#define PASSWORD "oluwaseun"

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

char dev_online = 0;
char wifi_connected = 0;
char esp_responding = 0;
char *token;

void lcd_write(char *msg, short int row, short int col);
void lcd_clear();

void esp_init();
void esp_wifi_connect();

void uart_move_cursor();

void main()
{
 ADCON1 = 0x0F;
 INTCON = 0;
 UART1_Init(9600);
 Delay_ms(500);
 
 TRISA = 0xFF;
 TRISB = 0x00;
 TRISC = 0xC0;

 Lcd_init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 lcd_clear();
 lcd_write("DEVICE: MInc Dev", 1, 1);
 lcd_write("STATUS: Offline", 2, 1);
 Delay_ms(1500);
 lcd_clear();
 
 do
 {
  if(esp_responding != 1)
  {
   /*
   ** First thing to do is text the ESP8266 module for errors
   */
   lcd_write("Send AT Command.", 1, 1);
   esp_init();
   Delay_ms(1500);
  }

  if(esp_responding != 0)
  {
   /*
   ** Next thing to do is connect the ESP8266 module to the hosted network
   */
   if(!wifi_connected)
   {
    //Connect to wifi here
    //ESP_WIFI_CONNECT();
   }

   /*
   ** Next is to then check if the device already have a token, else we try and get a token for the device
   */
   if(!dev_online)
   {
     //Send HTTP POST Request to http://IP_ADDRESS:PORT_NUMBER/api/device/connect

   }

   /*
   ** If button connected to PortA0_bit is pushed, activate ESP8266 Module to send a get request to the API
   */
   if(PORTA.F0 == 1)
   {
    //Send HTTP GET Request to http://IP_ADDRESS:PORT_NUMBER/api/fruits

   }


   /*
   ** If button connected to PortA3_bit is pushed, activate ESP8266 Module to send a get request to the API
   */
   if(PORTA.F3 == 1)
   {
    //Send HTTP GET Request to http://IP_ADDRESS:PORT_NUMBER/api/device

   }
  }
 }
 while(1);
 
}

void lcd_clear()
{
 Lcd_Cmd(_LCD_CLEAR);
}

void lcd_write(unsigned char *msg, short int row, short int col)
{
 Lcd_Out(row, col, msg);
}

void esp_init()
{
 UART1_Write_Text("AT");
 uart_move_cursor();
 //Depending on input, we set if the ESP8266 module is responding
 esp_responding = 1;
}

void ESP_WIFI_CONNECT()
{}

void uart_move_cursor()
{
 UART1_Write(10);
 UART1_Write(13);
}