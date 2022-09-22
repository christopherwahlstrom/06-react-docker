import { useState } from 'react'
import reactLogo from './assets/react.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="App">
      <h1> React + Docker demo </h1>
      <div className="card">
        <p>
			This project should be deployed using Docker.
		</p>
      </div>
    </div>
  )
}

export default App
