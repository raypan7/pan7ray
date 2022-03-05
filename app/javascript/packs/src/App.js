import React, { Component } from 'react';
import NavBar from './src/components/navbar';
import Counters from './src/components/counters';

class App extends Component {
  render() {
    return (
      <React.Fragment>
        <NavBar />
        <main className='container'>
          <Counters />
        </main>
      </React.Fragment>
    );
  }
}

export default App;