import React from 'react';
import styled from 'styled-components';

import { Row, Col } from 'Components/Layout';


const StyledRow = styled(Row)`
  background-color: ${({theme}) => theme.overlayColor};
  color: ${({theme}) => theme.textColor};
  font: 16px ${({theme}) => theme.baseFont};
  margin: ${({theme}) => theme.spacing};
`;

const StyledLink = styled.a`
  color: ${({theme}) => theme.secondaryColor};
  text-decoration: none;
`;

export default function Footer(props) {
  return (
    <StyledRow>
      <Col xs={6}>
        © 2018 <StyledLink href="https://diogenes.pro">diogenes.pro</StyledLink>
      </Col>
      <Col xs={6} textAlign='right'>
        <StyledLink href="mailto:diogenesoliveira.dev@gmail.com">Email Me</StyledLink>
      </Col>
    </StyledRow>
  )
}
