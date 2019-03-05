import React, { Component } from "react";
import { Container, Row, Col, Alert, Form, Button } from "react-bootstrap";

class create extends Component {
  render() {
    return (
      <div>
        <Container>
          <Row>
            <Col>
              <h1>AdTractor Creator</h1>
            </Col>
            <Col>
              <h4>Account:</h4>
              <Alert variant="success">
                0x56004ADC9ddc9A325AB0391C8273BF8Fdd48d4ac
              </Alert>
            </Col>
          </Row>
          <Form>
            <Form.Group as={Row} controlId="formHorizontalEmail">
              <Form.Label column sm={2}>
                AdTractor Title
              </Form.Label>
              <Col sm={10}>
                <Form.Control type="email" placeholder="Title" />
              </Col>
            </Form.Group>

            <Form.Group as={Row} controlId="formHorizontalEmail">
              <Form.Label column sm={2}>
                URL(Optional)
              </Form.Label>
              <Col sm={10}>
                <Form.Control type="url" placeholder="URL" />
              </Col>
            </Form.Group>
            <Form.Group controlId="exampleForm.ControlTextarea1">
              <Form.Label>Description (Max Char: 300)</Form.Label>
              <Form.Control as="textarea" rows="3" />
            </Form.Group>
            <fieldset>
              <Form.Group as={Row}>
                <Form.Label as="legend" column sm={2}>
                  Tags
                </Form.Label>
                <Col sm={10}>
                  <Form.Check
                    type="radio"
                    label="first radio"
                    name="formHorizontalRadios"
                    id="formHorizontalRadios1"
                  />
                  <Form.Check
                    type="radio"
                    label="second radio"
                    name="formHorizontalRadios"
                    id="formHorizontalRadios2"
                  />
                  <Form.Check
                    type="radio"
                    label="third radio"
                    name="formHorizontalRadios"
                    id="formHorizontalRadios3"
                  />
                </Col>
              </Form.Group>
            </fieldset>

            <Form.Group as={Row}>
              <Col sm={{ span: 10, offset: 2 }}>
                <Button type="submit">Create</Button>
              </Col>
            </Form.Group>
          </Form>
        </Container>
      </div>
    );
  }
}

export default create;
