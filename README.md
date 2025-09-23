# Project Overview

Atlys is a platform providing simplified visa processing services. 
Customers pay for visa applications, but sometimes payments fail due to issues like insufficient funds or network errors.
Currently, refund processing requires manual work — failed payments must be identified and fed into a bot for refund execution.

# Goal:

Design a small SQL-based project that:
- Stores data for users, employees, orders, payments, and refunds.
- Identifies failed payments that still need to be refunded.
- Produces an export-ready dataset for a refund bot.

# Schema Design

Tables:

- users → Stores user info.
- employees → Tracks visa officers and refund specialists.
- orders → Captures visa orders (country, visa_type, amount).
- payments → Logs payment attempts and status (SUCCESS/FAILED).
- refunds → Logs refunds initiated/completed.

# Sample Data

- 10 users (Aarav, Priya, Rohan, etc.)
- 8 employees (Visa officers + refund specialists)
- 
  32 orders with:
- 4 visa types → Tourist, Business, Tourist Express, Business Express
- Countries → US, UK, Canada, Australia, Japan, Germany, Vietnam, Sri Lanka
- Price logic → Business Express > Tourist Express > Business > Tourist and US > UK > Canada > Australia > Japan > Germany > Vietnam > Sri Lanka
- Payments → Mix of SUCCESS + FAILED for variety.
- Refunds → Some COMPLETED, some INITIATED, some not refunded yet.

# Practice Questions
A set of 20 progressively harder SQL questions is included in Atlys Payments _ Questions.pdf

# Example Query
Q.20 : Build an export-ready dataset for the refund bot. Select payment_id, user name, country, visa_type, amount, payment_date ONLY for failed payments where no COMPLETED refund exists. Ordered by payment_date ASC.

<img width="1068" height="257" alt="Screenshot 2025-09-24 at 1 09 36 AM" src="https://github.com/user-attachments/assets/35c9e06e-8b8e-43f1-a005-f465e281ee17" />

<img width="1068" height="186" alt="Screenshot 2025-09-24 at 1 10 12 AM" src="https://github.com/user-attachments/assets/ff262566-12ce-4ba7-b771-4726dd28d737" />


