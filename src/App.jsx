import { useState, useEffect } from 'react'
import './App.css'
import GoalList from './Components/GoalList'
import AddGoalForm from './Components/AddGoalForm'
import DepositForm from './Components/DepositForm'
import Overview from './Components/Overview'

function App() {
  const [goals, setGoals] = useState([])
  const [loading, setLoading] = useState(true)
  
  useEffect(() => {
    fetchGoals()
  }, [])
  
  const fetchGoals = async () => {
    try {
      const response = await fetch('http://localhost:3000/goals')
      const data = await response.json()
      setGoals(data)
      setLoading(false)
    } catch (error) {
      console.error('Error fetching goals:', error)
      setLoading(false)
    }
  }
  
  const addGoal = async (newGoal) => {
    try {
      const response = await fetch('http://localhost:3000/goals', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newGoal),
      })
      const data = await response.json()
      setGoals([...goals, data])
    } catch (error) {
      console.error('Error adding goal:', error)
    }
  }
  
  const updateGoal = async (id, updatedGoal) => {
    try {
      const response = await fetch(`http://localhost:3000/goals/${id}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(updatedGoal),
      })
      const data = await response.json()
      setGoals(goals.map(goal => goal.id === id ? data : goal))
    } catch (error) {
      console.error('Error updating goal:', error)
    }
  }
  
  const deleteGoal = async (id) => {
    try {
      await fetch(`http://localhost:3000/goals/${id}`, {
        method: 'DELETE',
      })
      setGoals(goals.filter(goal => goal.id !== id))
    } catch (error) {
      console.error('Error deleting goal:', error)
    }
  }
  
  const makeDeposit = async (id, amount) => {
    const goal = goals.find(g => g.id === id)
    if (!goal) return
    
    const updatedAmount = goal.savedAmount + Number(amount)
    await updateGoal(id, { savedAmount: updatedAmount })
  }

  return (
    <div className="app-container">
      <h1>SMART GOAL PLANNER</h1>
      
      {loading ? (
        <p>Loading goals...</p>
      ) : (
        <>
          <Overview goals={goals} />
          <div className="main-content">
            <div className="goals-section">
              <h2>Your Goals</h2>
              <GoalList 
                goals={goals} 
                onDelete={deleteGoal} 
                onUpdate={updateGoal} 
              />
            </div>
            <div className="forms-section">
              <AddGoalForm onAddGoal={addGoal} />
              <DepositForm goals={goals} onDeposit={makeDeposit} />
            </div>
          </div>
        </>
      )}
    </div>
  )
}

export default App
