import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';

const LogoName = styled.span`
  color: ${({theme}) => theme.secondaryColor};
`;

const LogoSurname = styled.span`
  color: white;
`;

const Logo = styled.div`
  font-size: 150%;
  font-weight: bold;
  text-transform: lowercase;
  .link {
    text-decoration: none;
  }
`;

const Subtitle = styled.div`
  color: white;
  text-align: right;
  text-transform: lowercase;
`;

const Container = styled.div`
  align-items: center;
  background-color: rgba(0, 0, 0, 0.5);
  display: grid;
  font-family: monospace;
  font-size: 20px;
  grid-template-rows: 1.5em 1fr;
  padding: 10px;

  @media screen and (min-width: 768px) {
    grid-template-columns: 2fr 3fr;
  }
`;

export default function Header(props) {
  return <Container>
    <Logo>
      <Link className='link' to='/'>
        <LogoName>Diógenes</LogoName>
        <LogoSurname>Oliveira</LogoSurname>
      </Link>
    </Logo>
    <Subtitle>Under construction</Subtitle>
  </Container>;
}
