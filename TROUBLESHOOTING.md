# Troubleshooting Guide

If you're having issues with the Goal Management Dashboard, particularly with adding goals, follow these steps:

## 1. Check if json-server is running

The application requires json-server to be running to handle API requests.

```bash
# Start json-server in a separate terminal
npm run server
```

You should see output indicating that json-server is running on port 3000.

## 2. Verify the API is working

Run the test script to check if the API is working correctly:

```bash
node test-api.js
```

This will attempt to fetch goals and add a test goal, logging the results.

## 3. Check browser console for errors

Open your browser's developer tools (F12 or right-click > Inspect) and check the Console tab for any error messages.

Common errors:
- `Failed to fetch`: json-server is not running or there's a CORS issue
- `Unexpected token in JSON`: The db.json file might be malformed

## 4. Restart both servers

Sometimes a clean restart can fix issues:

```bash
# Kill any running servers
pkill -f json-server
pkill -f vite

# Start both servers using the convenience script
./start-app.sh
```

## 5. Check db.json format

Make sure your db.json file is properly formatted:

```json
{
  "goals": [
    {
      "id": "1",
      "name": "Example Goal",
      "targetAmount": 1000,
      "savedAmount": 0,
      "category": "Example",
      "deadline": "2025-12-31",
      "createdAt": "2024-07-15"
    }
  ]
}
```

## 6. CORS issues

If you're seeing CORS errors in the console, make sure the CORS middleware is being used:

```bash
# Check if the middleware file exists
ls -la cors-middleware.js

# Make sure package.json has the correct server script
grep server package.json
```

## 7. Try a different port

If port 3000 is already in use, you can specify a different port:

```bash
json-server --watch db.json --port 3001 --middlewares ./cors-middleware.js
```

Then update the API URLs in App.jsx to use the new port.

## 8. Clear browser cache

Sometimes cached data can cause issues. Try clearing your browser cache or opening the app in an incognito/private window.