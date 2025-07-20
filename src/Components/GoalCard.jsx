import React, { useState } from 'react'

function GoalCard({ goal, onDelete, onUpdate }) {
  const [isEditing, setIsEditing] = useState(false)
  const [editedGoal, setEditedGoal] = useState({...goal})
  
  const progressPercentage = Math.min(Math.round((goal.savedAmount / goal.targetAmount) * 100), 100)
  const remainingAmount = goal.targetAmount - goal.savedAmount
  
  // Calculate days remaining until deadline
  const today = new Date()
  const deadline = new Date(goal.deadline)
  const daysRemaining = Math.ceil((deadline - today) / (1000 * 60 * 60 * 24))
  
  const isCompleted = goal.savedAmount >= goal.targetAmount
  const isNearDeadline = daysRemaining <= 30 && !isCompleted
  const isOverdue = daysRemaining < 0 && !isCompleted
  
  const handleChange = (e) => {
    const { name, value } = e.target
    setEditedGoal({
      ...editedGoal,
      [name]: name === 'targetAmount' ? Number(value) : value
    })
  }
  
  const handleSubmit = (e) => {
    e.preventDefault()
    onUpdate(goal.id, editedGoal)
    setIsEditing(false)
  }
  
  return (
    <div className={`goal-card ${isCompleted ? 'completed' : ''} ${isOverdue ? 'overdue' : ''} ${isNearDeadline ? 'warning' : ''}`}>
      {isEditing ? (
        <form onSubmit={handleSubmit} className="edit-form">
          <div>
            <label>Name:</label>
            <input 
              type="text" 
              name="name" 
              value={editedGoal.name} 
              onChange={handleChange} 
              required 
            />
          </div>
          <div>
            <label>Target Amount:</label>
            <input 
              type="number" 
              name="targetAmount" 
              value={editedGoal.targetAmount} 
              onChange={handleChange} 
              required 
              min="1"
            />
          </div>
          <div>
            <label>Category:</label>
            <input 
              type="text" 
              name="category" 
              value={editedGoal.category} 
              onChange={handleChange} 
              required 
            />
          </div>
          <div>
            <label>Deadline:</label>
            <input 
              type="date" 
              name="deadline" 
              value={editedGoal.deadline} 
              onChange={handleChange} 
              required 
            />
          </div>
          <div className="form-actions">
            <button type="submit">Save</button>
            <button type="button" onClick={() => setIsEditing(false)}>Cancel</button>
          </div>
        </form>
      ) : (
        <>
          <div className="goal-header">
            <h3>{goal.name}</h3>
            <span className="category">{goal.category}</span>
          </div>
          
          <div className="goal-progress">
            <div className="progress-bar">
              <div 
                className="progress-fill" 
                style={{ width: `${progressPercentage}%` }}
              ></div>
            </div>
            <div className="progress-text">
              ${goal.savedAmount} of ${goal.targetAmount} ({progressPercentage}%)
            </div>
          </div>
          
          <div className="goal-details">
            <p>Remaining: ${remainingAmount}</p>
            <p>
              {isCompleted ? (
                <span className="status completed">Completed!</span>
              ) : isOverdue ? (
                <span className="status overdue">Overdue!</span>
              ) : (
                <span className={`status ${isNearDeadline ? 'warning' : ''}`}>
                  {daysRemaining} days remaining
                </span>
              )}
            </p>
          </div>
          
          <div className="goal-actions">
            <button onClick={() => setIsEditing(true)}>Edit</button>
            <button onClick={() => onDelete(goal.id)}>Delete</button>
          </div>
        </>
      )}
    </div>
  )
}

export default GoalCard