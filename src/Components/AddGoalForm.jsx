import React, { useState } from 'react'

function AddGoalForm({ onAddGoal }) {
  const [formData, setFormData] = useState({
    name: '',
    targetAmount: '',
    savedAmount: 0,
    category: '',
    deadline: '',
  })
  
  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData({
      ...formData,
      [name]: name === 'targetAmount' ? Number(value) : value
    })
  }
  
  const handleSubmit = (e) => {
    e.preventDefault()
    
    // Convert targetAmount to number to ensure it's stored correctly
    const newGoal = {
      ...formData,
      // Generate a temporary ID (json-server will replace this)
      id: Date.now().toString(),
      targetAmount: Number(formData.targetAmount),
      savedAmount: Number(formData.savedAmount),
      createdAt: new Date().toISOString().split('T')[0]
    }
    
    console.log('Submitting new goal:', newGoal)
    onAddGoal(newGoal)
    
    // Reset form
    setFormData({
      name: '',
      targetAmount: '',
      savedAmount: 0,
      category: '',
      deadline: '',
    })
  }
  
  return (
    <div className="form-container">
      <h2>Add New Goal</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="name">Goal Name:</label>
          <input
            type="text"
            id="name"
            name="name"
            value={formData.name}
            onChange={handleChange}
            required
          />
        </div>
        
        <div className="form-group">
          <label htmlFor="targetAmount">Target Amount ($):</label>
          <input
            type="number"
            id="targetAmount"
            name="targetAmount"
            value={formData.targetAmount}
            onChange={handleChange}
            min="1"
            required
          />
        </div>
        
        <div className="form-group">
          <label htmlFor="category">Category:</label>
          <input
            type="text"
            id="category"
            name="category"
            value={formData.category}
            onChange={handleChange}
            required
          />
        </div>
        
        <div className="form-group">
          <label htmlFor="deadline">Deadline:</label>
          <input
            type="date"
            id="deadline"
            name="deadline"
            value={formData.deadline}
            onChange={handleChange}
            required
          />
        </div>
        
        <button type="submit" className="btn-submit">Add Goal</button>
      </form>
    </div>
  )
}

export default AddGoalForm