char UART_Init(const long int baudrate)
{
	unsigned int x;
	x = (_XTAL_FREQ - baudrate * 64) / (baudrate * 64);
	if(x > 255)
	{
		x = (_XTAL_FREQ - baudrate * 16) / (baudrate * 16);
		BRGH = 1;
	}
    
	if( x < 256)
	{
        SPBRG = x;
        SYNC = 0;
        SPEN = 1;
        TRISC7 = 1;
        TRISC6 = 0;
        CREN = 1;
        TXEN = 1;
        return 1;
	}
	return 0;
}

char UART_TX_Empty()
{
    return TRMT;
}

char UART_Data_Ready()
{
   return RCIF;
}

char UART_Read()
{
    while(!RCIF);
    return RCREG;
}

void UART_Read_Text(char *buffer)
{
	unsigned char rec_data;
	
	// Read the data until Line Feed character is received.
    int i = 0;
	do
    {
		rec_data = UART_Read();
		buffer[i] = rec_data;
        i++;
	}while(i < 2); //Check for EOF
}

void UART_Write(char data)
{
    while(!TRMT);
    TXREG = data;
}

void UART_Write_Text(const unsigned char *text)
{
  int i;
  for(i = 0; text[i] != '\0'; i++)
  {
	UART_Write(text[i]);
  }
}