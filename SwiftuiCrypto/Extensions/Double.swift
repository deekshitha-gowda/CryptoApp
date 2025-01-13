import Foundation

extension Double{
    /// Creates a Double into a currency with 2-6 decimal places
    /// ```
    /// Converts 3456.78 to $3,456.78
    /// Converts 12.3456 to $12.3456
    /// Converts 0.123456 to $0.123456
    ///    ```
    
    
    private var currencyFormatter2: NumberFormatter {
       let formatter =  NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // this is default value
        formatter.currencyCode = "USD" // change currency
        formatter.currencySymbol = "$" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
        
    }
    ///Converts a double into currency as a string with 2-6 decimal value
    ///```
    ///convert 1234.56 to "1,234.56"
    ///```
    
    func asCurrencyWith2DecimalPlaces() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number ) ?? "$0.00"
    }
    
    
    private var currencyFormatter6: NumberFormatter {
       let formatter =  NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // this is default value
        formatter.currencyCode = "USD" // change currency
        formatter.currencySymbol = "$" // change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
        
    }
    ///Converts a double into currency as a string with 2-6 decimal value
    ///```
    ///convert 1234.56 to "1,234.56"
    ///```
    
    func asCurrencyWith6DecimalPlaces() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number ) ?? "$0.00"
    }
    /// converts a double into string representation
    ///```
    ///converts 1.2345 to "1.24"
    ///```
    ///
    func asNumberString() -> String{
        
        return String(format: "%.2f", self)
    }
    /// converts a double into string representation with percentage
    ///```
    ///converts 1.2345 to "1.24%"
    ///```
   
    func asPercentage() -> String{
        return asNumberString() + "%"
    }
}
