import React from 'react'
import GoalCard from './GoalCard'

function GoalList({ goals, onDelete, onUpdate }) {
  if (!goals.length) {
    return <p>No goals found. Add a new goal to get started!</p>
  }

  return (
    <div className="goal-list">
      {goals.map(goal => (
        <GoalCard 
          key={goal.id} 
          goal={goal} 
          onDelete={onDelete} 
          onUpdate={onUpdate} 
        />
      ))}
    </div>
  )
}

export default GoalList