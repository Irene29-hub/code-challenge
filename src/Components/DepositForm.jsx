import React, { useState } from 'react'

function DepositForm({ goals, onDeposit }) {
  const [formData, setFormData] = useState({
    goalId: '',
    amount: ''
  })
  
  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData({
      ...formData,
      [name]: value
    })
  }
  
  const handleSubmit = (e) => {
    e.preventDefault()
    
    if (!formData.goalId || !formData.amount) {
      return
    }
    
    onDeposit(formData.goalId, Number(formData.amount))
    
    // Reset form
    setFormData({
      goalId: '',
      amount: ''
    })
  }
  
  return (
    <div className="form-container">
      <h2>Make a Deposit</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="goalId">Select Goal:</label>
          <select
            id="goalId"
            name="goalId"
            value={formData.goalId}
            onChange={handleChange}
            required
          >
            <option value="">-- Select a goal --</option>
            {goals.map(goal => (
              <option key={goal.id} value={goal.id}>
                {goal.name} (${goal.savedAmount} of ${goal.targetAmount})
              </option>
            ))}
          </select>
        </div>
        
        <div className="form-group">
          <label htmlFor="amount">Amount ($):</label>
          <input
            type="number"
            id="amount"
            name="amount"
            value={formData.amount}
            onChange={handleChange}
            min="1"
            required
          />
        </div>
        
        <button type="submit" className="btn-submit">Make Deposit</button>
      </form>
    </div>
  )
}

export default DepositForm