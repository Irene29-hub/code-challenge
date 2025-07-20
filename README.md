# Goal Management Dashboard

A React application for managing financial goals, tracking progress, and making deposits.

## Features

- Add new financial goals with target amounts, categories, and deadlines
- Track progress for each goal with visual progress bars
- Make deposits to any goal
- View overview statistics of all goals
- Edit and delete goals
- Warning indicators for goals with approaching deadlines
- Overdue indicators for goals past their deadlines

## Technologies Used

- React
- Vite
- json-server for REST API simulation

## Getting Started

### Prerequisites

- Node.js and npm installed

### Installation

1. Clone the repository
2. Install dependencies:
   ```
   npm install
   ```

### Running the Application

1. Start the json-server (in one terminal):
   ```
   npm run server
   ```

2. Start the React application (in another terminal):
   ```
   npm run dev
   ```

3. Open your browser and navigate to the URL shown in the terminal (typically http://localhost:5173)

## Data Structure

The application uses a db.json file with the following structure for goals:

```json
{
  "goals": [
    {
      "id": "1",
      "name": "Travel",
      "targetAmount": 5000,
      "savedAmount": 3200,
      "category": "Travel",
      "deadline": "2025-12-31",
      "createdAt": "2024-01-15"
    }
  ]
}
```

## Usage

- **Add a Goal**: Fill out the "Add New Goal" form with name, target amount, category, and deadline
- **Make a Deposit**: Select a goal and enter an amount in the "Make a Deposit" form
- **Edit a Goal**: Click the "Edit" button on any goal card
- **Delete a Goal**: Click the "Delete" button on any goal card
- **View Progress**: Each goal shows a progress bar and percentage complete
- **Check Overview**: The overview section shows total goals, total saved, completed goals, and goals with warnings