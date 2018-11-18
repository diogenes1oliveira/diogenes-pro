import React from 'react';
import styled from 'styled-components';

import { Row, Col } from 'Components/Layout';

const StyledRow = styled(Row)`
  margin: ${({theme}) => theme.spacing};
`

const Title = styled.h2`
  color: ${props => props.theme.primaryColor};
  font-family: ${({theme}) => theme.baseFont};
  font-size: 1.6em;
  font-weight: bold;
`;

const AboutMe = styled.section`
  color: ${props => props.theme.textColor};
  font-family: ${({theme}) => theme.baseFont};
  p {
    font-size: 1.3em;
  }
`;


export default function Banner() {
  return (
    <StyledRow>
      <Col md={6} verticalCenter={true}>
        <Title>Hi, I'm Diógenes Oliveira</Title>
        <AboutMe>
          <p>
            Physicist by degree and developer by heart.
          </p>
          <p>
            I have experience in fields like cloud infrastructure management,
            data science, business intelligence, predictive models, geolocation,
            georreferencing and full stack development.
          </p>
        </AboutMe>
      </Col>
      <Col md={6}>
      </Col>
    </StyledRow>
  );
}
