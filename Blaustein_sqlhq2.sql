CREATE SCHEMA stocks_db;

INSERT INTO current_portfolio VALUES ("BRK-B", 50, '2023-6-22',336.96, 361.80);
INSERT INTO current_portfolio VALUES ("AMZN", 30, '2022-5-05',116.41, 137.85);
INSERT INTO current_portfolio VALUES ("AAPL", 18, '2022-8-11', 168.49,177.56);
INSERT INTO current_portfolio VALUES ("WMT", 12, '2023-3-20', 140.90, 163.47);
INSERT INTO current_portfolio VALUES ("META", 29, '2022-2-28',211.03,298.67);
select * from stocks_db.current_portfolio;
INSERT INTO company_info VALUES ("Berkshire Hathaway Inc.", "BRK-B", "Insurance—Diversified");
INSERT INTO company_info VALUES ("Amazon.com, Inc.", "AMZN","Internet Retail");
INSERT INTO company_info VALUES ("Apple Inc.", "AAPL","Consumer Electronics");
INSERT INTO company_info VALUES ("Walmart Inc.", "WMT","Discount Stores");
INSERT INTO company_info VALUES ("Meta Platforms, Inc.", "META", "Internet Content & Information");
select * from stocks_db.company_info;
-- Value = current_price * num_shares 
Select company_info.company_name as "Company Name", current_portfolio.stock_ticker as "Ticker", current_portfolio.num_shares as "# Shares", CONCAT('$', (current_portfolio.num_shares * current_portfolio.current_price)) AS Value
 from current_portfolio, company_info where current_portfolio.stock_ticker=company_info.stock_ticker;


