import React from 'react'
import { Switch, Route } from 'react-router-dom'
import Home from './Home'
import Feed from './Feed'
import Create from './Create'
import Token from './Token'
import Blog from './Blog'

const Main = () => (
    <main>
      <Switch>
        <Route exact path='/' component={Home}/>
        <Route path='/Feed' component={Feed}/>
        <Route path='/Create' component={Create}/>
        <Route path='/Token' component={Token}/>
        <Route path='/Blog' component={Blog}/>
      </Switch>
    </main>
  )
  
  export default Main