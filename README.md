# 🎟️ Assembly-TicketCalculator

This project is a MIPS Assembly program that calculates the total ticket price for a movie based on the user's age and the number of tickets requested. It includes conditional pricing for minors, adults, and seniors, and simulates real-world logic involving adult supervision for minors.

## 💡 Features

- Takes user input for:
  - Age
  - Number of tickets
- Calculates pricing based on age group:
  - **Standard Price**: $10.00 per ticket
  - **Minors (under 18)**: $1.00 discount per ticket **plus one general admission adult ticket required**
  - **Seniors (over 65)**: 15% discount on total
- Displays the final total in proper dollar-and-cent format
- Implements branching, arithmetic, and formatted output logic

## 🛠 Technologies Used

- **MIPS Assembly Language**
- **MARS Simulator** (MIPS Assembler and Runtime Simulator)
- Syscall-based input/output handling

## 🧠 Program Logic

1. Prompt user for age and number of tickets.
2. Apply pricing rules based on age:
   - Minor: `(ticketPrice - $1.00) * numTickets + ticketPrice (for adult)`
   - Senior: `ticketPrice * numTickets * 85%`
   - Standard: `ticketPrice * numTickets`
3. Convert total from cents to dollars/cents for display.

## 📊 Flowchart

[Start (2).pdf](Start%20%282%29.pdf)


## 🧪 Example
Age: 16
Tickets: 2
Total: $28.00

## 🚀 How to Run

1. Open `TicketCalculator.asm` in **MARS Simulator**.
2. Assemble and run the program.
3. Enter age and ticket count when prompted.
4. View the total price output in the console.


