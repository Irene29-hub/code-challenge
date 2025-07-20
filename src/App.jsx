import { useState, useEffect } from 'react'
import './App.css'
import GoalList from './Components/GoalList'
import AddGoalForm from './Components/AddGoalForm'
import DepositForm from './Components/DepositForm'
import Overview from './Components/Overview'

function App() {
  const [goals, setGoals] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  
  useEffect(() => {
    fetchGoals()
  }, [])
  
  const fetchGoals = async () => {
    try {
      console.log('Fetching goals...')
      const response = await fetch('http://localhost:3000/goals')
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`)
      }
      const data = await response.json()
      console.log('Goals fetched:', data)
      setGoals(data)
      setLoading(false)
    } catch (error) {
      console.error('Error fetching goals:', error)
      setError('Failed to fetch goals. Make sure json-server is running with "npm run server"')
      setLoading(false)
    }
  }
  
  const addGoal = async (newGoal) => {
    try {
      console.log('Adding new goal:', newGoal)
      const response = await fetch('http://localhost:3000/goals', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newGoal),
      })
      
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`)
      }
      
      const data = await response.json()
      console.log('Goal added:', data)
      setGoals([...goals, data])
    } catch (error) {
      console.error('Error adding goal:', error)
      alert('Failed to add goal. Make sure json-server is running.')
    }
  }
  
  const updateGoal = async (id, updatedGoal) => {
    try {
      console.log('Updating goal:', id, updatedGoal)
      const response = await fetch(`http://localhost:3000/goals/${id}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(updatedGoal),
      })
      
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`)
      }
      
      const data = await response.json()
      console.log('Goal updated:', data)
      setGoals(goals.map(goal => goal.id === id ? data : goal))
    } catch (error) {
      console.error('Error updating goal:', error)
      alert('Failed to update goal. Make sure json-server is running.')
    }
  }
  
  const deleteGoal = async (id) => {
    try {
      console.log('Deleting goal:', id)
      const response = await fetch(`http://localhost:3000/goals/${id}`, {
        method: 'DELETE',
      })
      
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`)
      }
      
      console.log('Goal deleted:', id)
      setGoals(goals.filter(goal => goal.id !== id))
    } catch (error) {
      console.error('Error deleting goal:', error)
      alert('Failed to delete goal. Make sure json-server is running.')
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
      ) : error ? (
        <div className="error-message">
          <p>{error}</p>
          <button onClick={fetchGoals}>Retry</button>
        </div>
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