import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';

import NavBar from 'Components/NavBar';
import { Row, Col } from 'Components/Layout';

import logoSrc from 'Images/icons/logo.png';

const StyledRow = styled(Row)`
  background-color: ${({theme}) => theme.overlayColor};
  font: 16px ${({theme}) => theme.baseFont};
  margin: ${({theme}) => theme.spacing};

  h1 {
    font-size: 30px;
    margin: 0;
    img {
      display: inline-block;
      height: 1.2em;
      vertical-align: middle;
    }
  }
`;

export default function Header(props) {
  return <StyledRow>
    <Col xs={6} verticalCenter={true}>
      <h1>
        <Link to='/'>
          <img src={logoSrc} alt='diógenes' title='Diógenes Oliveira' />
        </Link>
      </h1>
    </Col>
    <Col xs={6} verticalCenter={true}>
      <NavBar />
    </Col>
  </StyledRow>;
}
