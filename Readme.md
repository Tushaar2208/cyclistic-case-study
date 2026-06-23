Cyclistic Bike-Share: Member vs. Casual Analysis \& Conversion Strategy
📌 Executive Summary
Cyclistic, a bike-share company in Chicago, relies on maximizing annual memberships for long-term profitability. While the company has a strong base of "Casual" riders (those who purchase single-ride or full-day passes), the core business objective is to design a targeted marketing strategy to convert these casual riders into profitable Annual Members.

This project analyzes over 5.41 million historical bike trips to understand the distinct behavioral differences between Casual riders and Annual Members. By establishing a robust cloud-based data pipeline to bypass standard local hardware limits, the resulting analysis isolates specific geographic hubs, riding schedules, and equipment preferences to formulate a highly targeted conversion campaign.

🛠️ The Tech Stack
Database \& Data Engineering: Google Cloud, BigQuery (SQL)

Data Visualization \& Modeling: Microsoft Power BI, Power Query, DAX

Version Control: Git, GitHub

Data Source: The raw dataset contains 12 months of historical trip data provided by Motivate International Inc. Due to the 5.4+ million row count exceeding GitHub's file limits, the raw CSVs are not hosted in this repository.

⚙️ Data Engineering Methodology
Processing millions of rows of data crashes standard spreadsheet applications. To ensure accuracy and performance, I architected an industry-standard analytics pipeline:

Cloud Aggregation (01\_data\_aggregation.sql): Ingested 12 independent CSV files into Google BigQuery. Utilized UNION ALL statements to chunk and merge the data into a single master raw table, successfully bypassing memory constraints.

Data Cleaning \& Optimization (02\_data\_cleaning.sql): Wrote a master SQL cleaning script to standardize formats, filter out corrupted/maintenance rows, and drop heavy geospatial arrays (latitude/longitude) to optimize downstream BI rendering speeds.

Feature Engineering (03\_feature\_engineering.sql): Engineered necessary time-intelligence metrics (ride\_hour, ride\_length\_minutes) and custom nested CASE statements directly in SQL to force chronological sorting within Power BI, bypassing circular dependency errors.

📊 Key Findings \& Behavioral Analysis
The data model revealed distinct behavioral pillars separating our rider segments:

The Commuter Spike vs. The Steady Cruiser: Members exhibit sharp, highly structured usage peaks at 8:00 AM and 5:00 PM on weekdays, indicating they primarily use the service for commuting. Casual riders display a smooth, bell-curve usage pattern building throughout the afternoon.

The Weekend Warriors: Casual ridership explodes on the weekends, peaking heavily on Friday, Saturday, and Sunday, whereas Member usage remains relatively flat across all seven days.

The Behavior Metric: On average, Casual riders spend 23.01 minutes per trip, compared to Members who average just 12.07 minutes, reinforcing that Members ride for utility and speed while Casuals ride for recreation.

The Dockless Trend: A significant volume of trips lacked physical starting stations, highlighting a strong preference among Casual riders for dockless electric bikes. Isolating physical stations revealed the top starting locations for Casual riders are premium coastal/leisure spots (e.g., Kingsbury St \& Kinzie St, Navy Pier).

💡 Strategic Recommendations
To convert the weekend, leisure-focused Casual riders into Annual Members, Cyclistic should implement the following targeted initiatives:

The "Weekend Warrior" Tier: Introduce a modified annual membership designed specifically for the casual demographic. Offer a tier that provides unlimited weekend rides and extended ride-duration limits (e.g., 45 minutes) to accommodate their 23-minute average ride time.

Waive Dockless E-Bike Fees for Members: Casual riders heavily utilize dockless e-bikes. By making e-bike unlocks free only for Annual Members, the company creates an immediate financial incentive for casual e-bike users to convert.

Targeted Physical Marketing: Reallocate digital ad spend toward high-visibility physical ad space (kiosks, station wraps) explicitly at Kingsbury St, Navy Pier, and DuSable Lake Shore stations. These are the guaranteed physical chokepoints for Casual riders. Launch this campaign in early Spring to capture momentum before the summer peak.

