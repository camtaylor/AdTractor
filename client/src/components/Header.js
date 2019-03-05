import React, { Component } from 'react';
import {Nav, Navbar, Button, Form, ButtonToolbar} from 'react-bootstrap';

class header extends Component {
    render() {
        return(
          <Navbar bg="dark" variant="dark">
          <Navbar.Brand href="/">AdsTracktor</Navbar.Brand>
          <Nav className="mr-auto">
            <Nav.Link href="/">Home</Nav.Link>
            <Nav.Link href="/Feed">Feed</Nav.Link>
            <Nav.Link href="/Token">Token Store</Nav.Link>
            <Nav.Link href="/Blog">Blog</Nav.Link>
          </Nav>
          <Form inline>
            <ButtonToolbar>
              <Button variant="outline-light" href="/Create">+Creat AdTract</Button>
            </ButtonToolbar>
          </Form>
        </Navbar>
        );
    }
}

export default header;