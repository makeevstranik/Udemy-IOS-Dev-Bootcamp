import Foundation

class CurrencyManager {
    let queryService = QueryService()
    let currencyArray = ["USD", "EUR", "GBP", "KZT", "KGS", "CNY", "TJS", "TRY", "UZS", "UAH", "CZK", "CHF", "JPY", "AUD", "AZN", "AMD", "BYN"]
    var delegate: CurrencyManagerDelegate?
    var updatedData: DataForUpdateView?
    
    func fetchCurrency(ticker: String) {
        
        queryService.getSearchResults(completionHandler: { [weak self] currencyData, error in
            if let currencyParsedData = currencyData {
                if let dataForUpdateView = self?.getDataForUpdateView(ticker, currencyParsedData) {
                    self?.updatedData = dataForUpdateView
                    self?.delegate?.didUpdateCourse(dataForUpdateView)
                }
            }
            if !error.isEmpty {
                self?.delegate?.didFailWithError(error)
            }
        })
    }
    
    private func getDataForUpdateView(_ ticker: String,_ data: CurrencyData) -> DataForUpdateView? {
        guard let item = data.Valute[ticker] else { return nil }
        let course = item.Value / Double(item.Nominal)
        let previousCourse = item.Previous / Double(item.Nominal)
        let time = timeFormater(data.Date)
        let previousTime = timeFormater(data.PreviousDate)
        let change = (course - previousCourse) * 100 / previousCourse 
        let backCourse = 1.0 / course
        let previousBackCourse = 1.0 / previousCourse
        
        return DataForUpdateView(ticker: ticker,
                                 time: time,
                                 previousTime: previousTime,
                                 course: String(format: "%.4f", course),
                                 previousCourse: String(format: "%.4f", previousCourse),
                                 change: String(format: "%.2f", change) + "%",
                                 backCourse: String(format: "%.4f", backCourse),
                                 previousBackCourse: String(format: "%.4f", previousBackCourse)
        )
    }
    private func timeFormater(_ time: String) -> String {
        String(time.prefix(16).map { el in
            switch el {
                case "-": return "."
                case "T": return "/"
                default: return el
            }
        })
    }
}





