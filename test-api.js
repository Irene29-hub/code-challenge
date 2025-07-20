// Simple script to test the json-server API
const testGoal = {
  id: Date.now().toString(),
  name: "Test Goal",
  targetAmount: 1000,
  savedAmount: 0,
  category: "Test",
  deadline: "2025-12-31",
  createdAt: new Date().toISOString().split('T')[0]
};

// Function to test adding a goal
async function testAddGoal() {
  try {
    console.log('Testing API: Adding a goal...');
    const response = await fetch('http://localhost:3000/goals', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(testGoal),
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    console.log('Goal added successfully:', data);
    return data.id;
  } catch (error) {
    console.error('Error adding goal:', error);
    return null;
  }
}

// Function to test fetching goals
async function testFetchGoals() {
  try {
    console.log('Testing API: Fetching goals...');
    const response = await fetch('http://localhost:3000/goals');
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    console.log('Goals fetched successfully:', data);
  } catch (error) {
    console.error('Error fetching goals:', error);
  }
}

// Run the tests
async function runTests() {
  await testFetchGoals();
  const addedId = await testAddGoal();
  if (addedId) {
    console.log(`Goal added with ID: ${addedId}`);
  }
  await testFetchGoals();
}

runTests();