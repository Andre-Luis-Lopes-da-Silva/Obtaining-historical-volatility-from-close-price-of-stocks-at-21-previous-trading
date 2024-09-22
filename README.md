# Obtaining-historical-volatility-from-close-price-of-stocks-at-21-previous-trading

### Historical Volatility Calculation 
Historical volatility measures the past price fluctuations of a financial asset, typically a stock, over a specific time period. The calculation is based on the standard deviation of the asset's logarithmic returns (percentage changes in price) over a given period, such as the last 21 trading days.

### How it’s Calculated:
** Logarithmic Returns:** Daily price changes are transformed into logarithmic returns, which are calculated as the natural logarithm of the ratio between the current and previous closing prices.

**Mean Return: The average of these returns is computed to understand the typical daily price change over the period.

**Variance and Standard Deviation: The variance of the returns measures how much each return deviates from the mean. The square root of this variance gives the standard deviation (daily volatility).

**Annualization: Since volatility is often expressed annually, the daily volatility is scaled by multiplying it by the square root of the number of trading days in a year (commonly 252).

###Purpose:
Historical volatility helps assess how much an asset's price has fluctuated in the past, providing insights into the risk associated with the asset. It does not predict future volatility but gives a sense of how much price movement has occurred.

###Applications:
**Risk Management: Investors and traders use volatility to gauge the risk of an asset. Higher volatility implies greater uncertainty and potential for large price swings.
**Option Pricing: In options markets, volatility is a key input for pricing models like the Black-Scholes model. Higher volatility increases the premium of an option.
**Portfolio Diversification: Investors use historical volatility to diversify their portfolios by choosing assets with differing volatility levels to balance risk.
