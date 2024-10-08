//+------------------------------------------------------------------+
//|                                          encontrando_volumes.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.02"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   double volatility = CalculateHistoricalVolatility();
   if (volatility != -1)
   {
      Print("Volatilidade Histórica Anualizada: ", volatility);
   }
}
//+------------------------------------------------------------------+
double CalculateHistoricalVolatility(int period = 21)
{
   // Verifica se temos dados suficientes
   if (iBars(NULL, 0) < period + 1) // Verifica se há barras suficientes
   {
      Print("Dados insuficientes para o cálculo.");
      return -1;
   }

   // Vetor para armazenar os retornos logarítmicos diários
   double logReturns[];
   ArrayResize(logReturns, period);

   // Calcular os retornos logarítmicos diários
   for (int i = 0; i < period; i++)
   {
      double closeToday = iClose(NULL, 0, i);          // Preço de fechamento de hoje
      double closeYesterday = iClose(NULL, 0, i + 1);  // Preço de fechamento de ontem
      logReturns[i] = MathLog(closeToday / closeYesterday); // Calcula o retorno logarítmico
   }

   // Calcular a média dos retornos diários
   double meanReturn = 0.0;
   for (int i = 0; i < period; i++)
   {
      meanReturn += logReturns[i];
   }
   meanReturn /= period;

   // Calcular a variância dos retornos diários
   double variance = 0.0;
   for (int i = 0; i < period; i++)
   {
      variance += MathPow(logReturns[i] - meanReturn, 2);
   }
   variance /= (period - 1);

   // Calcular o desvio padrão (volatilidade diária)
   double stdDev = MathSqrt(variance);

   // Anualizar a volatilidade (supondo 252 dias úteis no ano)
   double annualVolatility = stdDev * MathSqrt(252);

   // Retornar a volatilidade anualizada
   return annualVolatility;
}